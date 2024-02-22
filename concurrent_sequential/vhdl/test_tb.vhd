library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_tb is
end entity test_tb;

architecture tb_arch of test_tb is
  signal a, b, c, d, g: STD_LOGIC;

begin
  UUT: entity work.test(concurrent)
    port map (
      a => a,
      b => b,
      c => c,
      d => d,
      g => g
    );

  process
  begin
    a <= '0';
    b <= '0';
    c <= '0';
    d <= '0';
    wait for 10 ns;  -- Allow for some simulation time
    -- report "Input Vector: " & integer'image(to_integer(unsigned(a))) & integer'image(to_integer(unsigned(b))) & integer'image(to_integer(unsigned(c))) & integer'image(to_integer(unsigned(d)));
    -- report "Output bit: " & integer'image(to_integer(g));
    a <= '0';
    b <= '0';
    c <= '0';
    d <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    c <= '1';
    d <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    c <= '1';
    d <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '0';
    d <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '0';
    d <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '1';
    d <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '1';
    d <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    d <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    d <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    d <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    d <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    d <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    d <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    d <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    d <= '1';
    wait for 10 ns;
    wait;
  end process;
end architecture;
