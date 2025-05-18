library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package op_codes is


    constant MOVI : std_logic_vector(1 downto 0) := "10";
    constant ADD : std_logic_vector(1 downto 0) := "00";
    constant NEG : std_logic_vector(1 downto 0) := "01";
    constant JZR : std_logic_vector(1 downto 0) := "11";

end package op_codes;