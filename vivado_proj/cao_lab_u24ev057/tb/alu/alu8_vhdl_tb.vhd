----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2026 05:01:30 PM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu8_vhdl_tb is
--  Port ( );
end alu8_vhdl_tb;

architecture Behavioral of alu8_vhdl_tb is
    component alu_8bit_vhdl is
    Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
           a : in signed (7 downto 0);
           b : in signed (7 downto 0);
           c : out signed (15 downto 0);
           v : out STD_LOGIC);
end component;

          signal op :  STD_LOGIC_VECTOR (3 downto 0);
          signal a :  signed (7 downto 0);
          signal b :  signed (7 downto 0);
          signal c :  signed (15 downto 0);
          signal v :  STD_LOGIC;

begin
    alu_vhdl : alu_8bit_vhdl port map (
    op => op,
    a => a,
    b => b,
    c => c,
    v => v
    );
    
    process
    
    begin
        op <= "0011";
        a <= TO_SIGNED(5 , 8);
        b <= x"00";
        
        wait for 10ns;
        
        wait;
    
    end process;
    

end Behavioral;
