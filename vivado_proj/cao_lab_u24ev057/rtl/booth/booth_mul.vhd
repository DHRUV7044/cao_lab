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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY booth_mul IS
    PORT (
        a : IN signed (3 DOWNTO 0);
        b : IN signed (3 DOWNTO 0);
        p : OUT signed (7 DOWNTO 0));
END booth_mul;

ARCHITECTURE Behavioral OF booth_mul IS
BEGIN

    PROCESS (a, b)
        VARIABLE q_pair : STD_LOGIC_VECTOR(1 DOWNTO 0);
        VARIABLE acc : signed (3 DOWNTO 0);
        VARIABLE q : signed (3 DOWNTO 0);
        VARIABLE total : STD_LOGIC_VECTOR (8 DOWNTO 0);

        VARIABLE w : INTEGER := 3;

    BEGIN
        q_pair := "00";
        acc := "0000";
        q := b;
        total := STD_LOGIC_VECTOR(acc) & STD_LOGIC_VECTOR(q) & q_pair(0);

        FOR i IN 0 TO w LOOP

            q_pair := total(1 DOWNTO 0);

            CASE(q_pair) IS
                WHEN "01" => acc := acc + a;
                WHEN "10" => acc := acc - a;
                WHEN OTHERS => NULL;
            END CASE;

            total := STD_LOGIC_VECTOR(acc) & STD_LOGIC_VECTOR(q) & q_pair(0);
            total := total(8) & total(8 DOWNTO 1);
            acc := signed(total(8 DOWNTO 5));
            q := signed(total(4 DOWNTO 1));

        END LOOP;

        p <= signed(total(8 DOWNTO 1));

    END PROCESS;

END Behavioral;