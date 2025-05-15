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
    D0 : in STD_LOGIC_VECTOR (2 downto 0);
              D1 : in STD_LOGIC_VECTOR (2 downto 0);
              EN : in STD_LOGIC;
              S : in STD_LOGIC;
              Y : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    
    signal mux_out, pc_out, adder_out : std_logic_vector ( 2 downto 0) :="000";
   
    

begin

    PC : program_counter
    port map (  
        Reset => Reset,
        Clk => Clk,
        PC_in => mux_out,
        PC_out => pc_out);
        
        
    Incrementer: Adder_3
    port map (
        in_value => pc_out,
        out_value => adder_out,
        c_out => open);
        
        
    MUX: Mux_2_way_3_bit
    port map (
        D0 => adder_out, 
        D1 => jmp_addr,
        En => '1',
        S => jmp_flag,
        Y => mux_out);
        
        out_addr <= pc_out;
   


end Behavioral;
