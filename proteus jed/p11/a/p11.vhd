library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Practica11 is port(
	clk, clr : in std_logic;
	ini : in std_logic;
	D : in std_logic_vector (5 downto 0);
	LB, EB, EC : out std_logic;
	A : inout std_logic_vector (5 downto 0)
);
end Practica11;

architecture aPractica11 of Practica11 is
type estados is (e0, e1, e2);
signal edo_act, edo_sig : estados;
signal Z, LA, EA, a0 : std_logic;

begin

	--proceso que determina el estado actual y el siguiente
	process(clk, clr)
	begin
		if(clr= '1') then
			edo_act <= e0;
		 elsif(rising_edge(clk)) then
		 	edo_act <= edo_sig;
		 end if;
	 end process;

	 --proceso que determina quien es el estado siguiente
	 process(edo_act, ini, z, a0)
	 begin
	 	LA <= '0';
		EA <= '0';
		LB <= '0';
		EB <= '0';
		EC <= '0';

		case edo_act is
			when e0 =>
				LB <= '1';
				if(ini = '1') then
					edo_sig <= e1;
				else
					LA <= '1';
					edo_sig <= e0;
				end if;
			when e1 =>
				EA <= '1';
				if(Z = '1') then
					edo_sig <= e2;
				elsif(z = '0') then
					if(a0 = '1') then
						EB <= '1';
					elsif(a0 = '0') then
						edo_sig <= e1;
					end if;
				end if;

			when e2 =>
				EC <= '1';
				if(ini = '1') then
					edo_sig <= e2;
				else
					edo_sig <= e0;
				end if;
		end case;	
	 end process;

	 --registro
	process(clk, clr)
	begin
		if(clr = '1') then
			A <= "000000";
		elsif(rising_edge(clk)) then
			if(EA='0' and LA = '1') then
				A <= D;
			elsif(EA = '1' and LA = '0') then
			A(5) <= '0';
			for i in 0 to 4 loop
			A(i) <= A(i+1);
			end loop;
			--A <= to_stdlogicvector(to_bitvector(A) ror 1); --falta corregir corrimiento a la derecha
			end if;
		end if;
	end process;

Z <= not(A(5) or A(4) or A(3) or A(2) or A(1) or A(0));
a0 <= A(0);
end architecture;
