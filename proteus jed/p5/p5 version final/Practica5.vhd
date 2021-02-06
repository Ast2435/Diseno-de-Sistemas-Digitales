library ieee;
use ieee.std_logic_1164.all;

entity Mensaje is port(
	clk, clr : in std_logic;
	display : out std_logic_vector(6 downto 0);
	sel : inout std_logic_vector(2 downto 0)
	);
end Mensaje;

architecture aMensaje of Mensaje is
signal q0, q1, d0, d1 : std_logic;
CONSTANT L1 : std_logic_vector(6 downto 0) := "1000010"; --d
CONSTANT L2 : std_logic_vector(6 downto 0) := "1001111"; --i
CONSTANT L3 : std_logic_vector(6 downto 0) := "0000001"; --O

begin

--decodificador
	process(sel)
		begin
			case sel is
			when "001" =>
				display <= L1;
			when "010" =>
				display <= L2;
			when "100" =>
				display <= L3;
			when others => display <= "0000000";
			end case;
	end process;
--anillo
	process(clk, clr)
		begin
			if(clr = '1') then
				sel <= "001";
			elsif(rising_edge(clk)) then
				sel <= to_stdlogicvector(to_bitvector(sel) rol 1);
			end if;
	end process;

 -- flip flops
 	process(clk, clr)
		begin
			if(clr = '1') then
				q0 <= '0';
				q1 <= '0';
 		    elsif(rising_edge(clk)) then
				d1 <= q0;
				d0 <= (q1 and not(q0)) or (not(q1) and q0);
			 end if;
	 end process;

end architecture;
