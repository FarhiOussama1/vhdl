library ieee ; 
use ieee.std_logic_1164.all ; 
use ieee.std_logic_unsigned.all ; 
use ieee.numeric_std.all ;

entity incre_mux is 
  port (presence_on : in std_logic ;
        reset : in std_logic ;
        position : out std_logic_vector(3 downto 0  ));
end incre_mux ; 


architecture cs of incre_mux is 
signal stockage_position : integer := 0;
begin 
   process (presence_on)
   begin
   if reset = '1' then 
     stockage_position <= 2 ;
	else
	if presence_on = '1' then 
	 stockage_position <= stockage_position + 1 ;
	end if ;
	end if ; 
	position <= std_logic_vector (to_unsigned(stockage_position, 4));
	end process ;
end cs ; 
