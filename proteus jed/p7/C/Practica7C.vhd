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

constant i : std_logic_vector(6 downto 0) := "0000110";
constant n : std_logic_vector(6 downto 0) := "0010101";
constant f : std_logic_vector(6 downto 0) := "1000111";
constant e : std_logic_vector(6 downto 0) := "1001111";
constant r : std_logic_vector(6 downto 0) := "0000111";
constant o : std_logic_vector(6 downto 0) := "1111110";
constant s : std_logic_vector(6 downto 0) := "1011011";

signal estado : std_logic_vector(8 downto 0);

begin
	process(clk, clr)
	begin
		if (clr = '1') then
			estado <= l0&i;
		elsif(rising_edge(clk)) then
			if(en = '1') then
				case estado is 
					when "000000110" =>
						estado <= "000010101";
					when "000010101" =>
						estado <= "001000111";
					when "001000111" =>
						estado <= "010000110";
					when "010000110" =>
						estado <= "001001111";
					when "001001111" =>
						estado <= "000000111";
					when "000000111" =>
						estado <= "010010101";
					when "010010101" =>
						estado <= "001111110";
					when "001111110" =>
						estado <= "001011011";
					when "001011011" =>
						estado <= "000000110";
					when others => estado <= "---------";
				end case;
			 else
			 	estado <= estado;
			 end if;
		end if;
	end process;

	display <= estado(6 downto 0); -- para solo tomar los bits que pertenecen a la letra e ignorar la etiqueta de repeticion
end architecture;