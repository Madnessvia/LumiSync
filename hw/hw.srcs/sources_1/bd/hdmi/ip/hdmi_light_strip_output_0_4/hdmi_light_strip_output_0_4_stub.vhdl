-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Sun Apr  6 02:42:06 2025
-- Host        : xuelihao running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_light_strip_output_0_4/hdmi_light_strip_output_0_4_stub.vhdl
-- Design      : hdmi_light_strip_output_0_4
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hdmi_light_strip_output_0_4 is
  Port ( 
    pclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    hs : in STD_LOGIC;
    vs : in STD_LOGIC;
    de : in STD_LOGIC;
    data888 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    light_rgb_data : out STD_LOGIC;
    uart_data_en : out STD_LOGIC
  );

end hdmi_light_strip_output_0_4;

architecture stub of hdmi_light_strip_output_0_4 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pclk,reset,hs,vs,de,data888[23:0],light_rgb_data,uart_data_en";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "light_strip_output,Vivado 2020.1";
begin
end;
