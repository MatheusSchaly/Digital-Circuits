library IEEE;
use IEEE.Std_Logic_1164.all;

entity topo is
	port (SW0: in std_logic;
			SW1: in std_logic;
			SW2: in std_logic;
			SW7: in std_logic;
			SW89: in std_logic_vector(9 downto 8);
			LEDR: out std_logic
			);
end topo;

architecture topo_estru of topo is

	signal F1, F2, F3: std_logic;
	
	component C1
		port(A: in std_logic;
			  B: in std_logic;
			  C: in std_logic;
			  F: out std_logic
			  );
	end component;
	
	component C2
		port(A: in std_logic;
			  B: in std_logic;
			  F: out std_logic
			  );
	end component;
	
	component C3
		port(A: in std_logic;
			  B: in std_logic;
			  C: in std_logic;
			  F: out std_logic
			  );
	end component;
	
	component C4
		port (w: in std_logic;
				x: in std_logic;
				y: in std_logic;
				z: in std_logic;
				s: in std_logic_vector(1 downto 0);
				F: out std_logic
				);
	end component;
	
begin
	L0: C1 port map(SW0, SW1, SW2, F1);
	L1: C2 port map(SW1, SW2, F2);
	L2: C3 port map(SW0, SW1, SW2, F3);
	L3: C4 port map(F1, F2, F3, SW7, SW89(9 downto 8), LEDR);
end topo_estru;