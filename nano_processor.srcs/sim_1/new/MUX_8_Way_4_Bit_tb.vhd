----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:44:21 AM
-- Design Name: 
-- Module Name: MUX_8_Way_4_Bit_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_8_Way_4_Bit_tb is
--  Port ( );
end MUX_8_Way_4_Bit_tb;

architecture Behavioral of MUX_8_Way_4_Bit_tb is
    component MUX_8_Way_4_Bit
    Port (
        D : in bus_8_4_bits;
        S   : in  STD_LOGIC_VECTOR (2 downto 0);
        EN  : in  STD_LOGIC;
        Y   : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;
    
    signal D_tb   : bus_8_4_bits := (
                    0 => "0001", 1 => "0010", 2 => "0011", 3 => "0100",
                    4 => "0101", 5 => "0110", 6 => "0111", 7 => "1000"
                  );
    signal S_tb   : STD_LOGIC_VECTOR(2 downto 0);
    signal EN_tb  : STD_LOGIC;
    signal Y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin
    uut: MUX_8_Way_4_Bit
            Port map (
                D   => D_tb,
                S   => S_tb,
                EN  => EN_tb,
                Y   => Y_tb
            );
            
    process
    begin
        EN_tb <= '1';
        
        -- Loop through all 8 inputs
        for i in 0 to 7 loop
            S_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for 100 ns;
        end loop;
        
        -- Disable the MUX
        EN_tb <= '0';
        wait for 100 ns;
        
        wait;
    end process;
            
end Behavioral;
