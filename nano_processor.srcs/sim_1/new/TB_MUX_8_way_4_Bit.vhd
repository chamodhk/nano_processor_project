----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 02:12:36 PM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_Bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_MUX_8_way_4_Bit is
--  Port ( );
end TB_MUX_8_way_4_Bit;

architecture Behavioral of TB_MUX_8_way_4_Bit is

component MUX_8_way_4_Bit 
        Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D0_tb, D1_tb, D2_tb, D3_tb, D4_tb, D5_tb, D6_tb, D7_tb : STD_LOGIC_VECTOR(3 downto 0);
signal S_tb : STD_LOGIC_VECTOR (2 downto 0);
signal EN_tb : STD_LOGIC;
signal Y_tb : STD_LOGIC_VECTOR(3 downto 0);

begin
    uut: MUX_8_Way_4_Bit
    port map (
        D0 => D0_tb, D1 => D1_tb, D2 => D2_tb, D3 => D3_tb,
        D4 => D4_tb, D5 => D5_tb, D6 => D6_tb, D7 => D7_tb,
        S  => S_tb,
        EN => EN_tb,
        Y  => Y_tb
    );
    
    process
    begin
        D0_tb <= "0000";
        D1_tb <= "0001";
        D2_tb <= "0010";
        D3_tb <= "0011";
        D4_tb <= "0100";
        D5_tb <= "0101";
        D6_tb <= "0110";
        D7_tb <= "0111";
        
        EN_tb <= '1';
        
        for i in 0 to 7 loop
            S_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for 100ns;
        end loop;
            
        EN_tb <= '0';
        wait for 100ns;
        
        wait;
    end process;
    
end Behavioral;
