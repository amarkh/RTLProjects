library ieee;
use ieee.std_logic_1164.all;

entity decoder is
    port (
        clk, rst        : in  std_logic;
        inputA, inputB  : in  std_logic;
        en, done        : out std_logic
        );
end decoder;

-- Architecture: two_process
-- Description: 2-process implementation of the Decoder FSM shown in
-- notes.pdf

architecture two_process of decoder is

    type state_t is (START, COMPUTE, FINISH, RESTART);
    signal state_r, next_state : state_t;
    
begin

    process(clk, rst)
    begin
        if (rst = '1') then
            state_r <= START;
        elsif (rising_edge(clk)) then
            state_r <= next_state;
        end if;
    end process;

    process (state_r, go, ack)
    begin
        case (state_r) is
            when START =>
                if (go = '1') then
                    done       <= '0';
                    en         <= '0';
                    next_state <= COMPUTE;
                else
                    done       <= '0';
                    en         <= '0';
                    next_state <= START;
                end if;

            when COMPUTE =>
                if (ack = '1') then
                    en         <= '0';
                    done       <= '1';
                    next_state <= FINISH;
                else
                    en         <= '1';
                    done       <= '0';
                    next_state <= COMPUTE;
                end if;

            when FINISH =>
                if (go = '1') then
                    done       <= '1';
                    en         <= '0';
                    next_state <= FINISH;
                else
                    done       <= '1';
                    en         <= '0';
                    next_state <= RESTART;
                end if;

            when RESTART =>
                if (go = '1') then
                    done       <= '0';
                    en         <= '0';
                    next_state <= COMPUTE;
                else
                    done       <= '1';
                    en         <= '0';
                    next_state <= RESTART;
                end if;
        end case;
    end process;
end two_process;
