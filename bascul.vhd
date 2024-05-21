library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascul is
    Port ( clk, d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end bascul;

architecture cs of bascul is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d; 
        end if;
    end process;
end cs;