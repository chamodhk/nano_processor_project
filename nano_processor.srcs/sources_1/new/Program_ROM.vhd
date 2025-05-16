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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        signal default_rom : rom_type := (
            "101110000011", -- ROM_0 -- MOVI R1, 1
                    "100010000001", -- ROM_1 -- MOVI R2, 2
                    "010010000000", -- ROM_2 -- MOVI R3, 3
                    "100100000011", -- ROM_3 -- ADD R7, R1
                    "000100010000", -- ROM_4 -- ADD R7, R2
                    "001110100000", -- ROM_5 -- ADD R7, R3
                    "110100000110", -- ROM_6 -- MOVI R7, 0
                    "110000000100"  -- ROM_7 -- JUMP TO LINE O IF R7 = 0
            );
            

begin

    Instruction <= default_rom(to_integer(unsigned(address)));


end Behavioral;
