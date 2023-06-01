library IEEE;
use IEEE.std_logic_1164.all;

entity biestableD is
	 port (D, clk : in std_logic; Q : inout std_logic; QN : out std_logic);
     --port (D, clk : in std_logic; Q, QN : out std_logic);
end biestableD;

architecture behav of biestableD is

	--SIGNAL i1 : std_logic;

begin

process(clk)
begin
    if rising_edge(clk) then
        if D = '0' then
            Q <= '0';
        elsif D = '1' then
            Q <= '1';
        end if;
    end if;

    QN <= not Q;
end process;

    
    -- i1 <= '0' WHEN D = '0' and clk'event and clk = '1' else
          -- '1' WHEN D = '1' and clk'event and clk = '1';
    -- Q <= i1;
    -- QN <= not i1;


end behav;
