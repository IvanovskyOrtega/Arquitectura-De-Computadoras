library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_restador is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end sumador_restador;

architecture Behavioral of sumador_restador is
begin
	
	process(a,b,cin) --Secuencial
	variable p,g : std_logic_vector(3 downto 0);
	variable eb : std_logic_vector(3 downto 0);
	variable c : std_logic_vector(4 downto 0);
	variable aux1 : std_logic := '1';
	variable aux2 : std_logic := '0';
	variable aux3 : std_logic := '1';
	begin
	
		c(0) := cin;
		
		for i in 0 to 3 loop
			
			eb(i) := b(i) xor c(0);
			p(i) := a(i) xor eb(i);
			g(i) := a(i) and eb(i);
			s(i) <= p(i) xor c(i);
			
			-- Se calcula aux1
			for j in 0 to i loop
				
				aux1 := aux1 and p(j);
			
			end loop;
			
			aux1 := c(0) and aux1;
			
			-- Se calcula aux2
			for k in 0 to i-1 loop
			
				-- Se calcula aux3
				for l in k+1 to i loop
				
					aux3 := aux3 and p(l);
				
				end loop;
				
				aux3 := g(k) and aux3;
				aux2 := aux2 or aux3;
				aux3 := '1';
			
			end loop;
			
			c(i+1) := g(i) or aux1 or aux2;
			aux1 := '1';
			aux2 := '0';
		
		end loop;
		
		cout <= c(4);
	
	end process;
	
end Behavioral;

