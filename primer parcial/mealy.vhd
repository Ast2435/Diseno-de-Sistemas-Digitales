library ieee;
use ieee.std_logic_1164.all;

entity Mealy is port(
	clk, clr, e: in std_logic,
	s: out std_logic
	);
end Mealy;

architecture aMealy of Mealy is
signal q0, q1, d0, d1: std_logic;
begin
	process(clk, clr)
	begin
		if(clr='1') then
			q0 <= '0';
			q1 <= '0';
		elsif(rising_edge(clk)) then
			q0 <= d0;
			q1 <= d1;
		end if;
	end process;

	d0 <= ((not q1) and e) or (q0 and e);
	d1 <= (q0 abd e) or (q1 and q0);
	s <= q1 and (not q0) and e;
end aMealy;