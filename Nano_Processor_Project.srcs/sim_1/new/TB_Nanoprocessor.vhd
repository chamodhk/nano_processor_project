library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.processor_components.all;



entity TB_Nanoprocessor is
    -- port();
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

    signal Clock : std_logic; -- Clock
    signal Reset : std_logic; -- Reset
    signal Data : data_bus;
    signal Overflow: std_logic;
    signal Zero : std_logic;
    
    signal Next_Address : instruction_address; -- From PC Incremeter to Address Selector
    signal Current_Address : instruction_address; -- From PC to ROM
    signal Selected_Address : instruction_address; -- From Address Selector to PC
    signal Jump_Address : instruction_address; -- From Instruction Decoder to Address Selector
    signal Jump_Flag : std_logic; -- From Instruction Decoder to Address Selector
    signal Instruction : instruction_bus; -- From Program ROM to Instruction Decoder
    
    signal Load_Selection : std_logic; -- From Instruction Decoder to Load Selector
    signal Immediate_Value : data_bus; -- From Instruction Decoder to Load Selector
    signal OprASelect : register_address; -- From Instruction Decoder to Operand Selector A
    signal OprBSelect : register_address; -- From Instruction Decoder to Operand Selector B
    signal OprAData : data_bus; -- From Operand Selector A to AU
    signal OprBData : data_bus; -- From Operand Selector B to AU
    signal Operation_Res : data_bus; -- From AU to Load Selector
    signal Register_Data : data_buses; -- From Register Bank to Operand Selectors
    signal AddSubSelect : std_logic; -- From Instruction Decoder to AU
    signal Register_Enable : register_address; -- From Instruction Decoder to Register Bank
    signal Selected_Load : data_bus; -- From Load Selector to Register Bank
    
    begin
    
        -- Program Counter
        Program_Counter_0 : Program_counter port map(
            PC_in => Selected_Address, -- From Address Selector
            Clk => Clock,
            Reset => Reset,
            PC_out => Current_Address -- Goes to ROM
        );
    
        -- Program Counter Incrementer
        PC_Incrementer : Program_counter_incrementor port map(
            in_address => Current_Address, -- From PC
            out_address => Next_Address -- To Address Selector
        );
    
        -- Address Selector
        Address_Selector_0 : jump_pc_selector port map(
            Program_counter_address => Next_Address, -- From PC Incrementer
            Jump_address => Jump_Address, -- From Instruction Decoder
            Jump_flag => Jump_Flag, -- From Instruction Decoder
            Jump_pc_selector_out => Selected_Address -- To Program Counter
        );
    
        -- Program ROM
        Program_ROM_0 : Program_ROM port map(
            ROM_address => Current_Address, -- From PC
            I => Instruction -- To Instruction Decoder
        ); 
    
        -- Instruction Decoder
        Instruction_Decoder_0 : Instruction_Decoder port map(
            Instruction => Instruction, -- From Program ROM
            Jump_register_value=> OprAData, -- From Operand Selector A
            Register_enable => Register_Enable, -- To Register Bank 
            Register_select_A => OprASelect, -- To Operand Selector A
            Register_select_B => OprBSelect, -- To Operand Selector B
            Operation => AddSubSelect, -- To AU
            Immediate_value => Immediate_Value, -- To Load Selector
            Jump_flag => Jump_Flag, -- To Address Selector
            Jump_address => Jump_Address, -- To Address Selector
            Load_select => Load_Selection -- To Load Selector
        );
    
        -- Load Selector
        Load_Selector_0 : Load_immediate_selector port map(
            Load_select=> Load_Selection, -- From Instruction Decoder
            Immediate_value => Immediate_Value, -- From Instruction Decoder
            ALU_value => Operation_Res, -- From AU
            Out_value => Selected_Load -- To Register Bank
        );
    
        -- Operand Selector (Multiplexer) A
        Opr_Selector_A : MUX_8_4 port map(
            S => OprASelect, -- From Instruction Decoder
            D => Register_Data, -- From Register Bank
            Y => OprAData -- To AU
        );
    
        -- Operand Selector (Multiplexer) B
        Opr_Selector_B : MUX_8_4 port map(
            S => OprBSelect, -- From Instruction Decoder
            D => Register_Data, -- From Register Bank
            Y => OprBData -- To AU
        );
    
        -- Arithmetic Unit
        Arithmetic_Unit_0 : Adder_Subtractor port map(
            A => OprAData, -- From Operand Selector A
            B => OprBData, -- From Operand Selector B
            S => Operation_Res, -- To Load Selector
            Overflow => Overflow, -- To Overflow Flag
            Zero => Zero, -- To Zero Flag
            CTRL => AddSubSelect -- From Instruction Decoder
        );
    
        -- Register Bank
        Register_Bank_0 : Register_Bank port map(
            Reg_EN => Register_Enable, -- From Instruction Decoder
            Res => Reset, -- Reset
            Clk => Clock,
            Data => Selected_Load, -- From Load Selector
            Data_Buses => Register_Data -- To Operand Selectors
        );
    
        Data <= Register_Data(7); -- Last Register Data

        clk_process : process
        begin
            Clock <= '0';
            wait for 20ns;
            Clock <= '1';
            wait for 20ns;
        end process;

        reset_process : process
        begin
            Reset <= '1';
            wait for 40ns;
            Reset <= '0';
            wait for 500ns;
            
            Reset <= '1';
            wait for 40ns;
            Reset <= '0';
            wait;
            
            
        end process;

        
    end Behavioral;
    