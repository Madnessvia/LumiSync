module RZ_Code (
    input             clk,
    input             rst_n,
    input      [23:0] rgb,    // Color data in GRB order
    input             enable, // Enable transmission
    output            tx_done,// Signal indicating frame transmission is finished
    output            pwm_out // PWM output for WS2812 LEDs
);

//---------------------------------------------------------------------
// Timing Parameters (for a 65MHz clock)
//---------------------------------------------------------------------
localparam TOTAL_COUNT = 81; // Total cycles per bit period (0 to 81 => 82 cycles)
localparam T0H        = 26;   // High time for logic 0 (approx. 0.4µs)
localparam T1H        = 58;   // High time for logic 1 (approx. 0.9µs)

//---------------------------------------------------------------------
// Internal Registers
//---------------------------------------------------------------------
reg [31:0] cycle_count; // Counter for bit period timing
reg [4:0]  bit_index;   // Bit index for the 24-bit frame
reg        current_bit; // Current bit being transmitted
reg        pwm_reg;     // Registered PWM output

//---------------------------------------------------------------------
// Cycle Counter: Generates a fixed period for each bit transmission
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n || !enable)
        cycle_count <= 0;
    else if (cycle_count == TOTAL_COUNT)
        cycle_count <= 0;
    else
        cycle_count <= cycle_count + 1;
end

//---------------------------------------------------------------------
// Bit Extraction and Frame Sequencing
//---------------------------------------------------------------------
// The bit_index counts from 0 to 23. On each cycle period end, we latch
// the next bit from the rgb input (MSB first) and flag when the 24th bit is sent.
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bit_index   <= 0;
        current_bit <= 0;
    end
    else if (enable) begin
        if (cycle_count == TOTAL_COUNT) begin
            if (bit_index < 23) begin
                bit_index   <= bit_index + 1;
                current_bit <= rgb[23 - (bit_index + 1)];
            end else begin
                bit_index <= 0;
            end
        end
    end
end

// Signal that the entire 24-bit frame has been transmitted.
// This assertion occurs at the moment the last bit's period ends.
assign tx_done = (cycle_count == TOTAL_COUNT) && (bit_index == 23);

//---------------------------------------------------------------------
// PWM Generation: Produces PWM output according to current_bit and timing
//---------------------------------------------------------------------
// For logic 1: output is high for the first T1H cycles.
// For logic 0: output is high for the first T0H cycles.
always @(posedge clk or negedge rst_n) begin
    if (!rst_n || !enable)
        pwm_reg <= 0;
    else begin
        if (current_bit) begin
            if (cycle_count <= T1H)
                pwm_reg <= 1;
            else
                pwm_reg <= 0;
        end else begin
            if (cycle_count <= T0H)
                pwm_reg <= 1;
            else
                pwm_reg <= 0;
        end
    end
end

assign pwm_out = pwm_reg;

endmodule
