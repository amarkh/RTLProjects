library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
    port (
        a, b, c, d : in std_logic;
        g          : out std_logic
    );
end entity test;

architecture concurrent of test is
  signal e : std_logic;
  signal f : std_logic;
begin
  e <= a and b;
  f <= e or c;
  g <= f and d;
end concurrent;

architecture sequential of test is
    signal e : std_logic;
    signal f : std_logic;
begin
  process(a, b, c, d)
  begin
    e <= a and b;
    f <= e or c;
    g <= f and d;
  end process;
end sequential;

architecture sensitivity_list of test is
  signal e : std_logic;
  signal f : std_logic;
begin
process
begin
  e <= a and b;
  f <= e or c;
  g <= f and d;
  wait on a; wait on b; wait on c; wait on d;
end process;
end sensitivity_list;

architecture variables of test is
begin
  process(a, b, c, d)
  variable e : std_logic;
  variable f : std_logic;
  begin

  e := a and b;
  f := e or c;
  g <= f and d;

  end process;
end variables;