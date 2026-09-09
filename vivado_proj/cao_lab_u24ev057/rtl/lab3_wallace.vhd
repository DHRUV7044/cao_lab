----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/03/2026 04:51:57 PM
-- Design Name: 
-- Module Name: lab3_wallace - Behavioral
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

entity lab3_wallace is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : out std_logic_vector (7 downto 0));
end lab3_wallace;

architecture Behavioral of lab3_wallace is

    component rca8 is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
    end component;
    
    signal p0 : std_logic_vector(7 downto 0);
    signal p1 : std_logic_vector(7 downto 0);
    signal p2 : std_logic_vector(7 downto 0);
    signal p3 : std_logic_vector(7 downto 0);
    
    signal r0 : std_logic_vector(7 downto 0);
    signal r1 : std_logic_vector(7 downto 0);
    signal r2 : std_logic_vector(7 downto 0);
    
    signal r3 : std_logic_vector(7 downto 0);
    signal r4 : std_logic_vector(7 downto 0);
    
    signal cout : std_logic;

begin
    process(a , b , p0 , p1 , p2 , p3 , r0 , r1 , r2 , r3 , r4)
    
    begin
    
        p0 <= (others => '0');
        p1 <= (others => '0');
        p2 <= (others => '0');
        p3 <= (others => '0');
        
        for i in 0 to 3 loop
            p0(i) <= a(0) and b(i);
            p1(i+1) <= a(1) and b(i);
            p2(i+2) <= a(2) and b(i);
            p3(i+3) <= a(3) and b(i);
        end loop;
        
        r0 <= (others => '0');
        r1 <= (others => '0');
        r2 <= (others => '0');
        r3 <= (others => '0');
        r4 <= (others => '0');
        
        r0(0) <= p0(0);
        r0(1) <= p0(1) xor p1(1);
        r0(2) <= p0(2) xor p1(2) xor p2(2); 
        
        r0(3) <= p0(3) xor p1(3) xor p2(3);
        
        r0(4) <= p3(4) xor p2(4) xor p1(4);
        r0(5) <= p3(5) xor p2(5); 
        r0(6) <= p3(6);
        r0(7) <= '0';
        
        
        
        r2(3) <= p3(3);
        
        r1(0) <= '0';
        r1(1) <= '0';
        r1(2) <= p0(1) and p1(1);
        r1(3) <= ( p0(2) and p1(2) ) or ( p1(2) and p2(2) ) or ( p2(2) and p0(2) );
        
        r1(4) <= ( p0(3) and p1(3) ) or ( p1(3) and p2(3) ) or ( p2(3) and p0(3) );
        
        r1(5) <= ( p1(4) and p2(4) ) or ( p2(4) and p3(4) ) or ( p3(4) and p1(4) );
        r1(6) <= p2(5) and p3(5);
        r1(7) <= '0';
        
        r3(0) <= r0(0);
        r3(1) <= r0(1);
        r3(2) <= r0(2) xor r1(2);
        r3(3) <= r0(3) xor r1(3) xor r2(3);
        r3(4) <= r0(4) xor r1(4);
        r3(5) <= r0(5) xor r1(5);
        r3(6) <= r0(6) xor r1(6);
        r3(7) <= r0(7) xor r1(7);
        
        r4(0) <= '0';
        r4(1) <= '0';
        r4(2) <= '0';
        r4(3) <= r0(2) and r1(2);
        r4(4) <= ( r0(3) and r1(3) ) or ( r1(3) and r2(3) ) or ( r2(3) and r0(3) );
        r4(5) <= r0(4) and r1(4);
        r4(6) <= r0(5) and r1(5);
        r4(7) <= r0(6) and r1(6);
        
       
    end process;

    final_add : rca8 port map (a => r3 , b => r4 , sum => c , cout => cout);
    
end Behavioral;