LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY simulacion IS
END simulacion;
 
ARCHITECTURE behavior OF simulacion IS 
 
    COMPONENT sumador_restador
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

   signal s : std_logic_vector(3 downto 0);
   signal cout : std_logic;
 
BEGIN
 
   uut: sumador_restador PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );
 
   stim_proc: process
   begin		
      a <= "1111";
		b <= "0001";
		cin <= '0';
		wait for 40ns;
		a <= "1111";
		b <= "1111";
		cin <= '1';
		wait;
   end process;

END;