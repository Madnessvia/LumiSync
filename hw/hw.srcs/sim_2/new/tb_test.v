`timescale 1 ps/1 ps
module tb_hdmi_wrapper;

  // �����źŶ���
  reg TMDS_IN_clk_n;
  reg TMDS_IN_clk_p;
  reg [2:0] TMDS_IN_data_n;
  reg [2:0] TMDS_IN_data_p;
  reg reset;
  reg sys_clk_i;
  reg usb_uart_rxd;

  // ����� inout �źŶ���
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

  // ���� inout �źţ�����̨�ṩ����̬��������δ�������������� DUT �ڲ� IOBUF ��������
  assign DDC_scl_io = 1'bz;
  assign DDC_sda_io = 1'bz;
  assign DDR3_dq   = 16'hzzzz;
  assign DDR3_dqs_n = 2'bzz;
  assign DDR3_dqs_p = 2'bzz;

  // ʵ���� DUT
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

  // ����ϵͳʱ�ӣ�����Ϊ 10ps������ʵ������ɵ�����
  initial begin
    sys_clk_i = 0;
    forever #5 sys_clk_i = ~sys_clk_i;
  end

  // ���� TMDS ����ʱ�� (���ʱ��ģ��)
  initial begin
    TMDS_IN_clk_p = 0;
    forever #10 TMDS_IN_clk_p = ~TMDS_IN_clk_p;
  end

  initial begin
    TMDS_IN_clk_n = 1;
    forever #10 TMDS_IN_clk_n = ~TMDS_IN_clk_n;
  end

  // ���� TMDS ���������źţ��򵥵Ľ��沨����Ϊʾ����
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

  // USB UART RX �źű��ֿ��иߵ�ƽ���������״̬Ϊ�ߣ�
  initial begin
    usb_uart_rxd = 1'b1;
  end

  // ��λ�źţ���ʼ���Ը�λ������ 1000ps ������λ
  initial begin
    reset = 1;
    #1000;
    reset = 0;
  end

  // �򿪲����ļ������ڷ������
  initial begin
    $dumpfile("tb_hdmi_wrapper.vcd");
    $dumpvars(0, tb_hdmi_wrapper);
  end

  // �趨�������ʱ��
  initial begin
    #10000;
    $finish;
  end

endmodule
