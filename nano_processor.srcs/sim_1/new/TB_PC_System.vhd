----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 03:23:29 PM
-- Design Name: 
-- Module Name: TB_PC_System - Behavioral
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

entity TB_PC_System is
--  Port ( );
end TB_PC_System;

architecture Behavioral of TB_PC_System is


    component PC_System 
    port (
        reset : in STD_LOGIC;
        clk : in STD_LOGIC;
        jmp_addr : in STD_LOGIC_VECTOR (2 downto 0);
        jmp_flag : in STD_LOGIC;
        out_addr : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    
    
    signal reset, clk, jmp_flag : std_logic := '0';
    signal jmp_addr, out_addr : std_logic_vector (2 downto 0) := "000";
    
begin

   clock_process: process
   begin
        clk <= not clk;
        wait for 50ns;
        
   end process;

UUT : PC_System
    port map (
        reset => reset,
        clk => clk,
        jmp_flag => jmp_flag,
        jmp_addr => jmp_addr,
        out_addr => out_addr);
        
        

   
   sim_process : process
   begin
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 50ns;
        
        jmp_addr <= "111";
        jmp_flag <= '1';
        wait for 100ns;
        jmp_flag <= '0';
        
        
        
        
        
        wait;
        
    end process;
        
        



end Behavioral;
