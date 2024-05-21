library ieee ; 
use  ieee.std_logic_1164.all ; 
use ieee.numeric_std.all;

entity stockage_R is 
  port ( message_entree : in std_logic_vector(6 downto 0 ); 
         CLOCK , R ,RESET , W : in std_logic ;
			message_sortie:  out std_logic_vector(6 downto 0 ) 
  ); 
end stockage_R ;

architecture cs of stockage_R is 
  component unite_de_memoire is 
      Port ( message_entree, CLOCK, W, R , reset : in  STD_LOGIC;
           message_sortie : out  STD_LOGIC);
   end component ; 	
begin 
bit1: unite_de_memoire port map (
               message_entree => message_entree (0),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(0)
      );
bit_2: unite_de_memoire port map (
                message_entree => message_entree (1),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(1)
      );
bit3: unite_de_memoire port map (
                message_entree => message_entree (2),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(2)
      );
bit4: unite_de_memoire port map (
               message_entree => message_entree (3),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(3)
      );
bit5: unite_de_memoire port map (
                message_entree => message_entree (4),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(4)
      );
bit6: unite_de_memoire port map (
               message_entree => message_entree (5),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(5)
      );
bit7: unite_de_memoire port map (
               message_entree => message_entree (6),
               CLOCK => CLOCK ,
					W => W,
					R =>R,
					reset => RESET,
               message_sortie => message_sortie(6)
      );
		
end cs; 