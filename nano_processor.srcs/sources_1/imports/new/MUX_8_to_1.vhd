----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 02:59:42 PM
-- Design Name: 
-- Module Name: MUX_8_to_1 - Behavioral
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

entity MUX_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is
component Decoder_3_to_8
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;


    SIGNAL Y_D : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
           I => S,
           EN => EN,
           Y => Y_D
           );
           
        
Y <=  (D(0) AND Y_D(0)) OR
      (D(1) AND Y_D(1)) OR
      (D(2) AND Y_D(2)) OR 
      (D(3) AND Y_D(3)) OR
      (D(4) AND Y_D(4)) OR 
      (D(5) AND Y_D(5)) OR 
      (D(6) AND Y_D(6)) OR
      (D(7) AND Y_D(7));

end Behavioral;
