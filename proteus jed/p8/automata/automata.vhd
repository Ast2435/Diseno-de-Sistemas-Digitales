library ieee;
use ieee.std_logic_1164.all;

entity Automata is port(
	clr, clk : in std_logic;
	e : in std_logic_vector(2 downto 0);
	estado : out std_logic_vector(9 downto 0)
);
end Automata;

--AUTOMATA DE MARQUESINA
architecture aAutomata of Automata is

--DISPLAYS
CONSTANT ND : std_logic_vector(2 downto 0) := "000";
CONSTANT D0 : std_logic_vector(2 downto 0) := "001";
CONSTANT D1 : std_logic_vector(2 downto 0) := "010";
CONSTANT D2 : std_logic_vector(2 downto 0):= "100";
--LETRAS DEL MENSAJE
CONSTANT NL : std_logic_vector(6 downto 0) := "1111111";
CONSTANT L1 : std_logic_vector(6 downto 0) := "0110111";
CONSTANT L2 : std_logic_vector(6 downto 0) := "1111110";
CONSTANT L3 : std_logic_vector(6 downto 0) := "0001110";
CONSTANT L4 : std_logic_vector(6 downto 0) := "1110111";
--ESTADOS DEL AUTÓMATA
CONSTANT Q0 : std_logic_vector(9 downto 0) := ND&NL;
CONSTANT Q1 : std_logic_vector(9 downto 0) := D0&L1;
CONSTANT Q2 : std_logic_vector(9 downto 0) := D1&L1;
CONSTANT Q3 : std_logic_vector(9 downto 0) := D0&L2;
CONSTANT Q4 : std_logic_vector(9 downto 0) := D2&L1;
CONSTANT Q5 : std_logic_vector(9 downto 0) := D1&L2;
CONSTANT Q6 : std_logic_vector(9 downto 0) := D0&L3;
CONSTANT Q7 : std_logic_vector(9 downto 0) := D2&L2;
CONSTANT Q8 : std_logic_vector(9 downto 0) := D1&L3;
CONSTANT Q9 : std_logic_vector(9 downto 0) := D0&L4;
CONSTANT Q10 : std_logic_vector(9 downto 0) := D2&L3;
CONSTANT Q11 : std_logic_vector(9 downto 0) := D1&L4;
CONSTANT Q12 : std_logic_vector(9 downto 0) := D2&L4;

signal aux : std_logic_vector(9 downto 0) := "0001111111";
begin

	process(clk, clr)
		begin
			if (clr = '1') then
				aux <= Q0;
			elsif(rising_edge(clk)) then
				case aux is
					when "0001111111" =>
						if(e = "000" or e = "001") then
							aux <= Q0;
						elsif( e = "010") then
							aux <= Q1;
						else
							aux <= "----------";
						end if;
				    when "0010110111" =>
						if(e = "010") then
							aux <= Q1;
						elsif( e = "011") then
							aux <= Q2;
						else
							aux <= "----------";
						end if;
				    when "0100110111" =>
						if(e = "011") then
							aux <= Q3;
						elsif( e = "100") then
							aux <= Q4;
						else
							aux <= "----------";
						end if;
					when "0011111110" =>
						if(e = "011") then
							aux <= Q2;
						elsif( e = "100") then
							aux <= Q4;
						else
							aux <= "----------";
						end if;
					when "1000110111" =>
						if(e = "100") then
							aux <= Q5;
						elsif( e = "101") then
							aux <= Q7;
						else
							aux <= "----------";
						end if;
					when "0101111110" =>
						if(e = "100") then
							aux <= Q6;
						elsif( e = "101") then
							aux <= Q7;
						else
							aux <= "----------";
						end if;
					when "0010001110" =>
						if(e = "100") then
							aux <= Q4;
						elsif( e = "101") then
							aux <= Q7;
						else
							aux <= "----------";
						end if;
					when "1001111110" =>
						if(e = "101") then
							aux <= Q8;
						elsif( e = "110") then
							aux <= Q10;
						else
							aux <= "----------";
						end if;
					when "0100001110" =>
						if(e = "101") then
							aux <= Q9;
						elsif( e = "110") then
							aux <= Q10;
						else
							aux <= "----------";
						end if;
					when "0011110111" =>
						if(e = "101") then
							aux <= Q7;
						elsif( e = "110") then
							aux <= Q10;
						else
							aux <= "----------";
						end if;
					when "1000001110" =>
						if(e = "110") then
							aux <= Q11;
						elsif( e = "111") then
							aux <= Q12;
						else
							aux <= "----------";
						end if;
					when "0101110111" =>
						if(e = "110") then
							aux <= Q10;
						elsif( e = "111") then
							aux <= Q12;
						else
							aux <= "----------";
						end if;
					when "1001110111" =>
						if(e = "111") then
							aux <= Q12;
						elsif( e = "000") then
							aux <= Q0;
						else
							aux <= "----------";
						end if;
				   when others => aux <= "----------";
				end case;
			end if;
			
	estado <= aux; --los primeros 3 bits pertenecen al selector de display, el resto a la salida de display.
	end process;

end architecture;
