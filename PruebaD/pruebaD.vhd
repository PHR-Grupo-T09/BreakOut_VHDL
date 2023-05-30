library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pruebaD is
  port(
      clk : in std_logic;
      sw0 : inout std_logic;
      sw01 : inout std_logic;
      Q_Out : inout std_logic);
end pruebaD;

architecture Behavioral of pruebaD is

  signal QN0_0 : std_logic;
  component biestableD is
    port (
        D, clk : in std_logic;
        Q : inout std_logic;
        QN : out std_logic
    );
  end component;

  signal clkDiv : std_logic;
  component DivisorFrecuenciaLENTO is
      port (
          clk100mhz: 	in STD_LOGIC;
          clkOut:		out STD_LOGIC
      );
  end component;
      
  begin   
    
  div: DivisorFrecuenciaLENTO port map ( clk100mhz => clk , clkOut => clkDiv);

  d00: biestableD port map(D => sw01, clk => clkDiv, Q => Q_Out, QN => QN0_0);
    
    
end Behavioral;
