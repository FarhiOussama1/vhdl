library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity presence_test is  
port(
presence_on  : out  STD_LOGIC ;
message_entree: in std_logic_vector(6 downto 0 )
);
end presence_test;
architecture cs of presence_test is
signal interne_entree_int : integer ;
begin 
process (message_entree)
begin 
interne_entree_int <= to_integer(unsigned(message_entree));
presence_on <= '0';   
-- Check if any bit in signal_entree is high
if  interne_entree_int >= 1 then
      presence_on <= '1';
	else	
      presence_on <= '0';	
   end if;
end process ;
end cs;