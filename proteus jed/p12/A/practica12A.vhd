library ieee;
use ieee.std_logic_1164.all;

entity practica8 is port(
	en, clk, clr : in std_logic;
	q : inout std_logic_vector(9 downto 0)
);
end practica8;

architecture aPractica8 of practica8 is
begin

	process(clk, clr)
	--usamos variable porque necesitamos cambiar este valor durante el proceso, las señales se actualizan hasta el final del proceso
	variable aux : std_logic;
	begin
		if (clr = '1') then
			q <= (others => '0'); --asigna 0 a todo el vector de q
		elsif (rising_edge(clk)) then
			aux := '1';  --se tiene que inicializar aqui, no  afuera.
			for i in 0 to 9 loop
				if (i-1 >= 0) then --para el primer caso donde i es 0, el segundo for entraria en un -1 lo cual causa problemas
					for j in 0 to i-1 loop -- este loop es para calcular la parte despues del xor en la formula obtenida
						aux := aux and q(j); --por ejemplo si i=5 esto calcula: 1 and q(0), eso lo guarda en aux y a la siguiente calcula aux and q(1), y así hasta terminar...
					end loop;
				end if;
				aux := aux and en; --toma todas la "operaciones and" que calculamos y le hace un and con ENABLE 
				q(i) <= q(i) xor aux; -- terminamos la formula obtenida añadiendole el término en la parte izq de la operacion xor
			end loop;
		end if;
	end process;
	
	--display <= q;
end architecture;
