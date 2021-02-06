library ieee;
use ieee.std_logic_1164.all;

ENTITY Registro IS PORT (
  dato : in std_logic_vector (5 downto 0);
  clk, clr, ini : in std_logic;
  A0: out std_logic_vector (5 downto 0);
  LB, EB, EC : out std_logic);
ATTRIBUTE pin_numbers OF Registro: ENTITY IS
"clr:2 dato(5):3 dato(4):4 dato(3):5 dato(2):6 dato(1):7 dato(0):8 ini:9 "&
"lb:22 eb:21 ec:20 a0(5):14 A0(4):15 A0(3):16 A0(2):17 A0(1):18 A0(0):19 ";
END Registro;

ARCHITECTURE aRegistro OF Registro IS
SIGNAL LA, EA, z: std_logic;
TYPE estados is (e0, e1, e2);
SIGNAL edo_act, edo_sig : estados;
BEGIN
PROCESS (clk, clr)
BEGIN
      IF (clr = '1') THEN
        edo_act <= e0;
      ELSIF (rising_edge(clk)) THEN
        edo_act <= edo_sig;
      END IF;
END PROCESS;

PROCESS (edo_act, z, A0 , ini)
BEGIN
      LA <= '0'; --Inicializando
      LB <= '0';
      EA <= '0';
      EB <= '0';
      EC <= '0';
      z <= A0(5) OR A0(4) OR A0(3) OR A0(2) OR A0(1) OR A0(0);
CASE edo_act IS
              WHEN e0 =>
              LB <= '1';
              IF(ini = '1') THEN
                edo_sig <= e1;
              ELSE
                LA <= '1';
                edo_sig <= e0;
              END IF;
              WHEN e1 =>
                EA <= '1';
                IF(z='1' AND A0(0)='1') THEN
                  EB <= '1';
                  edo_sig <= e1;
                ELSIF(z='1' AND A0(0)='0') THEN
                  edo_sig <= e1;
                ELSE
                  edo_sig <= e2;
              END IF;
              WHEN OTHERS =>
              EC <= '1';
              IF(ini = '1') THEN
                edo_sig <= e2;
              ELSE
                edo_sig <= e0;
              END IF;
              END CASE;
END PROCESS;
PROCESS (clk, clr)
BEGIN
  IF (clr = '1') THEN
    A0 <= "000000";
  ELSIF (rising_edge(clk)) THEN
    IF (EA = '0' AND LA = '1') THEN
      A0 <= dato;
    ELSIF (EA = '1' AND LA = '0') THEN
      A0(4 downto 0) <= A0(5 downto 1);
      A0(5) <= '0';
    END IF;
  END IF;
END PROCESS;
END aRegistro;