library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity DivisorFrecuencia is
port (
	clk100mhz: 	in STD_LOGIC;
	clkOut:		out STD_LOGIC
);
end DivisorFrecuencia;

architecture rtl of DivisorFrecuencia is
	constant max_count: INTEGER := 100000000;
	signal count: INTEGER range 0 to max_count;
	signal clk_state: STD_LOGIC := '0';
	
begin
	gen_clock: process(clk100mhz, clk_state, count)
	begin
		if clk100mhz'event and clk100mhz='1' then
			if count < max_count then 
				count <= count+1;
			else
				clk_state <= not clk_state;
				count <= 0;
			end if;
		end if;
	end process;
	
	persecond: process (clk_state)
	begin
		clkOut <= clk_state;
	end process;
	
end rtl;
