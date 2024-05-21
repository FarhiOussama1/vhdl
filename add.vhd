library ieee ;
use ieee.std_logic_1164 .all ; 
use ieee.numeric_std.all ; 
use ieee.std_logic_unsigned.all;

entity add is 
 port ( encry : in std_logic ;
        decry : in std_logic ;
        x     : in  std_logic_vector(6 downto 0 );
        key   : in  std_logic_vector (6 downto 0);
		  R     : out std_logic_vector (6 downto 0));
end entity ;
architecture cs of add is
signal interne_x : integer ;
signal interne_key : integer ;
signal interne_R : integer ;
begin 
  process(encry, decry)
  begin 
  if encry = '1' then 
  interne_x <= to_integer(unsigned(x));
  interne_key <= to_integer(unsigned(key));
  interne_R <= interne_x + interne_key ;
  R          <= std_logic_vector(to_unsigned(interne_R ,7));
  end if ;
  if decry = '1' then 
  interne_x <= to_integer(unsigned(x));
  interne_key <= to_integer(unsigned(key));
  interne_R <= interne_x - interne_key ;
  R          <= std_logic_vector(to_unsigned(interne_R ,7));
  end if ;
  end process;
end cs ;