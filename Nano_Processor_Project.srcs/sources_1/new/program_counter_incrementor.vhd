library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Required for arithmetic
use work.buses.instruction_address;

entity program_counter_incrementor is   
    Port (
        in_address  : in  instruction_address;
        out_address : out instruction_address
    );
end program_counter_incrementor;

architecture Behavioral of program_counter_incrementor is
begin

    process(in_address)
        variable temp : unsigned(2 downto 0);
    begin
        temp := unsigned(in_address) + 1;
        out_address <= std_logic_vector(temp);
    end process;

end Behavioral;
