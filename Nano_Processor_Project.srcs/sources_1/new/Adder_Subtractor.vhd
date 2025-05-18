library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_Subtractor is
    Port (
        A        : in  std_logic_vector(3 downto 0);
        B        : in  std_logic_vector(3 downto 0);
        CTRL     : in  std_logic; -- 0 = Add, 1 = Subtract
        S        : out std_logic_vector(3 downto 0);
        Zero     : out std_logic;
        Overflow : out std_logic
    );
end Adder_Subtractor;

architecture Behavioral of Adder_Subtractor is

    signal internal_s : std_logic_vector(3 downto 0);
    signal B_mod      : std_logic_vector(3 downto 0);

begin

    -- Optimize B_mod generation
    B_mod(0) <= B(0) xor CTRL;
    B_mod(1) <= B(1) xor CTRL;
    B_mod(2) <= B(2) xor CTRL;
    B_mod(3) <= B(3) xor CTRL;

    -- Instantiate RCA
    RCA_4_0: entity work.RCA_4
        port map (
            A     => A,
            B     => B_mod,
            C_in  => CTRL,
            S     => internal_s,
            C_out => Overflow
        );

    -- Reduce logic for Zero detection
    Zero <= '1' when internal_s = "0000" else '0';

    -- Direct output
    S <= internal_s;

end Behavioral;
