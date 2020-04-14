----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2019 09:56:02 PM
-- Design Name: 
-- Module Name: testbench - behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY testbench IS
--    PORT ( clock : IN STD_LOGIC;
--           anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
--           cathode : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END testbench;

ARCHITECTURE behavioral OF testbench IS
    COMPONENT abacus
    PORT    (clock : IN std_logic;
             switch : IN std_logic_vector (3 DOWNTO 0);
             anode : OUT std_logic_vector (3 DOWNTO 0);
             cathode : OUT std_logic_vector (7 DOWNTO 0));
    END COMPONENT;
    SIGNAL output_clock : std_logic := '0';
    SIGNAL anode : std_logic_vector (3 DOWNTO 0);
    SIGNAL cathode : std_logic_vector (7 DOWNTO 0);
BEGIN
    test_abacus: abacus
        PORT MAP    (output_clock,
                     "0101",
                     anode,
                     cathode);
        PROCESS
        BEGIN
            wait for 100 ns;
            output_clock <= NOT output_clock;
        END PROCESS;
END behavioral;
