library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lineasEncendidas is
Port (
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : inout std_logic;
        algunoEncendido: out std_logic
    );
end lineasEncendidas;


architecture Behavioral of lineasEncendidas is
begin
    proceso_lineasEncendidas: process(Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7)
    begin
        if ((Q0 = '1') or (Q1 = '1') or (Q2 = '1') or (Q3 = '1') or (Q4 = '1') or (Q5 = '1') or (Q6 = '1') or (Q7 = '1')) then
            algunoEncendido <= '1';
        else 
            algunoEncendido <= '0';
        end if;
    end process proceso_lineasEncendidas;
end Behavioral;
