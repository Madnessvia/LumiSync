-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Mar 27 21:54:17 2025
-- Host        : xuelihao running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/xuelihao/Desktop/hw/hw/hw.srcs/sources_1/bd/hdmi/ip/hdmi_rgb_color_mux_0_0/hdmi_rgb_color_mux_0_0_sim_netlist.vhdl
-- Design      : hdmi_rgb_color_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_rgb_color_mux_0_0_rgb_color_mux is
  port (
    data_out : out STD_LOGIC_VECTOR ( 23 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 23 downto 0 );
    color_sel : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_rgb_color_mux_0_0_rgb_color_mux : entity is "rgb_color_mux";
end hdmi_rgb_color_mux_0_0_rgb_color_mux;

architecture STRUCTURE of hdmi_rgb_color_mux_0_0_rgb_color_mux is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \data_out[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \data_out[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \data_out[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \data_out[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \data_out[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \data_out[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_out[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \data_out[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \data_out[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \data_out[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_out[19]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \data_out[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \data_out[20]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data_out[21]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \data_out[22]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_out[23]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \data_out[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_out[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_out[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \data_out[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \data_out[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \data_out[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \data_out[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_out[9]_INST_0\ : label is "soft_lutpair4";
begin
\data_out[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(0),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(0)
    );
\data_out[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(10),
      I3 => color_sel(2),
      O => data_out(10)
    );
\data_out[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(11),
      I3 => color_sel(2),
      O => data_out(11)
    );
\data_out[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(12),
      I3 => color_sel(2),
      O => data_out(12)
    );
\data_out[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(13),
      I3 => color_sel(2),
      O => data_out(13)
    );
\data_out[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(14),
      I3 => color_sel(2),
      O => data_out(14)
    );
\data_out[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(15),
      I3 => color_sel(2),
      O => data_out(15)
    );
\data_out[16]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(16),
      O => data_out(16)
    );
\data_out[17]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(17),
      O => data_out(17)
    );
\data_out[18]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(18),
      O => data_out(18)
    );
\data_out[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(19),
      O => data_out(19)
    );
\data_out[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(1),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(1)
    );
\data_out[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(20),
      O => data_out(20)
    );
\data_out[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(21),
      O => data_out(21)
    );
\data_out[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(22),
      O => data_out(22)
    );
\data_out[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E706"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => color_sel(2),
      I3 => data_in(23),
      O => data_out(23)
    );
\data_out[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(2),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(2)
    );
\data_out[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(3),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(3)
    );
\data_out[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(4),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(4)
    );
\data_out[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(5),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(5)
    );
\data_out[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(6),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(6)
    );
\data_out[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88BE"
    )
        port map (
      I0 => data_in(7),
      I1 => color_sel(2),
      I2 => color_sel(0),
      I3 => color_sel(1),
      O => data_out(7)
    );
\data_out[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(8),
      I3 => color_sel(2),
      O => data_out(8)
    );
\data_out[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0DC"
    )
        port map (
      I0 => color_sel(1),
      I1 => color_sel(0),
      I2 => data_in(9),
      I3 => color_sel(2),
      O => data_out(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_rgb_color_mux_0_0 is
  port (
    color_sel : in STD_LOGIC_VECTOR ( 2 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 23 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hdmi_rgb_color_mux_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hdmi_rgb_color_mux_0_0 : entity is "hdmi_rgb_color_mux_0_0,rgb_color_mux,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of hdmi_rgb_color_mux_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of hdmi_rgb_color_mux_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of hdmi_rgb_color_mux_0_0 : entity is "rgb_color_mux,Vivado 2020.1";
end hdmi_rgb_color_mux_0_0;

architecture STRUCTURE of hdmi_rgb_color_mux_0_0 is
begin
inst: entity work.hdmi_rgb_color_mux_0_0_rgb_color_mux
     port map (
      color_sel(2 downto 0) => color_sel(2 downto 0),
      data_in(23 downto 0) => data_in(23 downto 0),
      data_out(23 downto 0) => data_out(23 downto 0)
    );
end STRUCTURE;
