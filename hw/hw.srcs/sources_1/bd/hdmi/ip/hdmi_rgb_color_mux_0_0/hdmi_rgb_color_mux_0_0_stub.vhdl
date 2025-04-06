-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 27 21:54:17 2025
-- Host        : xuelihao running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_rgb_color_mux_0_0/hdmi_rgb_color_mux_0_0_stub.vhdl
-- Design      : hdmi_rgb_color_mux_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hdmi_rgb_color_mux_0_0 is
  Port ( 
    color_sel : in STD_LOGIC_VECTOR ( 2 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 23 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );

end hdmi_rgb_color_mux_0_0;

architecture stub of hdmi_rgb_color_mux_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "color_sel[2:0],data_in[23:0],data_out[23:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rgb_color_mux,Vivado 2020.1";
begin
end;
