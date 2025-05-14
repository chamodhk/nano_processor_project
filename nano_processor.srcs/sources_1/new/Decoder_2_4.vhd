----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 11:02:50 AM
-- Design Name: 
-- Module Name: Decoder_2_4 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_2_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           En : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_4;

architecture Behavioral of Decoder_2_4 is

begin

process (En, I) 
begin
    if (En = '0') then
        Y <= "0000" ;
     else
        Y(0) <= I(0) OR I(1);
        Y(1) <= NOT (I(0)) AND I(1);
        Y(2) <= I(0) AND NOT (I(1));
        Y(3) <= I(0) AND I(1);
        
     end if;
end process;
        
     
        


end Behavioral;
