library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity prac11 is port(
	LB, EB :in std_logic;
	clk, clr: in std_logic;
    disp: out std_logic_vector(6 downto 0);
	EC: inout std_logic
);
end prac11;

architecture aprac11 of prac11 is
	--signal conv: std_logic_vector(6 downto 0);
	signal B: std_logic_vector(2 downto 0);
begin

	process(clk, clr)
	begin
		if(clr = '1') then
			B<="000";
		
		elsif(rising_edge(clk)) then
			if(LB = '1')then
				B<="000";	
			elsif(EB = '1') then
				B<=B+1;
			elsif(LB = '0' and EB = '0') then
				B <= B;
			end if;
		end if;
 	end process;


	process(EC, B)
	begin
		if(EC = '0') then
			disp <= "0000001";
		else
			case B is
				when "000" =>disp<="1111110";
				when "001" =>disp<="0110000";
				when "010" =>disp<="1101101";
				when "011" =>disp<="1111001";
				when "100" =>disp<="0110011";
				when "101" =>disp<="1011011";
				when "110" =>disp<="1011111";
				when others =>disp<="0000001";
		end case;
		end if;
    end process;
end architecture;
