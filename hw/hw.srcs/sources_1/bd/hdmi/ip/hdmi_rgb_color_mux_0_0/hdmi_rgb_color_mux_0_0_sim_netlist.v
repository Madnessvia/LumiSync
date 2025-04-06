// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 27 21:54:17 2025
// Host        : xuelihao running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_rgb_color_mux_0_0/hdmi_rgb_color_mux_0_0_sim_netlist.v
// Design      : hdmi_rgb_color_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hdmi_rgb_color_mux_0_0,rgb_color_mux,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "rgb_color_mux,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module hdmi_rgb_color_mux_0_0
   (color_sel,
    data_in,
    data_out);
  input [2:0]color_sel;
  input [23:0]data_in;
  output [23:0]data_out;

  wire [2:0]color_sel;
  wire [23:0]data_in;
  wire [23:0]data_out;

  hdmi_rgb_color_mux_0_0_rgb_color_mux inst
       (.color_sel(color_sel),
        .data_in(data_in),
        .data_out(data_out));
endmodule

(* ORIG_REF_NAME = "rgb_color_mux" *) 
module hdmi_rgb_color_mux_0_0_rgb_color_mux
   (data_out,
    data_in,
    color_sel);
  output [23:0]data_out;
  input [23:0]data_in;
  input [2:0]color_sel;

  wire [2:0]color_sel;
  wire [23:0]data_in;
  wire [23:0]data_out;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[0]_INST_0 
       (.I0(data_in[0]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[10]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[10]),
        .I3(color_sel[2]),
        .O(data_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[11]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[11]),
        .I3(color_sel[2]),
        .O(data_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[12]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[12]),
        .I3(color_sel[2]),
        .O(data_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[13]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[13]),
        .I3(color_sel[2]),
        .O(data_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[14]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[14]),
        .I3(color_sel[2]),
        .O(data_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[15]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[15]),
        .I3(color_sel[2]),
        .O(data_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[16]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[16]),
        .O(data_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[17]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[17]),
        .O(data_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[18]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[18]),
        .O(data_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[19]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[19]),
        .O(data_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[1]_INST_0 
       (.I0(data_in[1]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[20]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[20]),
        .O(data_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[21]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[21]),
        .O(data_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[22]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[22]),
        .O(data_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hE706)) 
    \data_out[23]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(color_sel[2]),
        .I3(data_in[23]),
        .O(data_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[2]_INST_0 
       (.I0(data_in[2]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[3]_INST_0 
       (.I0(data_in[3]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[4]_INST_0 
       (.I0(data_in[4]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[5]_INST_0 
       (.I0(data_in[5]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[6]_INST_0 
       (.I0(data_in[6]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h88BE)) 
    \data_out[7]_INST_0 
       (.I0(data_in[7]),
        .I1(color_sel[2]),
        .I2(color_sel[0]),
        .I3(color_sel[1]),
        .O(data_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[8]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[8]),
        .I3(color_sel[2]),
        .O(data_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hE0DC)) 
    \data_out[9]_INST_0 
       (.I0(color_sel[1]),
        .I1(color_sel[0]),
        .I2(data_in[9]),
        .I3(color_sel[2]),
        .O(data_out[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
