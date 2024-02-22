library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add is
    port (
        x, y : in std_logic_vector(15 downto 0);
        z    : out std_logic_vector(15 downto 0)
    );
end entity add;

architecture bhv of add is

begin
    z <= std_logic_vector(unsigned(x) + unsigned(y));
end bhv;