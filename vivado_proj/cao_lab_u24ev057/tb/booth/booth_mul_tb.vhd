----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2026 04:26:32 PM
-- Design Name: 
-- Module Name: booth_mul_tb - Behavioral
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

entity booth_mul_tb is
--  Port ( );
end booth_mul_tb;

architecture testing of booth_mul_tb is


    component booth_mul is
        Port ( a : in signed (3 downto 0);
            b : in signed (3 downto 0);
            p : out signed (7 downto 0));
    end component;
    

    signal a : signed(3 downto 0);
    signal b : signed(3 downto 0);
    signal p : signed(7 downto 0);
     
begin


    booth_multiplier_test : booth_mul port map(
        a => a,
        b => b,
        p =>p
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