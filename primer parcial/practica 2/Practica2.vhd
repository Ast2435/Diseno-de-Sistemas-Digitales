library ieee;
use ieee.std_logic_1164.all;

entity Practica2 is
	port(
	clk: in std_logic;
	clr: in std_logic;
	sel: in std_logic_vector (1 downto 0);
	T,D,S,R,J,K: in std_logic;
	display: out std_logic_vector (6 downto 0);
	Q: inout std_logic;
	nQ: inout std_logic);
end Practica2;

architecture aPractica2 of Practica2 is
	signal aux: std_logic;

begin
	process(clk, clr, sel, Q)

	begin
		if(sel = "01") then --ffT
			if(clr = '1') then
				Q <= '0';
				nQ <= '1';
				aux <= Q;
			elsif (clr = '0') then
				if rising_edge(clk) then
					Q <= Q;
					nQ <= not(Q);
					aux <= (T and nQ) or (not(T) and Q);
				end if;
			end if;


		elsif(sel = "10") then --ffD
			if(clr = '1') then
				Q <= '0';
				nQ <= '1';
				aux <= Q;
			elsif (clr = '0') then
				if rising_edge(clk) then
					Q <= D;
					nQ <= not(Q);
					aux <= Q;
				end if;
			end if;

		 elsif(sel = "00") then --ffJK
			if(clr = '1') then
				Q <= '0';
				nQ <= '1';
				aux <= Q;
			elsif (clr = '0') then
				if rising_edge(clk) then
					Q <= Q;
					nQ <= not(Q);
					aux <= (J and nQ) or (not(K) and Q);
				end if;
			end if;

			elsif(sel = "00") then --ffSR
			if(clr = '1') then
				Q <= '0';
				nQ <= '1';
				aux <= Q;
			elsif (clr = '0') then
				if rising_edge(clk) then
					Q <= Q;
					nQ <= not(Q);
					aux <= (S) or (not(R) and Q);
				end if;
			end if;
	end if;
	end process;

 --decoder
	process(aux)
		begin
			if(aux = '0') then
				display <= "1111110";
			else
				display <= "0110000";
		end if;
	end process;

end architecture;
