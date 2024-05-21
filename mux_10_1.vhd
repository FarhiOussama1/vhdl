library ieee ; 
use ieee.std_logic_1164.all ; 

entity mux_10_1 is 
   port ( key : out std_logic_vector (6 downto 0 ) ;
	       position : in std_logic_vector(3 downto 0 ) ; 
	       R1 : in std_logic_vector (6 downto 0);
			 R2 : in std_logic_vector (6 downto 0);
			 R3 : in std_logic_vector (6 downto 0);
			 R4 : in std_logic_vector (6 downto 0);
			 R5 : in std_logic_vector (6 downto 0);
			 R6 : in std_logic_vector (6 downto 0);
			 R7 : in std_logic_vector (6 downto 0);
			 R8 : in std_logic_vector (6 downto 0);
			 R9 : in std_logic_vector (6 downto 0);
			 R10 : in std_logic_vector (6 downto 0));
			 
end mux_10_1 ; 
architecture cs of mux_10_1 is 
begin  
    process(position, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10)
    begin
        case position is
            when "0011" =>
                key <= R1;
            when "0100" =>
                key <= R2;
            when "0101" =>
                key <= R3;
            when "0110" =>
                key <= R4;
            when "0111" =>
                key <= R5;
            when "1000" =>
                key <= R6;
            when "1001" =>
                key <= R7;
            when "1010" =>
                key <= R8;
            when "1011" =>
                key <= R9;
            when "1100" =>
                key <= R10;
            when others =>
                key <= (others => '0'); 
        end case;
    end process;
end cs;