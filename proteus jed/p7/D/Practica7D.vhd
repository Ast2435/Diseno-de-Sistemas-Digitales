library ieee;
use ieee.std_logic_1164.all;

entity Prac7B is port(
	clk, clr, en : in std_logic;
	display : out std_logic_vector(6 downto 0)
);
end Prac7B;

architecture aPrac7B of Prac7B is
constant l0 : std_logic_vector(1 downto 0) := "00";
constant l1 : std_logic_vector(1 downto 0) := "01";
constant l2 : std_logic_vector(1 downto 0) := "10";

constant n2 : std_logic_vector(6 downto 0) := "1101101";
constant n0 : std_logic_vector(6 downto 0) := "1111110";
constant n1 : std_logic_vector(6 downto 0) := "0110000";
constant n7 : std_logic_vector(6 downto 0) := "1110000";
constant n6 : std_logic_vector(6 downto 0) := "1011111";
constant n3 : std_logic_vector(6 downto 0) := "1111001";
constant n8 : std_logic_vector(6 downto 0) := "1111111";

signal estado : std_logic_vector(8 downto 0);

begin
	process(clk, clr)
	begin
		if (clr = '1') then
			estado <= l0&"1101101";
		elsif(rising_edge(clk)) then
			if(en = '1') then
				case estado is 
					when "001101101" =>
						estado <= "001111110";
					when "001111110" =>
						estado <= "000110000";
					when "000110000" =>
						estado <= "001110000";
					when "001110000" =>
						estado <= "001011111";
					when "001011111" =>
						estado <= "001111001";
					when "001111001" =>
						estado <= "011111110";
					when "011111110" =>
						estado <= "101111110";
					when "101111110" =>
						estado <= "001111111";
					when "001111111" =>
						estado <= "010110000";
					when "010110000" =>
						estado <= "001101101";
					when others => estado <= "---------";
				end case;
			 else
			 	estado <= estado;
			 end if;
		end if;
	end process;

	display <= estado(6 downto 0); -- para solo tomar los bits que pertenecen a la letra e ignorar la etiqueta de repeticion
end architecture;