// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sun Apr  6 02:42:06 2025
// Host        : xuelihao running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_light_strip_output_0_4/hdmi_light_strip_output_0_4_stub.v
// Design      : hdmi_light_strip_output_0_4
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "light_strip_output,Vivado 2020.1" *)
module hdmi_light_strip_output_0_4(pclk, reset, hs, vs, de, data888, light_rgb_data, 
  uart_data_en)
/* synthesis syn_black_box black_box_pad_pin="pclk,reset,hs,vs,de,data888[23:0],light_rgb_data,uart_data_en" */;
  input pclk;
  input reset;
  input hs;
  input vs;
  input de;
  input [23:0]data888;
  output light_rgb_data;
  output uart_data_en;
endmodule
