library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;

entity sieteSegmentos is
port(
	I0: in std_logic_vector(2 downto 0);
	I1: in std_logic_vector(;
	I2: in std_logic;
	I3: in std_logic;
	a: out std_logic;
	b: out std_logic;
	c: out std_logic;
	d: out std_logic;
	e: out std_logic;
	f: out std_logic;
	g: out std_logic);
end sieteSegmentos;

architecture sieteSegmentosArq of sieteSegmentos is
	begin		
		a <= (not(I3) and not(I2) and not(I1) and I0) or (I2 and not(I1) and not(I0));
		b <= (I2 and not(I1) and I0) or (I2 and I1 and not(I0));
		c <= (not(I2) and I1 and not(I0));
		d <= (not(I3) and not(I2) and not(I1) and I0) or (I2 and not(I1) and not(I0)) or (I2 and I1 and I0);
		e <= (I2 and not(I1)) or I0;
		f <= (not(I3) and not(I2) and I0) or (not(I2) and I1) or (I1 and I0);
		g <= (not(I3) and not(I2) and not(I1)) or (I2 and I1 and I0);
	end sieteSegmentosArq;
