----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2025 02:21:35 AM
-- Design Name: 
-- Module Name: TB_LUT - Behavioral
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

entity TB_LUT is
--  Port ( );
end TB_LUT;

architecture Behavioral of TB_LUT is

    component LUT_16_7
        port (
            address: in std_logic_vector ( 3 downto 0 );
            data : out std_logic_vector (6 downto 0)
            );
            
    end component;
    
    signal address : std_logic_vector ( 3 downto 0);
    signal data : std_logic_vector ( 6 downto 0);
            
            

begin

    UUT : LUT_16_7
        port map (
            address => address,
            data => data);
            
    sim_process : process
    begin
    
        -- index: 230435T
        --binary: 0011 1000 0011 0010 0011
        
        address <= "0010";
        wait for 100ns;
        
        address <= "1000";
        wait for 100ns;
        
        address <= "0011";
        wait for 100ns;
        
        address <= "0010";
        wait for 100ns;
        
        address <= "0011";
        wait for 100ns;
        
        wait;
 end process;
            


end Behavioral;
