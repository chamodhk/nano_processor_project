----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 01:18:05 PM
-- Design Name: 
-- Module Name: TB_MUX_2_4 - Behavioral
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

entity TB_MUX_2_4 is
--  Port ( );
end TB_MUX_2_4;

architecture Behavioral of TB_MUX_2_4 is

    component MUX_2_4
        port (
            D0 : in std_logic_vector (3 downto 0);
            D1 : in std_logic_vector (3 downto 0);
            S : in std_logic;
            D_out : out std_logic_vector( 3 downto 0));
            
    end component;
    
    signal s : std_logic;
    signal dout: std_logic_vector ( 3 downto 0);

begin

UUT: MUX_2_4
    port map (
        D0 => "0000",
        D1 => "1111",
        S => s,
        D_out => dout);
        

sim_proc : process
begin
    s <= '0';
    wait for 100ns;
    
    s <= '1';
    wait for 100ns;
    
    s <= '0';
    wait for 100ns;
    
    --wait;
end process;
    
        


end Behavioral;
