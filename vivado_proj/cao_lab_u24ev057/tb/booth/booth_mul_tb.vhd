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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY booth_mul_tb IS
    --  Port ( );
END booth_mul_tb;

ARCHITECTURE testing OF booth_mul_tb IS
    COMPONENT booth_mul IS
        PORT (
            a : IN signed (3 DOWNTO 0);
            b : IN signed (3 DOWNTO 0);
            p : OUT signed (7 DOWNTO 0));
    END COMPONENT;
    SIGNAL a : signed(3 DOWNTO 0);
    SIGNAL b : signed(3 DOWNTO 0);
    SIGNAL p : signed(7 DOWNTO 0);

BEGIN
    booth_multiplier_test : booth_mul PORT MAP(
        a => a,
        b => b,
        p => p
    );
    PROCESS

    BEGIN
        a <= "0101";
        b <= "1010";

        WAIT FOR 10ns;

        a <= "0011";
        b <= "1100";

        WAIT FOR 10ns;

        a <= "1010";
        b <= "1100";

        WAIT FOR 10ns;

        a <= "0001";
        b <= "1000";

        WAIT FOR 10ns;

        a <= "1110";
        b <= "1011";

        WAIT FOR 10ns;

        a <= "1111";
        b <= "1111";

        WAIT FOR 10ns;

        a <= "0000";
        b <= "0000";

        WAIT FOR 10ns;

        a <= "1010";
        b <= "1111";

        WAIT FOR 10ns;

        a <= "0001";
        b <= "1111";

        WAIT FOR 10ns;

        a <= "1010";
        b <= "1111";
        WAIT;

    END PROCESS;

END testing;