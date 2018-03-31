LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_alu IS
END test_alu;
 
ARCHITECTURE behavior OF test_alu IS 
 
    COMPONENT alu_4_bits
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         sel_a : IN  std_logic;
         sel_b : IN  std_logic;
         carrys : OUT  std_logic_vector(3 downto 0);
         res : OUT  std_logic_vector(3 downto 0);
         z_flag : OUT  std_logic;
         n_flag : OUT  std_logic;
         ov_flag : OUT  std_logic;
         c_flag : OUT  std_logic
        );
    END COMPONENT;
    
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal sel_a : std_logic := '0';
   signal sel_b : std_logic := '0';

	signal carrys : std_logic_vector(3 downto 0);
   signal res : std_logic_vector(3 downto 0);
   signal z_flag : std_logic;
   signal n_flag : std_logic;
   signal ov_flag : std_logic;
   signal c_flag : std_logic;
 
BEGIN
 
   uut: alu_4_bits PORT MAP (
          a => a,
          b => b,
          op => op,
          sel_a => sel_a,
          sel_b => sel_b,
          carrys => carrys,
          res => res,
          z_flag => z_flag,
          n_flag => n_flag,
          ov_flag => ov_flag,
          c_flag => c_flag
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		-- SUMA
      a <= "0101";
		b <= "1110";
		sel_a <= '0';
		sel_b <= '0';
		op <= "11";
      wait for 50 ns;
		-- RESTA
		sel_a <= '0';
		sel_b <= '1';
		op <= "11";
      wait for 50 ns;
		-- AND
		sel_a <= '0';
		sel_b <= '0';
		op <= "00";
      wait for 50 ns;
		-- NAND
		sel_a <= '1';
		sel_b <= '1';
		op <= "01";
      wait for 50 ns;
		-- OR
		sel_a <= '0';
		sel_b <= '0';
		op <= "01";
      wait for 50 ns;
		-- NOR
		sel_a <= '1';
		sel_b <= '1';
		op <= "00";
      wait for 50 ns;
		-- XOR
		sel_a <= '0';
		sel_b <= '0';
		op <= "10";
      wait for 50 ns;
		-- XNOR
		sel_a <= '0';
		sel_b <= '1';
		op <= "10";
      wait for 50 ns;
		
		-- SUMA
      a <= "0101";
		b <= "0111";
		sel_a <= '0';
		sel_b <= '0';
		op <= "11";	
      wait for 50 ns;
		-- RESTA
      a <= "0101";
		b <= "0101";
		sel_a <= '0';
		sel_b <= '1';
		op <= "11";	
      wait for 50 ns;
		-- NAND (NOT)
		sel_a <= '1';
		sel_b <= '1';
		op <= "01";	
      wait for 50 ns;

      wait;
   end process;

END;
