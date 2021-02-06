library ieee;
use ieee.std_logic_1164.all;

entity Prac7A is port(
	clk, clr, e : in std_logic;
	display : inout std_logic_vector(6 downto 0)
);
end Prac7A;

architecture aPrac7A of Prac7A is

begin
	process(clk, clr)
	begin
		if (clr = '1') then
			display <= "0110000";
		elsif(rising_edge(clk)) then
			if(e = '1') then
				case display is
					when "0110000" =>
						display <= "1101101";
					when "1101101" =>
						display <= "1111001";
					when "1111001" =>
						display <= "0110011";
					when "0110011" =>
						display <= "1011011";
					when "1011011" =>
						display <= "1011111";
					when "1011111" =>
						display <= "0110000";
					when others => display <= "-------";
				end case;
			 else
			 	display <= display;
			 end if;
		end if;
	end process;

end architecture;
