library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ieee;
use ieee.std_logic_1164.all;

entity practica6B is port(
	en, ud, l, clk, clr : in std_logic;
	c : out std_logic;
	d : in std_logic_vector(6 downto 0);
	q : inout std_logic_vector(6 downto 0) -- utilizaremos esto como nuestra salida
	--prescindimos de usar una salida display porque no cabe en una sola GAL
);
end practica6B;

architecture aPractica6B of practica6B is
begin

	process(clk, clr)
	begin
		if (clr='1') then
			q <= (others => '0'); --manera elegante de igualar todos los bits de q a 0
		elsif (rising_edge(clk)) then
			if (en = '0') then		--retencion
				q <= q;
			elsif (en = '1' and l = '1') then --carga
				q <= d;
			elsif (en = '1' and l = '0' and ud = '1') then --conteo ascendente aritmetico
				q <= q+1;
			elsif (en = '1' and l = '0' and ud = '0') then --conteo descendente aritmetico
				q <= q-1;
			end if;
		end if;

		if (clr = '0' and (q = "0000000" or q = "1111111")) then
				c <= '1';
		else
				c <= '0';
		end if;
	end process;

end architecture;

