
library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port(
        in0, in1, sel : in  std_logic;
        output        : out std_logic);
end mux2x1;

architecture default_arch of mux2x1 is
begin
    output <= in0 when sel = '0' else in1;
end default_arch;

-------------------------------------------------------------------------

-- Entity: mux4x1
-- Description: A structural implementation of a 4x1 mux using 3 separate 2x1
-- muxes. See mux4x1.pdf for a schematic of the architecture.

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
    port(
        inputs : in  std_logic_vector(3 downto 0);
        sel    : in  std_logic_vector(1 downto 0);
        output : out std_logic
        );
end mux4x1;

-- There are two different syntactic options for structural architectures.
-- The following architecture shows my recommended way, which requires the
-- least amount of code

architecture STR1 of mux4x1 is

    -- Signals for internal connections between muxes.
    signal mux1_out, mux2_out : std_logic;

begin
    
    U_MUX1 : entity work.mux2x1 port map (
        in0    => inputs(2),
        in1    => inputs(3),
        sel    => sel(0),
        output => mux1_out
        );

    U_MUX2 : entity work.mux2x1 port map (
        in0    => inputs(0),
        in1    => inputs(1),
        sel    => sel(0),
        output => mux2_out
        );

    U_MUX3 : entity work.mux2x1 port map (
        in0    => mux2_out,
        in1    => mux1_out,
        sel    => sel(1),
        output => output
        );

end STR1;


-- This archicture shows an alternative way instantiating other entities.

architecture STR2 of mux4x1 is
    
    component mux2x1
        port(
            in0    : in  std_logic;
            in1    : in  std_logic;
            sel    : in  std_logic;
            output : out std_logic
            );
    end component;

    signal mux1_out, mux2_out : std_logic;

begin

    -- When using components, we simply omit the entity work. syntax because
    -- we are now instantiating components as opposed to entities.    
    U_MUX1 : mux2x1 port map (
        in0    => inputs(2),
        in1    => inputs(3),
        sel    => sel(0),
        output => mux1_out
        );

    U_MUX2 : mux2x1 port map (
        in0    => inputs(0),
        in1    => inputs(1),
        sel    => sel(0),
        output => mux2_out
        );

    U_MUX3 : mux2x1 port map (
        in0    => mux2_out,
        in1    => mux1_out,
        sel    => sel(1),
        output => output
        );

end STR2;


-------------------------------------------------------------------------
-- Default architecture for evaluating the different implementations.

architecture default_arch of mux4x1 is
begin
    -- INSTRUCTIONS: change the comments to evaluate each architecture.
    U_MUX : entity work.mux4x1(STR1)
        --U_MUX : entity work.mux4x1(STR2)
        port map (
            inputs => inputs,
            sel    => sel,
            output => output);
end default_arch;