----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 02:01:20 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           CTR : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR(3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is


component FA
    port(
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic
    );
    
    
    
end component;

signal  FA0_C, FA1_C, FA2_C: std_logic;
signal B_0,B_1,B_2,B_3 : std_logic;



begin
    
    B_0 <= B(0) XOR CTR;
    B_1 <= B(1) XOR CTR;
    B_2 <= B(2) XOR CTR;
    B_3 <= B(3) XOR CTR;

    FA0_0: FA
        port map(
            A => A(0),
            B => B_0,
            C_in => CTR,
            S => S(0),
            C_out => FA0_C    
        );
    FA0_1: FA
        port map(
            A => A(1),
            B => B_1,
            C_in => FA0_C,
            S => S(1),
            C_out => FA1_C
        );
    FA0_2: FA
        port map(
            A => A(2),
            B => B_2,
            C_in => FA1_C,
            S => S(2),
            C_out => FA2_C
        );
    FA0_3: FA
    port map(
        A => A(3),
        B => B_3,
        C_in => FA2_C,
        S => S(3),
        C_out => Overflow
    );
    
    Zero <= NOT(S(0) OR S(1) OR S(2) OR S(3));
           
end Behavioral;