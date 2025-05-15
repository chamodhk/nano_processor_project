----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:36:33 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_3_Bit - Behavioral
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

entity TB_MUX_2_way_3_Bit is
--  Port ( );
end TB_MUX_2_way_3_Bit;


architecture Behavioral of TB_MUX_2_way_3_Bit is

component MUX_2_way_3_Bit
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
       D1 : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       S : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal D0_tb, D1_tb: STD_LOGIC_VECTOR(2 downto 0);
signal EN_tb, S_tb : STD_LOGIC;
signal Y_tb : STD_LOGIC_VECTOR(2 downto 0);

begin
    uut: MUX_2_way_3_Bit
    port map (
        D0 => D0_tb, 
        D1 => D1_tb,
        S  => S_tb,
        EN => EN_tb,
        Y  => Y_tb
    );
    
    process
    begin
        D0_tb <= "000";
        D1_tb <= "001";
        
        EN_tb <= '1';
        
        S_tb <= '0';
        wait for 100ns;
        
        S_tb <= '1';
        wait for 100ns;
        
        EN_tb <= '0';
        wait for 100ns;
        
        wait;
    end process;


end Behavioral;
