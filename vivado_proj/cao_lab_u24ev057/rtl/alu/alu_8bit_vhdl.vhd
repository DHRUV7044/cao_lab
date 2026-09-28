----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2026 04:43:19 PM
-- Design Name: 
-- Module Name: alu_8bit_vhdl - Behavioral
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

entity alu_8bit_vhdl is
    Port ( op : in STD_LOGIC_VECTOR (3 downto 0);
           a : in signed (7 downto 0);
           b : in signed (7 downto 0);
           c : out signed (15 downto 0);
           v : out STD_LOGIC);
end alu_8bit_vhdl;

architecture Behavioral of alu_8bit_vhdl is
begin
    
    process(a , b , op)
        
        variable ae : signed(15 downto 0);
        variable be : signed(15 downto 0);
        
        variable limit_temp : std_logic;
        
        
    begin
        
        ae := TO_SIGNED(TO_INTEGER(a) , 16);
        be := TO_SIGNED(TO_INTEGER(b) , 16);
        
        
        
        case op is
        
        when x"0" => 
            c <= ae + be;
            v <= '0';
        
        when x"1" => 
            c <= ae - be;
            v <= '0';
            
        when x"2" => 
            c <= ae * be;
            v <= '0';
        
        when x"3" => 
            if ( b = x"0") then
                c <= x"ffff";
                v <= '1';
            else 
                c <= ae/be;
                v <= '0';
                
            end if;
        
        when x"4" =>
            c <= ae mod be;
            v <= '0';
        
        when x"5" =>
            c <= ae rem be;
            v <= '0';
            
        when x"6" =>
            c <= not ae;
            v <= '0';
        
        when x"7" =>
            c <= ae and be;
            v <= '0';
        
        when x"8" =>
            c <= ae xor be;
            v <= '0';
        
        when x"9" =>
            c <= ae srl TO_INTEGER(be);
            v <= '0';
        
        when x"a" =>
            c <= ae sll TO_INTEGER(be);
            v <= '0';
            
        when x"b" =>
            c <= ae ror 1;
            v <= '0';
            
        when x"c" =>
            c <= ae rol 1;
            v <= '0';
            
        when x"d" =>
            if a(7) = '1' then
                if a  < -32 then
                    c <= x"ffff";
                    v <= '1';
                else
                    c <= ae*ae*ae;
                    v <= '0';
                end if;
            else
                if a  >= 32 then
                    c <= x"ffff";
                    v <= '1';
                else
                    c <= ae*ae*ae;
                    v <= '0';
                end if;
            end if;
            v <= '0';
            
        when x"e" =>
            c <= (ae*ae) - (b/2);
            v <= '0';
        
        when x"f" =>
            c <= (be*be) - (b mod a);
            v <= '0';
        
        when others => 
            c <= TO_SIGNED(0 , 16);
            v <= '0';
        
        end case;
    end process;

end Behavioral;
