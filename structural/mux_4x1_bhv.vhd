
library ieee;
use ieee.std_logic_1164.all;

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
    port(
        inputs : in  std_logic_vector(3 downto 0);
        sel    : in  std_logic_vector(1 downto 0);
        output : out std_logic
        );
end mux4x1;

architecture STR1 of mux4x1 is
    signal mux1_out, mux2_out : std_logic;

begin

    mux1_out <= inputs(2) when sel(0) = '0' else inputs(3);

    mux2_out <= inputs(0) when sel(0) = '0' else inputs(1);

    output <= mux2_out when sel(1) = '0' else mux1_out;

end STR1;