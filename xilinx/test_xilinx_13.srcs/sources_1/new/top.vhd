----------------------------------------------------------------------------------
-- Company: Pervigilent
-- Engineer: Stewart Nash
-- 
-- Create Date: 04/11/2020 07:51:00 PM
-- Design Name: 
-- Module Name: top - behavioral_5
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

ENTITY top IS
    PORT    (clock : IN std_logic;
             anode : OUT std_logic_vector(3 DOWNTO 0);
             cathode : OUT std_logic_vector(7 DOWNTO 0));
END top;

ARCHITECTURE behavioral_5 OF top is
    COMPONENT rom_controller
        PORT    (clock : IN std_logic;
                 address : IN std_logic_vector(7 DOWNTO 0);
                 --reset : IN std_logic;
                 unlock : IN std_logic;
                 data : OUT std_logic_vector(31 DOWNTO 0);
                 ready : OUT std_logic);    
    END COMPONENT;
    COMPONENT display_buffer
        PORT    (clock : IN std_logic;
                 message : IN std_logic_vector(31 DOWNTO 0);
                 anode : OUT std_logic_vector(3 DOWNTO 0);
                 cathode : OUT std_logic_vector(7 DOWNTO 0));
    END COMPONENT;
 
    SIGNAL address : std_logic_vector(7 DOWNTO 0) := X"00";   
    SIGNAL message : std_logic_vector(31 DOWNTO 0);
    --SIGNAL reset : std_logic := '0';
    SIGNAL unlock : std_logic := '1';
    SIGNAL ready : std_logic;
    SIGNAL enable: std_logic;
BEGIN
    rom_control: rom_controller
        --PORT MAP(clock, address, reset, message, ready);
        PORT MAP(clock, address, unlock, message, ready);
    display_control: display_buffer
        PORT MAP(clock, message, anode, cathode);
END behavioral_5;
