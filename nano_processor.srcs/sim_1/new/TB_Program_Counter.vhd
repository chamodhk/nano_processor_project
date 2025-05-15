----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2025 12:48:19 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

    component Program_Counter
        port (
            Clk : in STD_LOGIC;                         
            Reset : in STD_LOGIC;                                          
            PC_in : in STD_LOGIC_VECTOR (2 downto 0);   
            PC_out : out STD_LOGIC_VECTOR (2 downto 0));
            
    end component;
    
    signal clk: std_logic := '0';
    signal reset, load: std_logic := '0';
    signal pc_in, pc_out: std_logic_vector (2 downto 0);

begin




clk_process: process
begin
    clk <= not(clk);
    wait for 50 ns;
end process;

UUT : Program_Counter
    port map (
        Clk => clk,
        reset => reset,
        pc_in => pc_in,
        pc_out => pc_out);
        
        
 sim_process: process
 begin
    
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 50ns;
        
        load <= '1';
        pc_in <= "111";
        wait for 50ns;
        load <= '0';
        wait for 150ns;
        
        reset <= '1';
        wait for 50ns;
        reset <='0';
        wait for 50ns;
        
        
        
        wait;
end process;
        


end Behavioral;
