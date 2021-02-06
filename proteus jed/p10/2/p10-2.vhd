library ieee;
use ieee.std_logic_1164.all;
entity pr10 is port
(
	uni: in std_logic_vector(3 downto 0);
	dec: in std_logic_vector(2 downto 0);
	clk,clr: in std_logic;
	display: out std_logic_vector(6 downto 0);
	cat: inout std_logic_vector(2 downto 0)
);
end entity;
architecture p101 of pr10 is
signal edo: std_logic;
begin
	--Contador de anillo--
	process(clk,clr)
	begin
		if(clr='1')then
			cat<="011";
		elsif(rising_edge(clk))then
			cat<=TO_STDLOGICVECTOR(TO_BITVECTOR(cat)ror 1);
		end if;
	end process;
	--MULTIPLEXOR--
	process(cat)
	begin
		if(cat="110")then
			edo<='0';
		elsif(cat="101")then
			edo<='1';
		else
			edo<='-';
		end if;
	end process;
	--DECO--
	process(edo,clr)
	begin
		if(clr='1')then
			display<="0000000";
		elsif(edo='0')then--UNIDADES--
			case uni is
				when"0000"=>display<="1111110";
				when"0001"=>display<="0110000";
				when"0010"=>display<="1101101";
				when"0011"=>display<="1111001";
				when"0100"=>display<="0110011";
				when"0101"=>display<="1011011";
				when"0110"=>display<="1011111";
				when"0111"=>display<="1110000";
				when"1000"=>display<="1111111";
				when"1001"=>display<="1111011";
				when others=>display<="0000000";
			end case;
		elsif(edo='1')then
			case dec is
				when"000"=>display<="1111110";
				when"001"=>display<="0110000";
				when"010"=>display<="1101101";
				when"011"=>display<="1111001";
				when"100"=>display<="0110011";
				when"101"=>display<="1011011";
				when"110"=>display<="1011111";
				when"111"=>display<="1110000";
				when others=>display<="0000000";
			end case;
		end if;
	end process;
end architecture;
