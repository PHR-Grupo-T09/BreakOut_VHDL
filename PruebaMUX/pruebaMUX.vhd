library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pruebaMUX is
  port(sw0,sw1,sw2: inout std_logic;
      sw01,sw11,sw21 :inout std_logic;
      muxout0_0 : inout std_logic);
end pruebaMUX;

architecture Behavioral of pruebaMUX is

  component MUX_Generico is
      generic(N : positive := 2);
      port(i_i    : in std_logic_vector(2**N-1 downto 0);
      sel_i       : in std_logic_vector (N-1 downto 0);
      ena_i       : in std_logic;
      y_o         : out std_logic
      );
  end component;
  signal mux_in0 : std_logic_vector(7 downto 0);
      signal mux_sel: std_logic_vector(2 downto 0);
      signal enable : std_logic;
      
  begin   
    enable <= '1';
    sw01 <= sw0;
    sw11 <=sw1;
    sw21 <= sw2;

    mux_sel(0) <= sw0;
    mux_sel(1) <= sw1;
    mux_sel(2) <= sw2;

    mux_in0(0) <= '0';
    mux_in0(1) <= '1';
    mux_in0(2) <= '0';
    mux_in0(3) <= '1';
    mux_in0(4) <= '0';
    mux_in0(5) <= '1';
    mux_in0(6) <= '0';
    mux_in0(7) <= '1';
          
    Mux0_0: MUX_Generico generic map(N => 3)
    port map(i_i => mux_in0, sel_i => mux_sel, ena_i => enable, y_o => muxout0_0);
end Behavioral;
