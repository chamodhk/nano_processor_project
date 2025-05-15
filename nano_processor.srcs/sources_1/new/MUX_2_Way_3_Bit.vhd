----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:32:43 PM
-- Design Name: 
-- Module Name: MUX_2_way_3_Bit - Behavioral
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

entity MUX_2_way_3_Bit is
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_way_3_Bit;

architecture Behavioral of MUX_2_way_3_Bit is

begin
    Y <= D0 when (EN = '1' AND S = '0') else
         D1 when (EN = '1' AND S = '1') else
         (others => '0');
end Behavioral;
