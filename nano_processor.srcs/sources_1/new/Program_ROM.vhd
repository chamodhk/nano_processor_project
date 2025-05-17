----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/01/2025 10:56:01 AM
-- Design Name:
-- Module Name: Program_ROM - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
	port (
		address : in STD_LOGIC_VECTOR (2 downto 0);
		instruction : out STD_LOGIC_VECTOR (11 downto 0)
	);
end Program_ROM;

architecture Behavioral of Program_ROM is
	type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
	signal default_rom : rom_type := (
    "101110000000",
    "101100000011",
    "101010000001",
    "011010000000",
    
    "001111100000",
    "001101010000",
    "111100000000",
    "110000000100"







);
 

begin
	Instruction <= default_rom(to_integer(unsigned(address)));
end Behavioral;