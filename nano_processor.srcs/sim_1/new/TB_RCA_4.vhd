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
         C_in : in STD_LOGIC;
         CTR : in STD_LOGIC;
         S : inout STD_LOGIC_VECTOR(3 downto 0);
         C_out : out STD_LOGIC;
         Zero : out STD_LOGIC);
    end component;

signal A,B,S : std_logic_vector(3 downto 0);
signal Ci : std_logic := '0';
signal Ctr : std_logic := '0';
signal Co,zero : std_logic;
    
    begin
    
        UUT: RCA_4 port map(
            A(0) => A(0),
            A(1) => A(1),
            A(2) => A(2),
            A(3) => A(3),
            B(0) => B(0),
            B(1) => B(1),
            B(2) => B(2),
            B(3) => B(3),
            C_in => Ci,
            CTR => Ctr,
            S(0) => S(0),
            S(1) => S(1),
            S(2) => S(2),
            S(3) => S(3),
            C_out => Co,
            Zero => zero
        );
    
       process
        begin
            -- Test Case 1: 0000 + 0000
            A(0) <= '0';
            A(1) <= '0'; 
            A(2) <= '0'; 
            A(3) <= '0';
            B(0) <= '0'; 
            B(1) <= '0'; 
            B(2) <= '0'; 
            B(3) <= '0';
            Ctr <= '0'; 
            Ci <= '0';
            wait for 100 ns;
    
            -- Test Case 2: 1101 - 0011 (CTR=1 for subtraction perhaps)
            A(0) <= '1'; 
            A(1) <= '0'; 
            A(2) <= '1'; 
            A(3) <= '1';  -- A = 1101 (13)
            B(0) <= '0'; 
            B(1) <= '0'; 
            B(2) <= '1'; 
            B(3) <= '1';  -- B = 1100 (12)
            Ctr <= '1'; -- If your design subtracts when CTR = 1
            wait for 100 ns;
    
            -- Test Case 3: 0011 + 0001
            A(0) <= '1'; 
            A(1) <= '1'; 
            A(2) <= '0'; 
            A(3) <= '0';  -- A = 0011 (3)
            B(0) <= '1'; 
            B(1) <= '0'; 
            B(2) <= '0'; 
            B(3) <= '0';  -- B = 0001 (1)
            Ctr <= '0';
            wait for 100 ns;
    
            -- Test Case 4: 0000 - 1000
            A(0) <= '0'; 
            A(1) <= '0'; 
            A(2) <= '0'; 
            A(3) <= '0';  -- A = 0000 (0)
            B(0) <= '0'; 
            B(1) <= '0'; 
            B(2) <= '0'; 
            B(3) <= '1';  -- B = 1000 (8)
            Ctr <= '1'; -- Subtract mode
            wait for 100 ns;
            
            --Test Case 5: 1100 - 1100
            A(0) <= '0';
            A(1) <= '0';
            A(2) <= '1';
            A(3) <= '1';
            B(0) <= '0';
            B(1) <= '0';
            B(2) <= '1';
            B(3) <= '1';
            Ctr <= '1';
     
    
            wait;
        end process;
    
end Behavioral;
