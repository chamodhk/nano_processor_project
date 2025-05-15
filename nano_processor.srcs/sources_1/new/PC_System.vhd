----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 01:15:44 PM
-- Design Name: 
-- Module Name: PC_System - Behavioral
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

entity PC_System is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           jmp_addr : in STD_LOGIC_VECTOR (2 downto 0);
           jmp_flag : in STD_LOGIC;
           out_addr : out STD_LOGIC_VECTOR (2 downto 0));
end PC_System;

architecture Behavioral of PC_System is

    component program_counter
    port (
     Reset : in STD_LOGIC;
     Clk : in STD_LOGIC;
     PC_in : in STD_LOGIC_VECTOR (2 downto 0);
     PC_out : out STD_LOGIC_VECTOR (2 downto 0));
        
   end component;
   
   component Adder_3
   port (
   in_value : in STD_LOGIC_VECTOR (2 downto 0);
              out_value : out STD_LOGIC_VECTOR (2 downto 0);
              c_out : out STD_LOGIC);
   end component;
   
   
   component MUX_2_Way_3_Bit
   port (
    D : in bus_2_3_bits;
             S : in STD_LOGIC;
             EN : in STD_LOGIC;
             Y : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
   
    

begin


end Behavioral;
