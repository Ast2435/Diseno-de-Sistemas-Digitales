library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity prac is port
(
	sen: in std_logic_vector(1 downto 0);
	clr,clk: in std_logic;
	uni: inout std_logic_vector(3 downto 0);
	dec: inout std_logic_vector(2 downto 0)
);
end entity;
architecture p10 of prac is
type estados is (q0,q1,q2,q3,q4,q5,q6,q7);
signal act, sig: estados;
signal sal: std_logic_vector(1 downto 0);
begin
	process(clk,clr)
	begin
		if(clr='1')then
			act<=q0;
		elsif(rising_edge(clk))then
			act<=sig;
		end if;
	end process;
	process(act,sen)
	begin
		case act is
			when q0=>
				if(sen="00")then
					sal<="00";
					sig<=q0;
				elsif(sen="10")then
					sal<="00";
					sig<=q1;
				elsif(sen="11")then
					sal<="00";
					sig<=q7;
				else
					sal<="00";
					sig<=q4;
				end if;
			when q1=>
				case sen is
					when"10"=>
						sal<="00";
						sig<=q1;
					when"11"=>
						sal<="00";
						sig<=q2;
					when"01"=>
						sal<="00";
						sig<=q4;
					when others=>
						sal<="00";
						sig<=q0;
				end case;
			when q2=>
				case sen is
					when"11"=>
						sal<="00";
						sig<=q2;
					when"01"=>
						sal<="00";
						sig<=q3;
					when"10"=>
						sal<="00";
						sig<=q1;
					when others=>
						sal<="00";
						sig<=q0;
				end case;
			when q3=>
				case sen is
					when"10"=>
						sal<="01";
						sig<=q1;
					when"01"=>
						sal<="00";
						sig<=q3;
					when"11"=>
						sal<="00";
						sig<=q2;
					when others=>
						sal<="01";
						sig<=q0;
				end case;
			when q4=>
				case sen is
					when"10"=>
						sal<="00";
						sig<=q1;
					when"11"=>
						sal<="00";
						sig<=q5;
					when"01"=>
						sal<="00";
						sig<=q4;
					when others=>
						sal<="00";
						sig<=q0;
				end case;
			when q5=>
				case sen is
					when"10"=>
						sal<="00";
						sig<=q6;
					when"11"=>
						sal<="00";
						sig<=q5;
					when"01"=>
						sal<="00";
						sig<=q4;
					when others=>
						sal<="00";
						sig<=q0;
				end case;
			when q6=>
				case sen is
					when"10"=>
						sal<="00";
						sig<=q6;
					when"01"=>
						sal<="10";
						sig<=q4;
					when"11"=>
						sal<="00";
						sig<=q5;
					when others=>
						sal<="10";
						sig<=q0;
				end case;
			when q7=>
				case sen is
					when"10"=>
						sal<="00";
						sig<=q1;
					when"11"=>
						sal<="00";
						sig<=q7;
					when"01"=>
						sal<="00";
						sig<=q4;
					when others=>
						sal<="00";
						sig<=q0;
				end case;
			when others=>
				sal<="00";
				sig<=q0;
		end case;
	end process;
process(clk,clr)
	begin
		if(clr='1')then
			uni<="0000";
			dec<="000";
		elsif(rising_edge(clk))then
			if(sal="00")then
				uni<=uni;
				dec<=dec;
			elsif(sal="01")then
				if(uni="1001")then
					uni<="0000";
					dec<=dec+1;
				else
					uni<=uni+1;
				end if;
			elsif(sal="10")then
				if(uni="0000")then
					uni<="1001";
					dec<=dec-1;
				else
					uni<=uni-1;
				end if;
			end if;
		end if;
	end process;
end architecture;
