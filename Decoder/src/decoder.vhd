library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
    port (
        clk, rst        : in  std_logic;
        inputA, inputB  : in  std_logic;
        output        : out std_logic_vector(15 downto 0)
        );
end decoder;

-- Architecture: two_process
-- Description: 2-process implementation of the Decoder FSM shown in
-- notes.pdf

architecture two_process of decoder is
    signal temp : integer range -32767 to 32768;
begin

    -- This process is to reset the signal value any time reset is true
    -- There shouldn't be a clock input for simply connecting an encoder to a FPGA
    -- It doesn't hurt to leave it in there.
    -- process(clk, rst)
    -- begin
    --     if (rst = '1') then
    --         temp <= 0;
    --     -- elsif (rising_edge(clk)) then

    --     end if;
    -- end process;

    process (rst, inputA, inputB)
    begin
        if (rst = '1') then
            temp <= 0;
        elsif(inputA = '1' and inputB = '0') then
            temp <= temp + 1;
        elsif (inputA = '0' and inputB = '1') then
            temp <= temp - 1;
        end if;

    end process;

    output <= std_logic_vector(to_unsigned(temp, 16));

end two_process;
