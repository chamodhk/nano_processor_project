----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 01:08:00 AM
-- Design Name: 
-- Module Name: MUX_2_Way_3_Bit_tb - Behavioral
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
use work.bus_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_2_Way_3_Bit_tb is
--  Port ( );
end MUX_2_Way_3_Bit_tb;

architecture Behavioral of MUX_2_Way_3_Bit_tb is
    component MUX_2_Way_3_Bit
        Port ( D : in bus_2_3_bits;
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0)
           );
    end component;

    -- Testbench signals
    signal D_tb  : bus_2_3_bits := (
                0 => "101",  -- input 0
                1 => "011"   -- input 1
                  );
    signal S_tb  : STD_LOGIC;
    signal EN_tb : STD_LOGIC;
    signal Y_tb  : STD_LOGIC_VECTOR(2 downto 0);
    
begin
uut: MUX_2_Way_3_Bit
    port map (
        D   => D_tb,
        S   => S_tb,
        EN  => EN_tb,
        Y   => Y_tb
    );
    
    process
    begin
        EN_tb <= '1';
        
        S_tb <= '0';
        wait for 100 ns;
        
        S_tb <= '1';
        wait for 100 ns;
        
        EN_tb <= '0';
        wait for 100 ns;
        
        wait;
   end process;
        


end Behavioral;
