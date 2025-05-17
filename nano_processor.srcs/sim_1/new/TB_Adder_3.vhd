----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 12:16:07 PM
-- Design Name: 
-- Module Name: TB_Adder_3 - Behavioral
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

entity TB_Adder_3 is
--  Port ( );
end TB_Adder_3;

architecture Behavioral of TB_Adder_3 is

    component Adder_3
        port ( in_value : in STD_LOGIC_VECTOR (2 downto 0);
               out_value : out STD_LOGIC_VECTOR (2 downto 0)
       );
               
    end component; 
    
    signal inVal, outVal : std_logic_vector( 2 downto 0);   
            

begin

    UUT: Adder_3
        port map (
            in_value => inVal,
            out_value => outVal
       );
            
    
    simulation: process
    begin
        inVal <= "000";
        wait for 100ns;
        
        inVal <= "111";
        wait for 100ns;
        
        inVal <= "100";
        wait for 100ns;
        
     
        inVal <="010";
        wait for 100ns;
        wait;
    end process;
            




end Behavioral;
