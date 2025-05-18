----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 01:15:06 PM
-- Design Name: 
-- Module Name: MUX_2_4 - Behavioral
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
use work.buses.data_bus;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_2_4 is
    Port ( D0 : in data_bus;
           D1 : in data_bus;
           S : in STD_LOGIC;
           D_out : out data_bus);
end MUX_2_4;

architecture Behavioral of MUX_2_4 is

begin

process(D0, D1, S)  -- mux logic
begin
    if (S ='0') then
        D_out <= D0;   
    else
        D_out <= D1;
    end if;
end process;


end Behavioral;
