----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2026 04:43:19 PM
-- Design Name: 
-- Module Name: alu8_vhdl_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu8_vhdl_tb is
end alu8_vhdl_tb;

architecture Behavioral of alu8_vhdl_tb is
    signal op : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal a  : signed(7 downto 0) := (others => '0');
    signal b  : signed(7 downto 0) := (others => '0');
    signal c  : signed(15 downto 0);
    signal v  : STD_LOGIC;
begin

    alu_vhdl : entity work.alu_8bit_vhdl
        port map (
            op => op,
            a  => a,
            b  => b,
            c  => c,
            v  => v
        );

    stimulus : process
    begin
        op <= x"0"; a <= to_signed(25, 8);  b <= to_signed(15, 8);  wait for 10 ns;
        op <= x"0"; a <= to_signed(-50, 8); b <= to_signed(20, 8);  wait for 10 ns;
        op <= x"0"; a <= to_signed(127, 8); b <= to_signed(1, 8);   wait for 10 ns;

        op <= x"1"; a <= to_signed(50, 8);  b <= to_signed(20, 8);  wait for 10 ns;
        op <= x"1"; a <= to_signed(-20, 8); b <= to_signed(30, 8);  wait for 10 ns;

        op <= x"2"; a <= to_signed(12, 8);  b <= to_signed(10, 8);  wait for 10 ns;
        op <= x"2"; a <= to_signed(-12, 8); b <= to_signed(10, 8);  wait for 10 ns;
        op <= x"2"; a <= to_signed(-128, 8); b <= to_signed(-128, 8); wait for 10 ns;

        op <= x"3"; a <= to_signed(25, 8);  b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"3"; a <= to_signed(-25, 8); b <= to_signed(4, 8);   wait for 10 ns;
        op <= x"3"; a <= to_signed(25, 8);  b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"4"; a <= to_signed(17, 8);  b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"4"; a <= to_signed(-17, 8); b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"4"; a <= to_signed(17, 8);  b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"5"; a <= to_signed(17, 8);  b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"5"; a <= to_signed(-17, 8); b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"5"; a <= to_signed(17, 8);  b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"6"; a <= to_signed(0, 8);   b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"6"; a <= to_signed(-1, 8);  b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"7"; a <= to_signed(85, 8);  b <= to_signed(15, 8);  wait for 10 ns;
        op <= x"7"; a <= to_signed(-1, 8);  b <= to_signed(85, 8);  wait for 10 ns;

        op <= x"8"; a <= to_signed(85, 8);  b <= to_signed(15, 8);  wait for 10 ns;
        op <= x"8"; a <= to_signed(-1, 8);  b <= to_signed(85, 8);  wait for 10 ns;

        op <= x"9"; a <= to_signed(129, 8); b <= to_signed(1, 8);   wait for 10 ns;
        op <= x"9"; a <= to_signed(255, 8); b <= to_signed(8, 8);   wait for 10 ns;

        op <= x"A"; a <= to_signed(1, 8);   b <= to_signed(7, 8);   wait for 10 ns;
        op <= x"A"; a <= to_signed(1, 8);   b <= to_signed(15, 8);  wait for 10 ns;

        op <= x"B"; a <= to_signed(129, 8); b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"B"; a <= to_signed(1, 8);   b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"C"; a <= to_signed(129, 8); b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"C"; a <= to_signed(64, 8);  b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"D"; a <= to_signed(3, 8);   b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"D"; a <= to_signed(-3, 8);  b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"D"; a <= to_signed(32, 8);  b <= to_signed(0, 8);   wait for 10 ns;
        op <= x"D"; a <= to_signed(-33, 8); b <= to_signed(0, 8);   wait for 10 ns;

        op <= x"E"; a <= to_signed(12, 8);  b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"E"; a <= to_signed(-12, 8); b <= to_signed(-5, 8);  wait for 10 ns;

        op <= x"F"; a <= to_signed(3, 8);   b <= to_signed(5, 8);   wait for 10 ns;
        op <= x"F"; a <= to_signed(-3, 8);  b <= to_signed(5, 8);   wait for 10 ns;

        wait;
    end process;

end Behavioral;
