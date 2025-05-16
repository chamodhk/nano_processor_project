----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 08:08:43 PM
-- Design Name: 
-- Module Name: TB_processor - Behavioral
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

entity TB_processor is
--  Port ( );
end TB_processor;

architecture Behavioral of TB_processor is

    component  processor
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           Disp_out : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
                    
    end component; 



signal reset, clk, overflow, zero, sign : std_logic := '0';
signal led_out, anode : std_logic_vector (3 downto 0) := "0000";
signal Disp_out: std_logic_vector (6 downto 0);
signal ins: std_logic_vector (11 downto 0);
 signal q0, q1, q2, q3, q4, q5, q6, q7 : std_logic_vector (3 downto 0);

begin

    clock_process: process
    begin
        clk <= not clk;
        wait for 5ns;
    end process;
    
    UUT: processor
    port map (
        Reset => reset,
        Clk => clk,
        Overflow => overflow,
        Zero => zero,
        LED_out => led_out,
        Disp_out => disp_out,
        Anode => anode,
        Sign => sign,
        ins => ins,
        Reg0 => q0,
          Reg1 => q1,
          Reg2 => q2,
          Reg3 => q3,
          Reg4 => q4,
          Reg5 => q5,
          Reg6 => q6,
          Reg7 => q7);
        
        
    sim_process : process
    begin
        reset <= '1';
        wait for 10ns;
        reset <= '0';
        wait;
        
        
   end process;





end Behavioral;
