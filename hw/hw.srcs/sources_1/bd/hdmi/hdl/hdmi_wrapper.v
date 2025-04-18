//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sun Apr  6 02:40:44 2025
//Host        : xuelihao running 64-bit major release  (build 9200)
//Command     : generate_target hdmi_wrapper.bd
//Design      : hdmi_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hdmi_wrapper
   (DDC_scl_io,
    DDC_sda_io,
    DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    TMDS_IN_clk_n,
    TMDS_IN_clk_p,
    TMDS_IN_data_n,
    TMDS_IN_data_p,
    TMDS_OUT_clk_n,
    TMDS_OUT_clk_p,
    TMDS_OUT_data_n,
    TMDS_OUT_data_p,
    hdmi_hpd,
    hdmi_rx_txen,
    light_rgb_data_0,
    reset,
    sys_clk_i,
    uart_data_en_0,
    uart_rtl_rxd,
    uart_rtl_txd);
  inout DDC_scl_io;
  inout DDC_sda_io;
  output [14:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [1:0]DDR3_dm;
  inout [15:0]DDR3_dq;
  inout [1:0]DDR3_dqs_n;
  inout [1:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  input TMDS_IN_clk_n;
  input TMDS_IN_clk_p;
  input [2:0]TMDS_IN_data_n;
  input [2:0]TMDS_IN_data_p;
  output TMDS_OUT_clk_n;
  output TMDS_OUT_clk_p;
  output [2:0]TMDS_OUT_data_n;
  output [2:0]TMDS_OUT_data_p;
  output [0:0]hdmi_hpd;
  output [0:0]hdmi_rx_txen;
  output light_rgb_data_0;
  input reset;
  input sys_clk_i;
  output uart_data_en_0;
  input uart_rtl_rxd;
  output uart_rtl_txd;

  wire DDC_scl_i;
  wire DDC_scl_io;
  wire DDC_scl_o;
  wire DDC_scl_t;
  wire DDC_sda_i;
  wire DDC_sda_io;
  wire DDC_sda_o;
  wire DDC_sda_t;
  wire [14:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [1:0]DDR3_dm;
  wire [15:0]DDR3_dq;
  wire [1:0]DDR3_dqs_n;
  wire [1:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire TMDS_IN_clk_n;
  wire TMDS_IN_clk_p;
  wire [2:0]TMDS_IN_data_n;
  wire [2:0]TMDS_IN_data_p;
  wire TMDS_OUT_clk_n;
  wire TMDS_OUT_clk_p;
  wire [2:0]TMDS_OUT_data_n;
  wire [2:0]TMDS_OUT_data_p;
  wire [0:0]hdmi_hpd;
  wire [0:0]hdmi_rx_txen;
  wire light_rgb_data_0;
  wire reset;
  wire sys_clk_i;
  wire uart_data_en_0;
  wire uart_rtl_rxd;
  wire uart_rtl_txd;

  IOBUF DDC_scl_iobuf
       (.I(DDC_scl_o),
        .IO(DDC_scl_io),
        .O(DDC_scl_i),
        .T(DDC_scl_t));
  IOBUF DDC_sda_iobuf
       (.I(DDC_sda_o),
        .IO(DDC_sda_io),
        .O(DDC_sda_i),
        .T(DDC_sda_t));
  hdmi hdmi_i
       (.DDC_scl_i(DDC_scl_i),
        .DDC_scl_o(DDC_scl_o),
        .DDC_scl_t(DDC_scl_t),
        .DDC_sda_i(DDC_sda_i),
        .DDC_sda_o(DDC_sda_o),
        .DDC_sda_t(DDC_sda_t),
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
        .uart_rtl_rxd(uart_rtl_rxd),
        .uart_rtl_txd(uart_rtl_txd));
endmodule
