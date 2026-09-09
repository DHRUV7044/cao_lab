----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/06/2026 04:21:49 PM
-- Design Name: 
-- Module Name: rca8 - Behavioral
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

entity rca8 is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end rca8;

architecture structural of rca8 is

    component ha
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           SUM : out STD_LOGIC;
           Cout : out STD_LOGIC
           );
    end component;
    
    component fa
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
    end component;
    
    signal cint : std_logic_vector(6 downto 0);

begin

    inst1 : ha port map(a => a(0) ,b => b(0)                 ,sum => sum(0) ,cout => cint(0));
    inst2 : fa port map(a => a(1) ,b => b(1) ,cin => cint(0) ,sum => sum(1) ,cout => cint(1));
    inst3 : fa port map(a => a(2) ,b => b(2) ,cin => cint(1) ,sum => sum(2) ,cout => cint(2));
    inst4 : fa port map(a => a(3) ,b => b(3) ,cin => cint(2) ,sum => sum(3) ,cout => cint(3));
    inst5 : fa port map(a => a(4) ,b => b(4) ,cin => cint(3) ,sum => sum(4) ,cout => cint(4));
    inst6 : fa port map(a => a(5) ,b => b(5) ,cin => cint(4) ,sum => sum(5) ,cout => cint(5));
    inst7 : fa port map(a => a(6) ,b => b(6) ,cin => cint(5) ,sum => sum(6) ,cout => cint(6));
    inst8 : fa port map(a => a(7) ,b => b(7) ,cin => cint(6) ,sum => sum(7) ,cout => cout);


end structural;
