library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_4_bits is generic ( n : Integer := 4 );
    Port ( 
			  a : in  STD_LOGIC_VECTOR (n-1 downto 0);	-- Entrada a
           b : in  STD_LOGIC_VECTOR (n-1 downto 0);	-- Entrada b
			  op : in  STD_LOGIC_VECTOR (1 downto 0);		-- Vector de Operacion
			  sel_a : in  STD_LOGIC;							-- Selector de a
			  sel_b : in  STD_LOGIC;							-- Selector de b
			  carrys : out STD_LOGIC_VECTOR (n-1 downto 0);-- Vector de acarreos
           res : out  STD_LOGIC_VECTOR (n-1 downto 0);-- Resultado
			  z_flag : out  STD_LOGIC;							-- Bandera Zero
			  n_flag : out  STD_LOGIC;							-- Bandera de signo
			  ov_flag : out  STD_LOGIC;						-- Bandera de Overflow
           c_flag : out  STD_LOGIC);						-- Bandera de acarreo
end alu_4_bits;

architecture Behavioral of alu_4_bits is

begin
	process(a,b,op,sel_a,sel_b)
		variable A_AUX : STD_LOGIC_VECTOR (n-1 downto 0);
		variable B_AUX : STD_LOGIC_VECTOR (n-1 downto 0);
		variable RES_AUX : STD_LOGIC_VECTOR (n-1 downto 0);
		variable C : STD_LOGIC_VECTOR (n  downto 0);
		variable Z_AUX  : STD_LOGIC;								-- Bandera Zero Auxiliar
		
		begin
		
			C := "00000";
			C(0) := sel_b;
			Z_AUX := '0';
			
			for i in 0 to n-1 loop
			
				A_AUX(i) := a(i) xor sel_a;
				B_AUX(i) := b(i) xor sel_b; 
			
				case op is
					when "00" => RES_AUX(i) := A_AUX(i) and B_AUX(i); -- AND
					when "01" => RES_AUX(i) := A_AUX(i) or B_AUX(i);  -- OR
					when "10" => RES_AUX(i) := A_AUX(i) xor B_AUX(i); -- XOR
					when others =>                        -- SUMA O RESTA
						RES_AUX(i) := A_AUX(i) xor B_AUX(i) xor C(i);
						C(i+1) := (B_AUX(i) and C(i)) or (A_AUX(i) and C(i)) or (A_AUX(i) and B_AUX(i));
				end case;
				
				Z_AUX := Z_AUX or RES_AUX(i);
				
			end loop;
			
			z_flag <= not Z_AUX;
			c_flag <= C(n);
			n_flag <= RES_AUX(n-1);
			ov_flag <= C(n) xor C(n-1);
			carrys <= C(n-1 downto 0);
			res <= RES_AUX;
			
	end process;

end Behavioral;

