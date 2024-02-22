library ieee;
use ieee.std_logic_1164.all;

-- Entity: reg_async_rst
-- Description: Implements a register with an active high, asynchronous reset.

entity reg_async_rst is
    generic(
        WIDTH : positive
        );
    port(
        clk    : in  std_logic;
        rst    : in  std_logic;
        input  : in  std_logic_vector(WIDTH-1 downto 0);
        output : out std_logic_vector(WIDTH-1 downto 0)
        );
end reg_async_rst;

architecture BHV of reg_async_rst is
begin
    -- GUIDELINE 1 FOR SEQUENTIAL LOGIC: The sensitivity list should
    -- only have clock and reset (if there is an asynchronous reset). It
    -- technically shouldn't hurt anything if you include other signals, but
    -- they are not necessary, can slow down a simulation by needlessly
    -- retriggering the process, and might confuse a bad synthesis tool.
    
    process(clk, rst)
    begin
        -- SYNTHESIS GUIDELINE 2 FOR SEQUENTIAL LOGIC: All sequential logic with
        -- async reset should be described using the following basic structure:
        --
        -- if reset
        --   handle reset 
        -- elsif rising clock edge
        --   specify all non-reset functionality
        -- end if
        
        if (rst = '1') then
            -- Reset the output to all 0s.
            output <= (others => '0');
            
        elsif (rising_edge(clk)) then

            -- SYNTHESIS RULE: Any assignment to a signal on a rising clock
            -- edge will be synthesized as a register
            output <= input;
        end if;
    end process;
end BHV;