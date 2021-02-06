library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Practica12C is port(
	clk, clr : in std_logic;
	dir : in std_logic_vector(3 downto 0);
	anillo : inout std_logic_vector(2 downto 0);
	display : out std_logic_vector(6 downto 0)
);
end Practica12C;

architecture aPractica12C of Practica12C is
signal aux : std_logic_vector(3 downto 0);
signal dato0 : std_logic_vector(3 downto 0);
signal dato1 : std_logic_vector(3 downto 0);
signal dato2 : std_logic_vector(3 downto 0);
type memoria is array (0 to 15) of std_logic_vector(3 downto 0);

--LETRAS
constant guion : std_logic_vector(3 downto 0) := "0000";
constant d : std_logic_vector(3 downto 0) := "0001";
constant I : std_logic_vector(3 downto 0) := "0011";
constant S : std_logic_vector(3 downto 0) := "0010";
constant E : std_logic_vector(3 downto 0) := "0110";
constant n : std_logic_vector(3 downto 0) := "0111";
constant o : std_logic_vector(3 downto 0) := "0101";
constant g : std_logic_vector(3 downto 0) := "0100";
constant t : std_logic_vector(3 downto 0) := "1100";
constant A : std_logic_vector(3 downto 0) := "1101";
constant L : std_logic_vector(3 downto 0) := "1111";
constant X : std_logic_vector(3 downto 0) := "1110";

--BANCO DE MEMORIA
constant banco2 : memoria := (
guion,
guion,
d,
I,
S,
E,
n,
o,
guion,
d,
I,
g,
I,
t,
A,
L
);

constant banco1 : memoria := (
guion,
d,
I,
S,
E,
n,
o,
guion,
d,
I,
g,
I,
t,
A,
L,
guion
);

constant banco0 : memoria := (
d,
I,
S,
E,
n,
o,
guion,
d,
I,
g,
I,
t,
A,
L,
guion,
guion
);

begin

--Contador de anillo--
	process(clk,clr)
	begin
		if(clr='1')then
			anillo<="011";
		elsif(rising_edge(clk))then
			anillo<=TO_STDLOGICVECTOR(TO_BITVECTOR(anillo) ror 1);
		end if;
	end process;

--Memoria--
	process(dir)
	begin
		dato0 <= banco0(conv_integer(dir));
		dato1 <= banco1(conv_integer(dir));
		dato2 <= banco2(conv_integer(dir));
	end process;

--Multiplexor--
	process(anillo)
	begin
		if(anillo = "110") then
			aux <= dato0;
		elsif(anillo = "101") then
			aux <= dato1;
		elsif(anillo = "011") then
			aux <= dato2;
		else
			aux <= "1110";  --no importa
		end if;
	end process;
--Decodificador--
	process(aux)
	begin
		case aux is
			when "0000" =>display <= "0000001"; --"-"
			when "0001" =>display <= "0111101"; --"d"
			when "0011" =>display <= "0110000"; --"I"
			when "0010" =>display <= "1011011"; --"S"
			when "0110" =>display <= "1001111"; --"E"
			when "0111" =>display <= "1010101"; --"ñ"
			when "0101" =>display <= "1111110"; --"o"
			when "0100" =>display <= "1111011"; --"g"
			when "1100" =>display <= "0001111"; --"t"
			when "1101" =>display <= "1110111"; --"A"
			when "1111" =>display <= "0001110"; --"L"
		--	when "1110" =>display <= "-------"; 
		--	when "1010" =>display <= "-------"; 
		--	when "1011" =>display <= "-------"; 
			when others => display <= "-------";
		end case;
	end process;
end architecture;
