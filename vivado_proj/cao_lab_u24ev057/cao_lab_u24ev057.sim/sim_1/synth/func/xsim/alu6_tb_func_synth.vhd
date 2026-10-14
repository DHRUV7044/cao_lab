-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Oct  8 13:50:05 2026
-- Host        : vlsilab-client44.eced.svnit.ac.in running 64-bit Red Hat Enterprise Linux release 8.7 (Ootpa)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/u24ev057/hdl_cao/CAO_lab/vivado_proj/cao_lab_u24ev057/cao_lab_u24ev057.sim/sim_1/synth/func/xsim/alu6_tb_func_synth.vhd
-- Design      : rca4_verilog
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity rca4_verilog is
  port (
    a : in STD_LOGIC_VECTOR ( 3 downto 0 );
    b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cin : in STD_LOGIC;
    s : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of rca4_verilog : entity is true;
end rca4_verilog;

architecture STRUCTURE of rca4_verilog is
  signal a_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal b_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal c_2 : STD_LOGIC;
  signal cin_IBUF : STD_LOGIC;
  signal cout_OBUF : STD_LOGIC;
  signal s_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of cout_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_OBUF[1]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_OBUF[3]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_OBUF[3]_inst_i_2\ : label is "soft_lutpair1";
begin
\a_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(0),
      O => a_IBUF(0)
    );
\a_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(1),
      O => a_IBUF(1)
    );
\a_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(2),
      O => a_IBUF(2)
    );
\a_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(3),
      O => a_IBUF(3)
    );
\b_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(0),
      O => b_IBUF(0)
    );
\b_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(1),
      O => b_IBUF(1)
    );
\b_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(2),
      O => b_IBUF(2)
    );
\b_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(3),
      O => b_IBUF(3)
    );
cin_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => cin,
      O => cin_IBUF
    );
cout_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => cout_OBUF,
      O => cout
    );
cout_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEAA880"
    )
        port map (
      I0 => b_IBUF(3),
      I1 => a_IBUF(2),
      I2 => c_2,
      I3 => b_IBUF(2),
      I4 => a_IBUF(3),
      O => cout_OBUF
    );
\s_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => s_OBUF(0),
      O => s(0)
    );
\s_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(0),
      I1 => a_IBUF(0),
      I2 => cin_IBUF,
      O => s_OBUF(0)
    );
\s_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => s_OBUF(1),
      O => s(1)
    );
\s_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99969666"
    )
        port map (
      I0 => b_IBUF(1),
      I1 => a_IBUF(1),
      I2 => b_IBUF(0),
      I3 => cin_IBUF,
      I4 => a_IBUF(0),
      O => s_OBUF(1)
    );
\s_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => s_OBUF(2),
      O => s(2)
    );
\s_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(2),
      I1 => a_IBUF(2),
      I2 => c_2,
      O => s_OBUF(2)
    );
\s_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => s_OBUF(3),
      O => s(3)
    );
\s_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99969666"
    )
        port map (
      I0 => b_IBUF(3),
      I1 => a_IBUF(3),
      I2 => b_IBUF(2),
      I3 => c_2,
      I4 => a_IBUF(2),
      O => s_OBUF(3)
    );
\s_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEAA880"
    )
        port map (
      I0 => b_IBUF(1),
      I1 => a_IBUF(0),
      I2 => cin_IBUF,
      I3 => b_IBUF(0),
      I4 => a_IBUF(1),
      O => c_2
    );
end STRUCTURE;
