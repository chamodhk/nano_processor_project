library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- Optional: depends on your signal operations
use work.buses.all;
use work.processor_components.all;

entity Processor_tb is
end Processor_tb;

architecture Behavioral of Processor_tb is

    -- Component declaration
    component Processor is
        Port (
            Clk : in std_logic;
            Reset : in std_logic;
            Overflow : out std_logic;
            Zero : out std_logic;
            Data : out data_bus;
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Signals to connect to DUT
    signal Clk_tb       : std_logic := '0';
    signal Reset_tb     : std_logic := '0';
    signal Overflow_tb  : std_logic;
    signal Zero_tb      : std_logic;
    signal Data_tb      : data_bus;
    signal seg_tb       : std_logic_vector(6 downto 0);

begin

    -- DUT instance
    UUT: Processor
        port map (
            Clk => Clk_tb,
            Reset => Reset_tb,
            Overflow => Overflow_tb,
            Zero => Zero_tb,
            Data => Data_tb,
            seg => seg_tb
        );

    -- Clock generation (10 ns period = 100 MHz)
    Clk_Process : process
    begin
        Clk_tb <= '0';
        wait for 5 ns;
        Clk_tb <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    Stim_Proc: process
    begin
        -- Initial reset
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';

        -- Wait for a while to observe behavior
        wait for 500 ns;

        -- Optionally force reset again mid-sim
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';

        -- Run longer
        wait for 1000 ns;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
