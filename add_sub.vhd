library IEEE; use IEEE.STD_LOGIC_1164.all;
entity add_sub is
	port(a, b: in STD_ULOGIC_VECTOR(7 downto 0);
		 sub: in STD_ULOGIC;
		 result: out STD_ULOGIC_VECTOR(7 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity adder is
  port(a,b:  in STD_ULOGIC_VECTOR(7 downto 0);
       cin:  in STD_ULOGIC;
       cout: out STD_ULOGIC;
	   sum:  out STD_ULOGIC_VECTOR(7 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity FA is
  port(a,b,cin: in STD_ULOGIC;
       cout, s: out STD_ULOGIC);
end;


--TODO implement add_sub
--FA
architecture struct of FA is
  begin
    s <= (a XOR b) XOR cin;
    cout <= ((a XOR b) AND cin) OR (a AND b);
  end;

architecture struct of add_sub is
  component FA 
    port(a,b,cin: in STD_ULOGIC;
        cout, s: out STD_ULOGIC);
  end component; 
  signal c1, c2, c3, c4, c5, c6, c7: std_ulogic; --bit carries
  signal cout: std_ulogic; 
  signal subVar: STD_ULOGIC_VECTOR(7 downto 0); -- for sub xor b
  begin
    subVar <= sub xor b;
    FA0: FA port map(a(0), subVar(0), sub, c1, result(0));
    FA1: FA port map(a(1), subVar(1), c1, c2, result(1)); 
    FA2: FA port map(a(2), subVar(2), c2, c3, result(2));
    FA3: FA port map(a(3), subVar(3), c3, c4, result(3));
    FA4: FA port map(a(4), subVar(4), c4, c5, result(4));
    FA5: FA port map(a(5), subVar(5), c5, c6, result(5));
    FA6: FA port map(a(6), subVar(6), c6, c7, result(6));
    FA7: FA port map(a(7), subVar(7), c7, cout, result(7));
  end;
