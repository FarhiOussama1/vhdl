library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unite_de_memoire  is
    Port ( message_entree, CLOCK, W, R , reset : in  STD_LOGIC;
           message_sortie : out  STD_LOGIC);
end unite_de_memoire ;

architecture cs of unite_de_memoire  is
    component bascul
        Port ( clk, d : in  STD_LOGIC;
               q : out  STD_LOGIC);
    end component;
    
    signal A, D : STD_LOGIC;
begin
PROCESS (W)
BEGIN
    if reset = '1' then
	 A <= '0';
	 else
	 A <= (W and message_entree) or ((not W) and D)  ;
	 end if ;
END PROCESS;
    U1: bascul port map(clk => CLOCK, d => A, q => D);
process(R , reset)
BEGIN
	 message_sortie <= D AND R  ;
END PROCESS;
end cs ;