library ieee ;
use ieee.std_logic_1164 .all ; 
use ieee.numeric_std.all ; 
use ieee.std_logic_unsigned.all;

entity stockage_key is 
 port (key_entree  : in std_logic_vector(6 downto 0 )  ; 
       clk             : in std_logic                      ;
       reset           : in std_logic                      ; 
		 R_1_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_2_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_3_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_4_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_5_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_6_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_7_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_8_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_9_sortie      : out std_logic_vector(6 downto 0 ) ;
		 R_10_sortie     : out std_logic_vector(6 downto 0 ) );
end stockage_key ; 
architecture cs of stockage_key is 
component presence_test is 
     port(presence_on   : out  STD_LOGIC ;
          message_entree: in std_logic_vector(6 downto 0 ));
end component;
component stockage_R is
     port(message_entree       : in std_logic_vector(6 downto 0 ); 
          CLOCK , R ,RESET , W : in std_logic ;
	       message_sortie       :  out std_logic_vector(6 downto 0 )); 
end component;
component  incre is 
    port (presence_on : in std_logic ;
          reset       : in std_logic ;
          position    : out std_logic_vector(3 downto 0  )); 
end component ;
component guide_stockage is 
   port ( message : in std_logic_vector (6 downto 0 ) ;
	       position : in std_logic_vector(3 downto 0 ) ; 
	       R1 : out std_logic_vector (6 downto 0);
			 R2 : out std_logic_vector (6 downto 0);
			 R3 : out std_logic_vector (6 downto 0);
			 R4 : out std_logic_vector (6 downto 0);
			 R5 : out std_logic_vector (6 downto 0);
			 R6 : out std_logic_vector (6 downto 0);
			 R7 : out std_logic_vector (6 downto 0);
			 R8 : out std_logic_vector (6 downto 0);
			 R9 : out std_logic_vector (6 downto 0);
			 R10 : out std_logic_vector (6 downto 0));
end component;
signal presence_message : std_logic ;
signal position : std_logic_vector( 3 downto 0 );
signal R1       : std_logic_vector( 6 downto 0 );
signal R2       : std_logic_vector( 6 downto 0 );
signal R3       : std_logic_vector( 6 downto 0 );
signal R4       : std_logic_vector( 6 downto 0 );
signal R5       : std_logic_vector( 6 downto 0 );
signal R6       : std_logic_vector( 6 downto 0 );
signal R7       : std_logic_vector( 6 downto 0 );
signal R8       : std_logic_vector( 6 downto 0 );
signal R9       : std_logic_vector( 6 downto 0 );
signal R10      : std_logic_vector( 6 downto 0 );
signal R1_presence      : std_logic;
signal R2_presence      : std_logic;
signal R3_presence      : std_logic;
signal R4_presence      : std_logic;
signal R5_presence      : std_logic;
signal R6_presence      : std_logic;
signal R7_presence      : std_logic;
signal R8_presence      : std_logic;
signal R9_presence      : std_logic;
signal R10_presence     : std_logic;

begin
test_message : presence_test port map (
               presence_on => presence_message,
					message_entree => key_entree);
incre_on     : incre         port map (
               presence_on => presence_message,
               reset       => reset ,
               position    => position
               );
demux : guide_stockage port map (
               message  =>key_entree,
	            position =>position,
	            R1 =>R1,
			      R2 =>R2,
			      R3 =>R3,
			      R4 =>R4,
			      R5 =>R5,
			      R6 =>R6,
			      R7 =>R7,
			      R8 =>R8,
			      R9 =>R9,
			      R10 =>R10);
test_1 :       presence_test port map (
               presence_on => R1_presence ,
					message_entree => R1);
test_2 :       presence_test port map (
               presence_on => R2_presence ,
					message_entree => R2);
test_3 :       presence_test port map (
               presence_on => R3_presence ,
					message_entree => R3);
test_4 :       presence_test port map (
               presence_on => R4_presence ,
					message_entree => R4);
test_5 :       presence_test port map (
               presence_on => R5_presence ,
					message_entree => R5);
test_6 :       presence_test port map (
               presence_on => R6_presence ,
					message_entree => R6);
test_7 :       presence_test port map (
               presence_on => R7_presence ,
					message_entree => R7);
test_8 :       presence_test port map (
               presence_on => R8_presence ,
					message_entree => R8);
test_9 :       presence_test port map (
               presence_on => R9_presence ,
					message_entree => R9);
test_10:       presence_test port map (
               presence_on => R10_presence ,
					message_entree => R10);	
ram1 :         stockage_R    port map (
               message_entree  => R1,    
               CLOCK => clk ,
					R => not R1_presence,
					RESET =>reset,
					W => R1_presence,
	            message_sortie  =>  R_1_sortie  
               );
ram2 :         stockage_R    port map (
               message_entree  => R2,    
               CLOCK => clk ,
					R => not R2_presence,
					RESET =>reset,
					W => R2_presence,
	            message_sortie  =>  R_2_sortie  
               );
ram3 :         stockage_R    port map (
               message_entree  => R3,    
               CLOCK => clk ,
					R => not R3_presence,
					RESET =>reset,
					W => R3_presence,
	            message_sortie  =>  R_3_sortie  
               );
ram4 :         stockage_R    port map (
               message_entree  => R4,    
               CLOCK => clk ,
					R => not R4_presence,
					RESET =>reset,
					W => R4_presence,
	            message_sortie  =>  R_4_sortie  
               );
ram5 :         stockage_R    port map (
               message_entree  => R5,    
               CLOCK => clk ,
					R => not R5_presence,
					RESET =>reset,
					W => R5_presence,
	            message_sortie  =>  R_5_sortie  
               );
ram6 :         stockage_R    port map (
               message_entree  => R6,    
               CLOCK => clk ,
					R => not R6_presence,
					RESET =>reset,
					W => R6_presence,
	            message_sortie  =>  R_6_sortie  
               );
ram7 :         stockage_R    port map (
               message_entree  => R7,    
               CLOCK => clk ,
					R => not R7_presence,
					RESET =>reset,
					W => R7_presence,
	            message_sortie  =>  R_7_sortie  
               );
ram8 :         stockage_R    port map (
               message_entree  => R8,    
               CLOCK => clk ,
					R => not R8_presence,
					RESET =>reset,
					W => R8_presence,
	            message_sortie  =>  R_8_sortie  
               );
ram9 :         stockage_R    port map (
               message_entree  => R9,    
               CLOCK => clk ,
					R => not R9_presence,
					RESET =>reset,
					W => R9_presence,
	            message_sortie  =>  R_9_sortie  
               );
ram10 :         stockage_R    port map (
               message_entree  => R10,    
               CLOCK => clk ,
					R => not R10_presence,
					RESET =>reset,
					W => R10_presence,
	            message_sortie  =>  R_10_sortie  
               );
end cs;				