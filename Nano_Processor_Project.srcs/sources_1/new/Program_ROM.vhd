library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all; 
use work.buses.instruction_address;



entity Program_ROM is
    port(ROM_address : in instruction_address;
         I: out instruction_bus
         ); 
--  Port ( );
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal add_1_to_3 : rom_type := (
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
    I <= add_1_to_3(to_integer(unsigned(ROM_address)));
end Behavioral;