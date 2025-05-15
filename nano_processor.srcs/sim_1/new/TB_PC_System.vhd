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
    
    
begin




end Behavioral;
