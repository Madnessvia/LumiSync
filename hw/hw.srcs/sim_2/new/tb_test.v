`timescale 1 ps/1 ps
module tb_hdmi_wrapper;

  // 输入信号定义
  reg TMDS_IN_clk_n;
  reg TMDS_IN_clk_p;
  reg [2:0] TMDS_IN_data_n;
  reg [2:0] TMDS_IN_data_p;
  reg reset;
  reg sys_clk_i;
  reg usb_uart_rxd;

  // 输出及 inout 信号定义
  wire DDC_scl_io;
  wire DDC_sda_io;
  wire [14:0] DDR3_addr;
  wire [2:0] DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0] DDR3_ck_n;
  wire [0:0] DDR3_ck_p;
  wire [0:0] DDR3_cke;
  wire [1:0] DDR3_dm;
  wire [15:0] DDR3_dq;
  wire [1:0] DDR3_dqs_n;
  wire [1:0] DDR3_dqs_p;
  wire [0:0] DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire TMDS_OUT_clk_n;
  wire TMDS_OUT_clk_p;
  wire [2:0] TMDS_OUT_data_n;
  wire [2:0] TMDS_OUT_data_p;
  wire [0:0] hdmi_hpd;
  wire [0:0] hdmi_rx_txen;
  wire light_rgb_data_0;
  wire uart_data_en_0;
  wire usb_uart_txd;

  // 对于 inout 信号，测试台提供高阻态（仿真中未主动驱动），让 DUT 内部 IOBUF 正常工作
  assign DDC_scl_io = 1'bz;
  assign DDC_sda_io = 1'bz;
  assign DDR3_dq   = 16'hzzzz;
  assign DDR3_dqs_n = 2'bzz;
  assign DDR3_dqs_p = 2'bzz;

  // 实例化 DUT
  hdmi_wrapper uut (
    .DDC_scl_io(DDC_scl_io),
    .DDC_sda_io(DDC_sda_io),
    .DDR3_addr(DDR3_addr),
    .DDR3_ba(DDR3_ba),
    .DDR3_cas_n(DDR3_cas_n),
    .DDR3_ck_n(DDR3_ck_n),
    .DDR3_ck_p(DDR3_ck_p),
    .DDR3_cke(DDR3_cke),
    .DDR3_dm(DDR3_dm),
    .DDR3_dq(DDR3_dq),
    .DDR3_dqs_n(DDR3_dqs_n),
    .DDR3_dqs_p(DDR3_dqs_p),
    .DDR3_odt(DDR3_odt),
    .DDR3_ras_n(DDR3_ras_n),
    .DDR3_reset_n(DDR3_reset_n),
    .DDR3_we_n(DDR3_we_n),
    .TMDS_IN_clk_n(TMDS_IN_clk_n),
    .TMDS_IN_clk_p(TMDS_IN_clk_p),
    .TMDS_IN_data_n(TMDS_IN_data_n),
    .TMDS_IN_data_p(TMDS_IN_data_p),
    .TMDS_OUT_clk_n(TMDS_OUT_clk_n),
    .TMDS_OUT_clk_p(TMDS_OUT_clk_p),
    .TMDS_OUT_data_n(TMDS_OUT_data_n),
    .TMDS_OUT_data_p(TMDS_OUT_data_p),
    .hdmi_hpd(hdmi_hpd),
    .hdmi_rx_txen(hdmi_rx_txen),
    .light_rgb_data_0(light_rgb_data_0),
    .reset(reset),
    .sys_clk_i(sys_clk_i),
    .uart_data_en_0(uart_data_en_0),
    .usb_uart_rxd(usb_uart_rxd),
    .usb_uart_txd(usb_uart_txd)
  );

  // 生成系统时钟：周期为 10ps（根据实际需求可调整）
  initial begin
    sys_clk_i = 0;
    forever #5 sys_clk_i = ~sys_clk_i;
  end

  // 生成 TMDS 输入时钟 (差分时钟模拟)
  initial begin
    TMDS_IN_clk_p = 0;
    forever #10 TMDS_IN_clk_p = ~TMDS_IN_clk_p;
  end

  initial begin
    TMDS_IN_clk_n = 1;
    forever #10 TMDS_IN_clk_n = ~TMDS_IN_clk_n;
  end

  // 生成 TMDS 输入数据信号（简单的交替波形作为示例）
  initial begin
    TMDS_IN_data_p = 3'b000;
    TMDS_IN_data_n = 3'b111;
    forever begin
      #20;
      TMDS_IN_data_p = 3'b101;
      TMDS_IN_data_n = 3'b010;
      #20;
      TMDS_IN_data_p = 3'b010;
      TMDS_IN_data_n = 3'b101;
    end
  end

  // USB UART RX 信号保持空闲高电平（假设空闲状态为高）
  initial begin
    usb_uart_rxd = 1'b1;
  end

  // 复位信号：初始断言复位，并在 1000ps 后解除复位
  initial begin
    reset = 1;
    #1000;
    reset = 0;
  end

  // 打开波形文件，便于仿真调试
  initial begin
    $dumpfile("tb_hdmi_wrapper.vcd");
    $dumpvars(0, tb_hdmi_wrapper);
  end

  // 设定仿真结束时间
  initial begin
    #10000;
    $finish;
  end

endmodule
