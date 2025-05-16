----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:31:31 PM
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           LED_out : out STD_LOGIC_VECTOR (3 downto 0);
           Disp_out : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0);
           Sign : out STD_LOGIC
           );
end processor;

architecture Behavioral of processor is


    component Instruction_decoder
    port (
        Instruction_bus : in STD_LOGIC_VECTOR (11 downto 0);
               Jmp_check_flags : in STD_LOGIC_VECTOR (3 downto 0);
               Immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
               Load_sel : out STD_LOGIC;
               Add_sub_sel : out STD_LOGIC;
               Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
               Jmp_flag : out STD_LOGIC;
               Jmp_Addr : out STD_LOGIC_VECTOR (2 downto 0));
               
    end component;
    
    component Slow_Clk 
    port (
        Clk_in : in std_logic;
        Clk_out : out std_logic);
    end component;
    
    
    component MUX_2_4
    port (
    D0 : in STD_LOGIC_VECTOR (3 downto 0);
               D1 : in STD_LOGIC_VECTOR (3 downto 0);
               S : in STD_LOGIC;
               D_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    
    component PC_System
    port (
    reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               jmp_addr : in STD_LOGIC_VECTOR (2 downto 0);
               jmp_flag : in STD_LOGIC;
               out_addr : out STD_LOGIC_VECTOR (2 downto 0));
               
   end component;
               
               
    component MUX_8_way_4_Bit
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC;
               D0 : in STD_LOGIC_VECTOR (3 downto 0);
               D1 : in STD_LOGIC_VECTOR (3 downto 0);
               D2 : in STD_LOGIC_VECTOR (3 downto 0);
               D3 : in STD_LOGIC_VECTOR (3 downto 0);
               D4 : in STD_LOGIC_VECTOR (3 downto 0);
               D5 : in STD_LOGIC_VECTOR (3 downto 0);
               D6 : in STD_LOGIC_VECTOR (3 downto 0);
               D7 : in STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
               
               
   end component;
   
   component Reg_Bank
   port (
        Clk       : in  STD_LOGIC;
              Reg_sel   : in  STD_LOGIC_VECTOR (2 downto 0);
              Input_val : in  STD_LOGIC_VECTOR (3 downto 0);
              Reset     : in  STD_LOGIC;
              Q0        : out STD_LOGIC_VECTOR (3 downto 0);
              Q1        : out STD_LOGIC_VECTOR (3 downto 0);
              Q2        : out STD_LOGIC_VECTOR (3 downto 0);
              Q3        : out STD_LOGIC_VECTOR (3 downto 0);
              Q4        : out STD_LOGIC_VECTOR (3 downto 0);
              Q5        : out STD_LOGIC_VECTOR (3 downto 0);
              Q6        : out STD_LOGIC_VECTOR (3 downto 0);
              Q7        : out STD_LOGIC_VECTOR (3 downto 0));
              
    end component;
    
    component RCA_4
    port (
    
    A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               C_in : in STD_LOGIC;
               CTR : in STD_LOGIC;
               S : inout STD_LOGIC_VECTOR(3 downto 0);
               C_out : inout STD_LOGIC;
               Sign : inout STD_LOGIC;
               Zero: out std_logic);
               
    end component;
    
    component LUT_16_7
    port (
    address : in STD_LOGIC_VECTOR (3 downto 0);
               data : out STD_LOGIC_VECTOR (6 downto 0));
               
    end component;
    
    
    component Program_ROM
    port (
    address : in STD_LOGIC_VECTOR (2 downto 0);
               instruction : out STD_LOGIC_VECTOR (11 downto 0));
               
     end component;
     
    
        
 signal instruction_bus : std_logic_vector (11 downto 0);
 signal program_rom_address: std_logic_vector (2 downto 0);
 signal jmp_flags, immediate_val : std_logic_vector (3 downto 0);
 signal reg_sel_a, reg_sel_b, reg_en, jmp_addr : std_logic_vector (2 downto 0);
 signal load_sel, add_sub_sel, jmp_flag, rca_overflow, rca_sign, slow_clock_out : std_logic;
 signal q0, q1, q2, q3, q4, q5, q6, q7, mux_a_out, mux_b_out, rca_out, mux_2_4_out : std_logic_vector (3 downto 0);
 
        
        
        

begin

    clock : slow_clk
    port map (
        clk_in => clk,
        clk_out => slow_clock_out);


    PC : PC_System
    port map (
        reset => Reset,
        clk => slow_clock_out,
        jmp_addr => jmp_addr,
        jmp_flag => jmp_flag,
        out_addr => program_rom_address);

    P_ROM : Program_ROM 
    port map (
        address => program_rom_address,
        instruction => instruction_bus );
        
        
    Instruction_Decoder_0 : Instruction_Decoder
    port map (
        Instruction_bus => instruction_bus,
        Jmp_check_flags => jmp_flags,
        Immediate_val => immediate_val,
        Load_sel => load_sel,
        Add_sub_sel => add_sub_sel,
        Reg_sel_A => reg_sel_a,
        Reg_sel_B => reg_sel_b,
        Reg_en => reg_en,
        jmp_flag => jmp_flag,
        jmp_addr => jmp_addr );
        
        
        
   Register_Bank : Reg_Bank
   port map (
        Clk => Clk,
        Reg_sel => reg_en,
        Reset => Reset,
        Input_val => mux_2_4_out,
        Q0 => q0,
        Q1 => q1,
        Q2 => q2,
        Q3 => q3,
        Q4 => q4,
        Q5 => q5,
        Q6 => q6,
        Q7 => q7 );
        
        
   MUX_A : Mux_8_way_4_bit
   port map (
       S => reg_sel_a,
       En => '1',
       D0 => q0,
       D1 => q1,
       D2 => q2,
       D3 => q3,
       D4 => q4,
       D5 => q5,
       D6 => q6,
       D7 => q7,
       Y => mux_a_out );
       
   MUX_B : Mux_8_way_4_bit
   port map (
       S => reg_sel_b,
       En => '1',
       D0 => q0,
       D1 => q1,
       D2 => q2,
       D3 => q3,
       D4 => q4,
       D5 => q5,
       D6 => q6,
       D7 => q7,
       Y => mux_b_out);
       
   Adder_subtractor : RCA_4
   port map (
        A => mux_a_out,
        B => mux_b_out,
        C_in => '0',
        CTR => add_sub_sel,
        S => rca_out,
        C_out => rca_overflow,
        Sign => rca_sign,
        Zero => Zero);
        
        
        
   MUX_2_way_4_bit : MUX_2_4
   port map (
        D0 => rca_out,
        D1 => immediate_val,
        S => load_sel,
        D_Out => mux_2_4_out);
        
        
        
   LUT : LUT_16_7
   port map (
       address => q7,
       data => disp_out);
        

        
  Overflow <= rca_overflow;
  Sign <= rca_sign;
  LED_out <= q7;
  Anode <= "0000";
  

        
  

end Behavioral;
