----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 11:11:35 AM
-- Design Name: 
-- Module Name: TB_Decoder_2_4 - Behavioral
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

entity TB_Decoder_2_4 is
--  Port ( );
end TB_Decoder_2_4;

architecture Behavioral of TB_Decoder_2_4 is

    component Decoder_2_4
        port (
            I : in STD_LOGIC_VECTOR (1 downto 0);
            En : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (3 downto 0));
            
    end component;

    signal en: std_logic :='1';
    signal i: std_logic_vector (1 downto 0);
    signal y: std_logic_vector (3 downto 0);
    
begin

UUT: Decoder_2_4
port map (
    I => i,
    En => en,
    Y => y);
    
 sim_process: process
 begin
    
        I <= "00";
        wait for 100ns;
        
        I <= "01";
        wait for 100ns;
        
        I <= "10";
        wait for 100ns;
        
        I <= "11";
        wait for 100ns;
        
        wait;
        
end process;




end Behavioral;
