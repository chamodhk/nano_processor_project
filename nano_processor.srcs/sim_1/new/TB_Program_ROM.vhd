----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2025 11:03:22 AM
-- Design Name: 
-- Module Name: TB_Program_ROM - Behavioral
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

entity TB_Program_ROM is
--  Port ( );
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is
    component Program_ROM
        port (
            address: in std_logic_vector (2 downto 0);
            instruction: out std_logic_vector ( 11 downto 0));
   end component;
   
   signal address: std_logic_vector (2 downto 0);
   signal instruction: std_logic_vector (11 downto 0);
   
   
begin

UUT : Program_ROM
    port map (
        address => address,
        instruction => instruction);
        
        
 sim_process : process
 begin
    address <= "000";
    wait for 50ns;
    
    address <= "001";
    wait for 50ns;
    
    address <= "010";
    wait for 50ns;
    
    address <= "011";
    wait for 50ns;
    
    address <= "100";
    wait for 50ns;
    
    address <= "101";
    wait for 50ns;
    
    address <= "110";
    wait for 50ns;
    
    address <= "111";
    wait for 50ns;
    
    wait;
end process;
    


end Behavioral;
