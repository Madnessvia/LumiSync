// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Mar 27 21:54:17 2025
// Host        : xuelihao running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_rgb_color_mux_0_0/hdmi_rgb_color_mux_0_0_stub.v
// Design      : hdmi_rgb_color_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rgb_color_mux,Vivado 2020.1" *)
module hdmi_rgb_color_mux_0_0(color_sel, data_in, data_out)
/* synthesis syn_black_box black_box_pad_pin="color_sel[2:0],data_in[23:0],data_out[23:0]" */;
  input [2:0]color_sel;
  input [23:0]data_in;
  output [23:0]data_out;
endmodule
