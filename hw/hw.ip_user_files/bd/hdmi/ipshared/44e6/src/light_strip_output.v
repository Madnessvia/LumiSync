module light_strip_output(
    input                     pclk,         // CMOS pixel clock, video clk 65M
    input                     reset,
    input                     hs,           // horizontal synchronization
    input                     vs,           // frame synchronization, active on falling edge
    input                     de,           // video valid
    input       [23:0]        data888,      // RGB888 data
    output                    light_rgb_data,
    output                    uart_data_en
);

    // ----------------------------------------------------------
    // RGB888 to RGB565 conversion for internal processing
    // ----------------------------------------------------------
    wire [4:0] r5 = data888[23:19];
    wire [5:0] g6 = data888[15:10];
    wire [4:0] b5 = data888[7:3];
    wire [15:0] rgb565 = {r5, g6, b5};

    // Inverted reset for internal use
    wire rst_n = ~reset;
    parameter green_fix = 8'd0;

    // ----------------------------------------------------------
    // Synchronize de and vs signals
    // ----------------------------------------------------------
    reg de_reg, vs_reg;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n) begin
            de_reg <= 1'b0;
            vs_reg <= 1'b0;
        end else begin
            de_reg <= de;
            vs_reg <= vs;
        end
    end

    // ----------------------------------------------------------
    // Counters for horizontal lines and pixels per line
    // ----------------------------------------------------------
    reg [11:0] h_cnt;
    reg [11:0] pixel_cnt;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || (!vs_reg && vs))
            h_cnt <= 12'd1;
        else if (!de_reg && de)
            h_cnt <= h_cnt + 1;
        else
            h_cnt <= h_cnt;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !de)
            pixel_cnt <= 12'd1;
        else if (de)
            pixel_cnt <= pixel_cnt + 1;
        else
            pixel_cnt <= pixel_cnt;
    end

    // ----------------------------------------------------------
    // Frame counter and frame valid generation
    // ----------------------------------------------------------
    reg [2:0] frame_cnt;
    reg frame_valid;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            frame_cnt <= 3'd0;
        else if (!vs_reg && vs)
            frame_cnt <= frame_cnt + 1;
        else
            frame_cnt <= frame_cnt;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            frame_valid <= 1'b0;
        else if (frame_cnt == 3'd4)  // Enable processing on the 5th frame
            frame_valid <= 1'b1;
        else
            frame_valid <= 1'b0;
    end

    // ----------------------------------------------------------
    // Top Region Processing (Region 1)
    // ----------------------------------------------------------
    reg [31:0] top_sum;
    reg [31:0] top_data_reg;
    reg        top_wr_en;
    reg [11:0] top_addr_wr, top_addr_rd, top_addr;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !de || !frame_valid || (h_cnt > 12'd99))
            top_sum <= 32'd0;
        else if (de) begin
            top_sum[31:21] <= top_sum[31:21] + rgb565[15:11];
            top_sum[20:10] <= top_sum[20:10] + rgb565[10:5] - green_fix;
            top_sum[9:0]   <= top_sum[9:0]   + rgb565[4:0];
            if (pixel_cnt % 33 == 0)
                top_sum <= 32'd0;
        end else
            top_sum <= top_sum;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid || (h_cnt > 12'd99)) begin
            top_wr_en    <= 1'b0;
            top_addr_wr  <= 12'd0;
            top_data_reg <= 32'd0;
        end else if (pixel_cnt % 33 == 0) begin
            top_wr_en    <= 1'b1;
            top_data_reg <= top_sum;
            top_addr_wr  <= top_addr_wr + 1;
        end else begin
            top_wr_en    <= 1'b0;
            top_data_reg <= top_data_reg;
            top_addr_wr  <= top_addr_wr;
        end
    end

    // Address selection for top region RAM
    always @(*) begin
        if (rst_n)
            top_addr = 12'd0;
        else if (frame_valid)
            top_addr = top_addr_wr;
        else
            top_addr = top_addr_rd;
    end

    // ----------------------------------------------------------
    // Button Region Processing (Region 4)
    // ----------------------------------------------------------
    reg [31:0] btn_sum;
    reg [31:0] btn_data_reg;
    reg        btn_wr_en;
    reg [11:0] btn_addr_wr, btn_addr_rd, btn_addr;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !de || !frame_valid || (h_cnt < 12'd668))
            btn_sum <= 32'd0;
        else if (de) begin
            btn_sum[31:21] <= btn_sum[31:21] + rgb565[15:11];
            btn_sum[20:10] <= btn_sum[20:10] + rgb565[10:5] - green_fix;
            btn_sum[9:0]   <= btn_sum[9:0]   + rgb565[4:0];
            if (pixel_cnt % 33 == 0)
                btn_sum <= 32'd0;
        end else
            btn_sum <= btn_sum;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid || (h_cnt < 12'd668)) begin
            btn_wr_en    <= 1'b0;
            btn_addr_wr  <= 12'd0;
            btn_data_reg <= 32'd0;
        end else if (pixel_cnt % 33 == 0) begin
            btn_wr_en    <= 1'b1;
            btn_data_reg <= btn_sum;
            btn_addr_wr  <= btn_addr_wr + 1;
        end else begin
            btn_wr_en    <= 1'b0;
            btn_data_reg <= btn_data_reg;
            btn_addr_wr  <= btn_addr_wr;
        end
    end

    // Address selection for button region RAM
    always @(*) begin
        if (rst_n)
            btn_addr = 12'd0;
        else if (frame_valid)
            btn_addr = btn_addr_wr;
        else
            btn_addr = btn_addr_rd;
    end

    // ----------------------------------------------------------
    // Right Region Processing (Region 2)
    // ----------------------------------------------------------
    reg [51:0] right_sum;
    reg [16:0] right_dev;
    reg [16:0] right_data_reg;
    reg        right_wr_en;
    reg [11:0] right_addr_wr, right_addr_rd, right_addr;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid) begin
            right_sum <= 52'd0;
            right_dev <= 17'd0;
        end else if (de && (pixel_cnt < 12'd100)) begin
            right_sum[51:35] <= right_sum[51:35] + rgb565[15:11];
            right_sum[34:17] <= right_sum[34:17] + rgb565[10:5] - green_fix;
            right_sum[16:0]  <= right_sum[16:0]  + rgb565[4:0];
            if ((h_cnt % 42 == 0) && (pixel_cnt == 12'd99)) begin
                right_sum <= 52'd0;
                right_dev[15:11] <= right_sum[51:35] / 4116;
                right_dev[10:5]  <= right_sum[34:17] / 4116;
                right_dev[4:0]   <= right_sum[16:0]  / 4116;
            end
        end else begin
            right_sum <= right_sum;
            right_dev <= right_dev;
        end
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid) begin
            right_wr_en    <= 1'b0;
            right_addr_wr  <= 12'd0;
            right_data_reg <= 17'd0;
        end else if ((h_cnt % 42 == 0) && (pixel_cnt == 12'd100)) begin
            right_wr_en    <= 1'b1;
            right_addr_wr  <= right_addr_wr + 1;
            right_data_reg <= right_dev;
        end else begin
            right_wr_en    <= 1'b0;
            right_data_reg <= 17'd0;
            right_addr_wr  <= right_addr_wr;
        end
    end

    // Address selection for right region RAM
    always @(*) begin
        if (rst_n)
            right_addr = 12'd0;
        else if (frame_valid)
            right_addr = right_addr_wr;
        else
            right_addr = right_addr_rd;
    end

    // ----------------------------------------------------------
    // Left Region Processing (Region 3)
    // ----------------------------------------------------------
    reg [51:0] left_sum;
    reg [16:0] left_dev;
    reg [16:0] left_data_reg;
    reg        left_wr_en;
    reg [11:0] left_addr_wr, left_addr_rd, left_addr;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid) begin
            left_sum <= 52'd0;
            left_dev <= 17'd0;
        end else if (de && (pixel_cnt > 12'd924)) begin
            left_sum[51:35] <= left_sum[51:35] + rgb565[15:11];
            left_sum[34:17] <= left_sum[34:17] + rgb565[10:5] - green_fix;
            left_sum[16:0]  <= left_sum[16:0]  + rgb565[4:0];
            if ((h_cnt % 42 == 0) && (pixel_cnt == 12'd1021)) begin
                left_sum <= 52'd0;
                left_dev[15:11] <= left_sum[51:35] / 4074;
                left_dev[10:5]  <= left_sum[34:17] / 4074;
                left_dev[4:0]   <= left_sum[16:0]  / 4074;
            end
        end else begin
            left_sum <= left_sum;
            left_dev <= left_dev;
        end
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || !frame_valid) begin
            left_wr_en    <= 1'b0;
            left_addr_wr  <= 12'd0;
            left_data_reg <= 17'd0;
        end else if ((h_cnt % 42 == 0) && (pixel_cnt == 12'd1022)) begin
            left_wr_en    <= 1'b1;
            left_addr_wr  <= left_addr_wr + 1;
            left_data_reg <= left_dev;
        end else begin
            left_wr_en    <= 1'b0;
            left_data_reg <= left_data_reg;
            left_addr_wr  <= left_addr_wr;
        end
    end

    // Address selection for left region RAM
    always @(*) begin
        if (rst_n)
            left_addr = 12'd0;
        else if (frame_valid)
            left_addr = left_addr_wr;
        else
            left_addr = left_addr_rd;
    end

    // ----------------------------------------------------------
    // Data Output and Read State Machine for LED Control
    // ----------------------------------------------------------
    // Wires for data read from the RAM modules
    wire [31:0] top_data;
    wire [31:0] btn_data;
    wire [31:0] right_data;
    wire [31:0] left_data;

    // Registers for controlling read sequence and FIFO output
    reg [7:0]  led_counter;
    reg [7:0]  h_pixel_counter;
    reg        read_start, read_start_reg;
    reg [51:0] accum_data;
    reg [15:0] fifo_rgb_out;
    reg        fifo_wr_en;

    // Simple state machine to sequence through reading from each region.
    reg [2:0] cur_state, next_state;
    localparam IDLE = 3'd0, R0 = 3'd1, R1 = 3'd2, R2 = 3'd3, R3 = 3'd4;

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n || frame_valid)
            read_start <= 1'b0;
        else if (frame_cnt == 3'd5)
            read_start <= 1'b1;
        else
            read_start <= 1'b0;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            read_start_reg <= 1'b0;
        else
            read_start_reg <= read_start;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            cur_state <= IDLE;
        else
            cur_state <= next_state;
    end

    always @(*) begin
        if (rst_n)
            next_state = IDLE;
        else begin
            case (cur_state)
                IDLE:   next_state = (read_start && !read_start_reg) ? R0 : IDLE;
                R0:     next_state = (led_counter == 8'd31) ? R1 : R0;
                R1:     next_state = (left_addr_rd == 12'd0)   ? R2 : R1;
                R2:     next_state = (led_counter == 8'd0)      ? R3 : R2;
                R3:     next_state = (right_addr_rd == 12'd17)  ? IDLE : R3;
                default: next_state = IDLE;
            endcase
        end
    end

    // Read state machine datapath (details simplified for clarity)
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n) begin
            btn_addr_rd    <= 12'd0;
            top_addr_rd    <= 12'd0;
            left_addr_rd   <= 12'd0;
            right_addr_rd  <= 12'd0;
            led_counter    <= 8'd0;
            h_pixel_counter<= 8'd0;
            accum_data     <= 52'd0;
            fifo_wr_en     <= 1'b0;
        end else begin
            case (cur_state)
                IDLE: begin
                    btn_addr_rd    <= 12'd0;
                    led_counter    <= 8'd0;
                    h_pixel_counter<= 8'd0;
                    accum_data     <= 52'd0;
                    fifo_wr_en     <= 1'b0;
                end
                R0: begin
                    if (h_pixel_counter == 8'd99) begin
                        h_pixel_counter <= 8'd0;
                        led_counter     <= led_counter + 1;
                        btn_addr_rd     <= led_counter;
                        // Divide accumulated sum to produce averaged RGB565 value
                        accum_data[51:35] <= accum_data[51:35] / 3300;
                        accum_data[34:17] <= accum_data[34:17] / 3300;
                        accum_data[16:0]  <= accum_data[16:0]  / 3300;
                        fifo_wr_en      <= 1'b0;
                        accum_data      <= 52'd0;
                        left_addr_rd    <= 12'd17;
                    end else if (h_pixel_counter == 8'd0) begin
                        fifo_rgb_out    <= accum_data[15:0];
                        fifo_wr_en      <= 1'b1;
                        left_addr_rd    <= 12'd17;
                    end else begin
                        btn_addr_rd     <= btn_addr_rd + 12'd31;
                        h_pixel_counter <= h_pixel_counter + 1;
                        accum_data[51:35] <= accum_data[51:35] + btn_data[31:21];
                        accum_data[34:17] <= accum_data[34:17] + btn_data[20:10];
                        accum_data[16:0]  <= accum_data[16:0]  + btn_data[9:0];
                        fifo_wr_en      <= 1'b0;
                    end
                end
                R1: begin
                    fifo_wr_en      <= 1'b1;
                    left_addr_rd    <= left_addr_rd - 1;
                    fifo_rgb_out    <= left_data[15:0];
                    accum_data      <= 52'd0;
                    top_addr_rd     <= 12'd31;
                    led_counter     <= 8'd31;
                    h_pixel_counter <= 8'd0;
                end
                R2: begin
                    if (h_pixel_counter == 8'd99) begin
                        h_pixel_counter <= 8'd0;
                        led_counter     <= led_counter - 1;
                        top_addr_rd     <= led_counter;
                        accum_data[51:35] <= accum_data[51:35] / 3300;
                        accum_data[34:17] <= accum_data[34:17] / 3300;
                        accum_data[16:0]  <= accum_data[16:0]  / 3300;
                        fifo_wr_en      <= 1'b0;
                        accum_data      <= 52'd0;
                        right_addr_rd   <= 12'd0;
                    end else if (h_pixel_counter == 8'd0) begin
                        fifo_rgb_out    <= accum_data[15:0];
                        fifo_wr_en      <= 1'b1;
                        right_addr_rd   <= 12'd0;
                    end else begin
                        top_addr_rd     <= top_addr_rd + 12'd31;
                        h_pixel_counter <= h_pixel_counter + 1;
                        accum_data[51:35] <= accum_data[51:35] + top_data[31:21];
                        accum_data[34:17] <= accum_data[34:17] + top_data[20:10];
                        accum_data[16:0]  <= accum_data[16:0]  + top_data[9:0];
                        fifo_wr_en      <= 1'b0;
                        right_addr_rd   <= 12'd0;
                    end
                end
                R3: begin
                    fifo_wr_en      <= 1'b1;
                    right_addr_rd   <= right_addr_rd + 1;
                    fifo_rgb_out    <= right_data[15:0];
                    btn_addr_rd     <= 12'd0;
                    led_counter     <= 8'd0;
                end
                default: fifo_wr_en <= 1'b0;
            endcase
        end
    end

    // ----------------------------------------------------------
    // FIFO Read Control and Data Transformation
    // ----------------------------------------------------------
    reg fifo_read_en;
    reg fifo_r_begin, fifo_r_begin_reg;
    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            fifo_r_begin <= 1'b0;
        else if (frame_cnt != 3'd4 && frame_cnt != 3'd5)
            fifo_r_begin <= 1'b1;
        else 
            fifo_r_begin <= 1'b0;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            fifo_r_begin_reg <= 1'b0;
        else
            fifo_r_begin_reg <= fifo_r_begin;
    end

    always @(posedge pclk or posedge rst_n) begin
        if (rst_n)
            fifo_read_en <= 1'b0;
        else if ((tx_done && uart_data_en) || (fifo_r_begin && !fifo_r_begin_reg))
            fifo_read_en <= 1'b1;
        else
            fifo_read_en <= 1'b0;
    end

    // Convert FIFO output RGB565 data to 24-bit data for transmission.
    wire [15:0] fifo_rgb_in;
    wire tx_done;
    wire fifo_empty;
    assign uart_data_en = fifo_r_begin && !fifo_empty;

    wire [4:0] out_r = fifo_rgb_in[15:11];
    wire [5:0] out_g = fifo_rgb_in[10:5];
    wire [4:0] out_b = fifo_rgb_in[4:0];

    reg [23:0] rgb_data_24;
    always @(*) begin
        if (rst_n)
            rgb_data_24 = 24'd0;
        else if ((out_r < 5'd4) && (out_g < 6'd4) && (out_b < 5'd4))
            rgb_data_24 = 24'd0;
        else
            rgb_data_24 = { fifo_rgb_in[4:0], 3'd0,
                            fifo_rgb_in[15:11], 3'd0,
                            (fifo_rgb_in[10:5] < 2 ? 6'd0 : fifo_rgb_in[10:5]), 2'd0 };
    end

    // ----------------------------------------------------------
    // Module Instantiations (RAM, Transmitter, FIFO)
    // ----------------------------------------------------------
    rbg_ram top_region (
        .addra   (top_addr),
        .clka    (pclk),
        .dina    (top_data_reg),
        .douta   (top_data),
        .wea     (top_wr_en)
    );

    rbg_ram btn_region (
        .addra   (btn_addr),
        .clka    (pclk),
        .dina    (btn_data_reg),
        .douta   (btn_data),
        .wea     (btn_wr_en)
    );

    rbg_ram right_region (
        .addra   (right_addr),
        .clka    (pclk),
        .dina    (right_data_reg),
        .douta   (right_data),
        .wea     (right_wr_en)
    );

    rbg_ram left_region (
        .addra   (left_addr),
        .clka    (pclk),
        .dina    (left_data_reg),
        .douta   (left_data),
        .wea     (left_wr_en)
    );

    RZ_Code light_strip_data (
        .clk     (pclk),
        .rst_n   (~rst_n),
        .enable   (uart_data_en),
        .tx_done (tx_done),
        .pwm_out (light_rgb_data),
        .rgb     (rgb_data_24)
    );

    fifo_fuck_asy rgb_out_data (
        .wr_clk  (pclk),
        .rd_clk  (pclk),
        .wr_en   (fifo_wr_en),
        .din     (fifo_rgb_out),
        .rd_en   (fifo_read_en),
        .dout    (fifo_rgb_in),
        .empty   (fifo_empty)
    );

endmodule
