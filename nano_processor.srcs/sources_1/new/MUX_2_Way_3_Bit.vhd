----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:59:57 AM
-- Design Name: 
-- Module Name: MUX_2_Way_3_Bit - Behavioral
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
use work.bus_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_2_Way_3_Bit is
    Port ( D : in bus_2_3_bits;
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_Way_3_Bit;

architecture Behavioral of MUX_2_Way_3_Bit is

begin

    process(D, S, EN)
    begin
        if EN = '1' then
            if S = '1' then
                Y <= D(1);
            else
                Y <= D(0);
            end if;
        else
            Y <= (others => '0');
        end if;
    end process;

end Behavioral;
