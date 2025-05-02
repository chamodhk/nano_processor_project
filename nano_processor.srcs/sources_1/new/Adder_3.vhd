----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 12:03:24 PM
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( in_value : in STD_LOGIC_VECTOR (2 downto 0);
           out_value : out STD_LOGIC_VECTOR (2 downto 0);
           c_out : out STD_LOGIC);
end Adder_3;

architecture Behavioral of Adder_3 is

    component FA
        port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C_in : in STD_LOGIC;
              S : out STD_LOGIC;
              C_out : out STD_LOGIC);
    end component;
    
    signal carry: std_logic;
            

begin

    FA0 : FA
        port map
            (A => in_value(2),
             B => '1',
             C_in => '0',
             S => out_value(2),
             C_out => carry);
             
             
    FA1: FA
        port map
            (A => in_value(1),
             B => '0',
             C_in => carry,
             S => out_value(1),
             C_out => carry);
             
             
     FA2: FA
        port map
            (A => in_value(2),
             B => '0',
             C_in => carry,
             S => out_value(2),
             C_out => carry);
             
             
             C_out <= carry;
                          
             
   
end Behavioral;
