library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Practica12B is port(
	clk, clr : in std_logic;
	dir : in std_logic_vector(2 downto 0);
	anillo : inout std_logic_vector(2 downto 0);
	display : out std_logic_vector(6 downto 0)
);
end Practica12B;

architecture aPractica12B of Practica12B is
signal dato0 : std_logic_vector(6 downto 0);
signal dato1 : std_logic_vector(6 downto 0);
signal dato2 : std_logic_vector(6 downto 0);
type memoria is array (0 to 7) of std_logic_vector(6 downto 0);
constant banco2 : memoria := (
"0000001",  --"-"
"0000001",  --"-"
"0111101",  --"d"
"0110000",  --"I"
"1011011",  --"S"
"1001111",  --"E"
"1010101",  --"ñ"
"1111110"   --"O"
);

constant banco1 : memoria := (
"0000001",  --"-"
"0111101",  --"d"
"0110000",  --"I"
"1011011",  --"S"
"1001111",  --"E"
"1010101",  --"ñ"
"1111110",  --"O"
"0000001"   --"-"
);

constant banco0 : memoria := (
"0111101",  --"d"
"0110000",  --"I"
"1011011",  --"S"
"1001111",  --"E"
"1010101",  --"ñ"
"1111110",  --"O"
"0000001",  --"-"
"0000001"   --"-"
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
			display <= dato0;
		elsif(anillo = "101") then
			display <= dato1;
		elsif(anillo = "011") then
			display <= dato2;
		end if;
	end process;
end architecture;


