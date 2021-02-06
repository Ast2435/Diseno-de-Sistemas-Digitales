library ieee;
use ieee.std_logic_1164.all;

entity Prac7B is port(
	clk, clr, e : in std_logic;
	display : inout std_logic_vector(6 downto 0)
);
end Prac7B;

architecture aPrac7B of Prac7B is

begin
	process(clk, clr)
	begin
		if (clr = '1') then
			display <= "1111110"; --0
		elsif(rising_edge(clk)) then
			if(e = '1') then
				case display is 
					when "1111110" => --1
						display <= "0110000";
					when "0110000" => --2
						display <= "1101101";
					when "1101101" => --3
						display <= "1111001";
					when "1111001" => --4
						display <= "0110011";
					when "0110011" => --5
						display <= "1011011";
					when "1011011" => --6
						display <= "1011111";
					when "1011111" => --7
						display <= "1110000";
					when "1110000" => --8
						display <= "1111111";
					when "1111111" => --9
						display <= "1111011";
					when "1111011" => --A
						display <= "1110111";
					when "1110111" => --B
						display <= "0011111";
					when "0011111" => --C
						display <= "1001110";
					when "1001110" => --D
						display <= "0111101";
					when "0111101" => --E
						display <= "1001111";
					when "1001111" => --F
						display <= "1000111";
					when "1000111" => --0
						display <= "1111110";
					when others => display <= "-------";
				end case;
			 else
			 	display <= display;
			 end if;
		end if;
	end process;

end architecture;