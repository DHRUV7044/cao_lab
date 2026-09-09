----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/03/2026 05:37:05 PM
-- Design Name: 
-- Module Name: lab3_wallance_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3_wallance_tb is
--  Port ( );
end lab3_wallance_tb;

architecture testing of lab3_wallance_tb is

    component lab3_wallace is
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            c : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    

    signal a : std_logic_vector(3 downto 0);
    signal b : std_logic_vector(3 downto 0);
    signal c : std_logic_vector(7 downto 0);
     
begin


    lab3_wallance_test : lab3_wallace port map(
        a => a,
        b => b,
        c =>c
    );
    
    
    process
    
    begin
        a <= "0101";
        b <= "1010";
        
        wait for 10ns;
        
        a <= "0011";
        b <= "1100";
        
        wait for 10ns;
        
        a <= "1010";
        b <= "1100";
        
        wait for 10ns;
        
        a <= "0001";
        b <= "1000";
        
        wait for 10ns;
        
        a <= "1110";
        b <= "1011";
        
        wait for 10ns;
        
        a <= "1111";
        b <= "1111";
        
        wait for 10ns;
        
        a <= "0000";
        b <= "0000";
        
        wait for 10ns;
        
        a <= "1010";
        b <= "1111";
        
        wait for 10ns;
        
        a <= "0001";
        b <= "1111";
        
        wait for 10ns;
        
        a <= "1010";
        b <= "1111";
        
        
        wait;
    
    end process;
    


end testing;