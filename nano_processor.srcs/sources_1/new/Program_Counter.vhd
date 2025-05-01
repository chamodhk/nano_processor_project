library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_Counter is
    Port (
        Clk    : in  STD_LOGIC;
        Reset  : in  STD_LOGIC;
        Load   : in  STD_LOGIC;
        PC_in  : in  STD_LOGIC_VECTOR(2 downto 0);
        PC_out : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
    signal pc : unsigned(2 downto 0) := "000";
begin

    process(Clk, Reset)
    begin
        if Reset = '1' then
            pc <= "000";
        elsif rising_edge(Clk) then
            if Load = '1' then
                pc <= unsigned(PC_in);
            elsif pc < "111" then  -- Stop incrementing at 7
                pc <= pc + 1;
            end if;
        end if;
    end process;

    PC_out <= std_logic_vector(pc);

end Behavioral;
