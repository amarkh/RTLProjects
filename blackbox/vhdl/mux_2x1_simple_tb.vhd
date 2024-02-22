library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- The testbench is just an entity with no I/O. Testbenches can have I/O, but
-- they usually don't unless you are creating a hierarchy of testbenches.
entity mux_2x1_simple_tb is
end mux_2x1_simple_tb;


architecture default_tb of mux_2x1_simple_tb is

    -- Declare local signals for all I/O of the entity we want to test.
    -- I highly suggest using the same names as the entity's port.
    signal in0                : std_logic;
    signal in1                : std_logic;
    signal sel                : std_logic;
    signal output             : std_logic;

begin  -- TB

    U_MUX : entity work.mux_2x1
        port map (
            in0    => in0,
            in1    => in1,
            sel    => sel,
            output => output);

    process
    begin
        -- test inputs 11
        in0 <= '1';
        in1 <= '1';
        sel <= '0';
        wait for 10 ns;

        sel <= '1';
        wait for 10 ns;

        -- The wait statement ends the infinite loop created by the process.
        wait;

    end process;

end default_tb;