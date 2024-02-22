
library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1 is
    -- Each input and output on the port is a "signal," which will be explained
    -- in detail later. For now, think of it as a variable from other languages.
    -- However, be aware that VHDL also has variables that behave differently
    -- than signals.
    port(
        in0    : in  std_logic;
        in1    : in  std_logic;
        sel    : in  std_logic;
        output : out std_logic);
end mux_2x1;

architecture bhv of mux_2x1 is
begin
    -- *********************************************************************
    -- Synthesis guideline for combinational logic: All inputs to the
    -- combinational logic must be included in the sensitivity list.
    -- *********************************************************************
    process(in0, in1, sel)
    begin
        if (sel = '0') then
            output <= in0;
        elsif(sel = '1') then
            output <= in1;
    -- ********************************************************************* 
    -- Synthesis guideline for combinational logic: All outputs must be
    -- defined on all paths through a process.
    ------------------------------------------------------------------------
    -- If there exists a path that doesn't define an output, 
    -- that output will become a latch during synthesis.
    -- *********************************************************************
        else
            output <= 'X';
        end if;
    end process;
end bhv;