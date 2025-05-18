library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.processor_components.all;

entity Processor is
    Port (
        Clk        : in std_logic;
        Reset      : in std_logic;
        Overflow   : out std_logic;
        Zero       : out std_logic;
        Data       : out data_bus;
        seg        : out std_logic_vector(6 downto 0);
        addr       : out instruction_address;
        anode      : out bus_4_bit
    );
end Processor;

architecture Behavioral of Processor is

    -- Clock and reset
    signal clk_slow : std_logic;

    -- Address and instruction signals
    signal next_addr      : instruction_address;
    signal current_addr   : instruction_address;
    signal selected_addr  : instruction_address;
    signal jmp_address    : instruction_address;
    signal jmp_flag       : std_logic;

    signal Instruction    : instruction_bus;
    signal load_sel       : std_logic;

    -- Register and ALU control
    signal oprA_addr      : register_address;
    signal oprB_addr      : register_address;
    signal oprA_val       : data_bus;
    signal oprB_val       : data_bus;
    signal au_result      : data_bus;
    signal reg_enable     : register_address;
    signal load_imm_out   : data_bus;
    signal add_sub_sel    : std_logic;
    signal register_data  : data_buses;
    signal immediate_val  : data_bus;

begin

    -- Output data bus from register 7
    Data <= register_data(7);

    -- Connect slowed clock
    CLK_0 : Slow_Clk
        port map (
            Clk_in  => Clk,
            Clk_out => clk_slow
        );

    -- Instruction Decoder
    ID: Instruction_decoder
        port map (
            Instruction         => Instruction,
            Jump_Register_Value => oprA_val,
            Register_enable     => reg_enable,
            Register_select_A   => oprA_addr,
            Register_select_B   => oprB_addr,
            Operation           => add_sub_sel,
            Immediate_value     => immediate_val,
            Jump_flag           => jmp_flag,
            Jump_address        => jmp_address,
            Load_select         => load_sel
        );

    -- PC Incrementor
    PC_IN: program_counter_incrementor
        port map (
            in_address  => current_addr,
            out_address => next_addr
        );

    -- Select immediate vs ALU
    Load_IM_SEL: Load_immediate_selector
        port map (
            ALU_value       => au_result,
            immediate_value => immediate_val,
            Load_select     => load_sel,
            Out_value       => load_imm_out
        );

    -- 7-Segment Display Decoder
    LUT_16_7_0: LUT_16_7
        port map (
            address => register_data(7),
            data    => seg
        );

    -- Operand Selection
    OPR_A: MUX_8_4
        port map (
            S => oprA_addr,
            D => register_data,
            Y => oprA_val
        );

    OPR_B: MUX_8_4
        port map (
            S => oprB_addr,
            D => register_data,
            Y => oprB_val
        );

    -- Program ROM
    PROM: Program_ROM
        port map (
            ROM_address => current_addr,
            I           => Instruction
        );

    -- Jump or Next PC Selector
    jump_pc_selector_0: jump_pc_selector
        port map (
            program_counter_address => next_addr,
            jump_address            => jmp_address,
            jump_flag               => jmp_flag,
            jump_pc_selector_out   => selected_addr
        );

    -- Program Counter with async Reset
    PC: Program_counter
        port map (
            Reset  => Reset,
            Clk    => clk_slow,
            PC_in  => selected_addr,
            PC_out => current_addr
        );

    -- Register Bank
    Registet_Bank_0: Register_bank
        port map (
            Reg_En     => reg_enable,
            Res        => Reset,
            Clk        => clk_slow,
            Data       => load_imm_out,
            Data_Buses => register_data
        );

    -- ALU
    Adder_subtractor_0: Adder_subtractor
        port map (
            A        => oprA_val,
            B        => oprB_val,
            CTRL     => add_sub_sel,
            S        => au_result,
            Zero     => Zero,
            Overflow => Overflow
        );

    -- Output PC Address and active anode for display
    addr <= current_addr;
    anode <= "1110"; -- Activate only one digit (adjust as needed)

end Behavioral;
