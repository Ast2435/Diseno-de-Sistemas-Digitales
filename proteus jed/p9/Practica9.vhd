library ieee;
use ieee.std_logic_1164.all;

entity Practica9 is port(
	clk, clr : in std_logic;
	filas : in std_logic_vector(3 downto 0);  --3 a 0 son filas.
	anillo : inout std_logic_vector(2 downto 0);
	display : out std_logic_vector(6 downto 0)
);
end Practica9;


architecture aPractica9 of Practica9 is
signal L : std_logic;
signal regAux : std_logic_vector(6 downto 0);
--signal anillo : std_logic_vector(2 downto 0);
signal matrix : std_logic_vector(6 downto 0);


CONSTANT N1 : std_logic_vector(6 downto 0) := "1111001";
CONSTANT N2 : std_logic_vector(6 downto 0) := "0010010";
CONSTANT N3 : std_logic_vector(6 downto 0) := "0000110";
CONSTANT N4 : std_logic_vector(6 downto 0) := "1001100";
CONSTANT N5 : std_logic_vector(6 downto 0) := "0100100";
CONSTANT N6 : std_logic_vector(6 downto 0) := "0100000";
CONSTANT N7 : std_logic_vector(6 downto 0) := "0001111";
CONSTANT N8 : std_logic_vector(6 downto 0) := "0000000";
CONSTANT N9 : std_logic_vector(6 downto 0) := "0000100";
CONSTANT N0 : std_logic_vector(6 downto 0) := "0000001";
CONSTANT AS : std_logic_vector(6 downto 0) := "1001000";
CONSTANT NG : std_logic_vector(6 downto 0) := "1000001";
begin

	--CODIFICADOR
	matrix <= filas&anillo;

	--REGISTRO
	process(clk, clr)
		begin
			if(clr = '1') then
				regAux <= "1111111";
			elsif(rising_edge(clk)) then
				if(L = '0') then  --RETENCION
					regAux <= regAux;
				elsif(L = '1') then
					case matrix is
						when "1110011" =>
					 		regAux <= N1;
						when "1110101" =>
					 		regAux <= N2;
						when "1110110" =>
					 		regAux <= N3;
						when "1101011" =>
					 		regAux <= N4;
						when "1101101" =>
					 		regAux <= N5;
						when "1101110" =>
					 		regAux <= N6;
						when "1011011" =>
					 		regAux <= N7;
						when "1011101" =>
					 		regAux <= N8;
						when "1011110" =>
					 		regAux <= N9;
						when "0111011" =>
					 		regAux <= AS;
						when "0111101" =>
					 		regAux <= N0;
						when "0111110" =>
					 		regAux <= NG;
						when others => regAux <= "-------";
					end case;
				end if;
			end if;
	end process;

	--CONTADOR DE ANILLO
	process(clk, clr)
		begin
			if(clr = '1') then
				anillo <= "110";
			elsif( rising_edge(clk)) then
				anillo <= to_stdlogicvector(to_bitvector(anillo) rol 1);
			end if;
	end process;

	L <= not(filas(3) and filas(2) and filas(1) and filas(0));
	display <= regAux;
end architecture;
