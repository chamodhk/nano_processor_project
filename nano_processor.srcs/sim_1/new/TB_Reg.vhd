----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 03:39:58 PM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is

    component Reg
        port (  Data : in STD_LOGIC_VECTOR (3 downto 0);
                En : in STD_LOGIC;                     
                Clk : in STD_LOGIC;                    
                Reset : in STD_LOGIC;                  
                Q : out STD_LOGIC_VECTOR (3 downto 0));
                
                
     end component;
     
     signal data, q : std_logic_vector(3 downto 0);
     signal en, reset : std_logic;
     signal clk: std_logic := '1';
            

begin

UUT : Reg
    port map (
        Data => data,
        Q => q,
        En => en,
        Reset => reset,
        Clk => clk);
        
 clock_process: process
 begin
    clk <= not clk;
    wait for 50ns;
end process;

simulation_process: process
begin
    
     reset <= '1';
     wait for 50ns;
     reset <= '0';
     
     data <= "1111";
     wait for 200ns;
     
     en <= '1';
     wait for 50ns;
     en <= '0';
     
     wait;
end process;
        
        


end Behavioral;
