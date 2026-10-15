----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2026 04:26:32 PM
-- Design Name: 
-- Module Name: booth_mul - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity booth_mul is
    Port ( a : in signed (3 downto 0);
           b : in signed (3 downto 0);
           p : out signed (7 downto 0));
end booth_mul;

architecture Behavioral of booth_mul is
begin

    process (a , b)
        variable q_pair : std_logic_vector(1 downto 0);
        variable acc : signed (3 downto 0);
        variable q : signed (3 downto 0);
        variable total : std_logic_vector (8 downto 0);
        
        variable w : integer := 3;
    
    begin
        q_pair := "00";
        acc := "0000";
        q := b;
        total := std_logic_vector(acc) &  std_logic_vector(q) &  q_pair(0);
        
        for i in 0 to w loop
            
            q_pair := total(1 downto 0);
            
            case(q_pair) is
                when "01" => acc := acc + a;
                when "10" => acc := acc -a ;
                when others => null ;
            end case;
            
            total := std_logic_vector(acc) &  std_logic_vector(q) &  q_pair(0);
            total := total(8) & total(8 downto 1);
            acc := signed(total(8 downto 5));
            q := signed(total(4 downto 1));
        
        end loop;
        
        p <= signed(total(8 downto 1));
        
    end process;

end Behavioral;
