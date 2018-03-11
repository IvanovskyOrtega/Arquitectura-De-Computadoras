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
signal eb : std_logic_vector(3 downto 0);
signal c : std_logic_vector(4 downto 0);
begin
	c(0) <= cin;
	suma_resta: for i in 0 to 3 generate
	begin
		eb(i) <= b(i) xor c(0);
		s(i) <= a(i) xor eb(i) xor c(i);
		c(i+1) <= (eb(i) and c(i)) or (a(i) and c(i)) or (a(i) and eb(i));
	end generate suma_resta;
	cout <= c(4);
end Behavioral;

