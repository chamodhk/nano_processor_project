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
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           CTR : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : inout STD_LOGIC;
           Sign : inout STD_LOGIC);
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

signal  FA0_C, FA1_C, FA2_C, FA3_C, FA4_C, FA5_C, FA6_C, FA7_C: std_logic;
signal B_0,B_1,B_2,B_3, B_4, B_5, B_6, B_7  : std_logic;
signal S4, S5, S6, S7 : std_logic;


begin
    
    B_0 <= B0 XOR CTR;
    B_1 <= B1 XOR CTR;
    B_2 <= B2 XOR CTR;
    B_3 <= B3 XOR CTR;

    FA0_0: FA
        port map(
            A => A0,
            B => B_0,
            C_in => CTR,
            S => S0,
            C_out => FA0_C    
        );
    FA0_1: FA
        port map(
            A => A1,
            B => B_1,
            C_in => FA0_C,
            S => S1,
            C_out => FA1_C
        );
    FA0_2: FA
        port map(
            A => A2,
            B => B_2,
            C_in => FA1_C,
            S => S2,
            C_out => FA2_C
        );
    FA0_3: FA
    port map(
        A => A3,
        B => B_3,
        C_in => FA2_C,
        S => S3,
        C_out => C_out
    );
    
    Sign <= (NOT C_out) AND CTR;
    
    B_4 <= B0 XOR Sign;
    B_5 <= B1 XOR Sign;
    B_6 <= B2 XOR Sign;
    B_7 <= B3 XOR Sign;

    
    FA1_0: FA
        port map(
            A => '0',
            B => B_4,
            C_in => Sign,
            S => S4,
            C_out => FA4_C    
        );
    FA1_1: FA
        port map(
            A => '0',
            B => B_5,
            C_in => FA4_C,
            S => S5,
            C_out => FA5_C
        );
    FA1_2: FA
        port map(
            A => '0',
            B => B_6,
            C_in => FA5_C,
            S => S6,
            C_out => FA6_C
        );
    FA1_3: FA
    port map(
        A => '0',
        B => B_7,
        C_in => FA6_C,
        S => S7,
        C_out => open
    );
           
end Behavioral;
