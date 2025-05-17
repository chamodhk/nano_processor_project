----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2025 05:45:52 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is
    component RCA_4 
    port(A : in STD_LOGIC_VECTOR(3 downto 0);
         B : in STD_LOGIC_VECTOR(3 downto 0);
         CTR : in STD_LOGIC;
         S : inout STD_LOGIC_VECTOR(3 downto 0);
         Overflow: out STD_LOGIC;
         Zero : out STD_LOGIC);
    end component;

    signal a,b,s : std_logic_vector(3 downto 0);
    signal ctr,overflow, zero : std_logic := '0';

    
    begin
    
        UUT: RCA_4
        port map(
            A => a,
            B => b,
            CTR =>ctr,
            S => s,
            Overflow => overflow,
            Zero => zero
         );
    
       stim_process: process
       begin
       
            --test addition
            ctr <= '0';
            a <= "0000";
            b <= "0000";
            wait for 100ns;
            
            a <= "0001";
            b <= "0010";
            wait for 100ns;
            
            a <= "0010";
            b <= "0011";
            wait for 100ns;
            
            
            a <= "0011";
            b <= "0100";
            wait for 100ns;
            
            --test subtraction
            
            ctr <= '1';
            
            a <= "1111";
            b <= "0101";
            wait for 100ns;
            
            a <= "0111";
            b <= "0111";
            wait for 100ns; 
                      
          wait;
       end process;
    
end Behavioral;
