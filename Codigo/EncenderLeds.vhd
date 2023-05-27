library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EncenderLeds is
Port ( clk: in std_logic;
        J0,J1,J2,J3,J4,J5,J6,J7: out std_logic;
        J8,J9,J10,J11,J12,J13,J14,J15: out std_logic);
end EncenderLeds;


architecture Behavioral of EncenderLeds is
signal i: integer := 0;

signal clkDiv : std_logic;
component DivisorFrecuencia is
    port (
        clk100mhz: 	in STD_LOGIC;
        clkOut:		out STD_LOGIC
    );
end component;

begin

    div: DivisorFrecuencia port map ( clk100mhz => clk , clkOut => clkDiv);
    
    process (clkDiv)
        begin
            if rising_edge(clkDiv) then
                case i is 
                    when 0 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='1'; J7<='1';
                                J8 <='1'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='0';
                                
                    when 1 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='0'; J7<='0';
                                J8 <='0'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 2 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='0'; J7<='0';
                                J8 <='0'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 3 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='0'; J7<='0';
                                J8 <='0'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 4 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='0'; J7<='0';
                                J8 <='0'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 5 =>   J0<='1'; J1 <='1'; J2 <='0'; J3 <='1'; J4<='1'; J5 <='0'; J6 <='1'; J7<='0';
                                J8 <='1'; J9 <='0'; J10 <='1'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 6 =>   J0<='1'; J1 <='0'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='1'; J6 <='0'; J7<='1';
                                J8 <='0'; J9 <='1'; J10 <='0'; J11 <='1'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when 7 =>   J0<='0'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='1'; J5 <='0'; J6 <='1'; J7<='0';
                                J8 <='1'; J9 <='0'; J10 <='1'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                                
                    when others =>  J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J4<='0'; J5 <='0'; J6 <='0'; J7<='0';
                                    J8 <='0'; J9 <='0'; J10 <='0'; J11 <='0'; J12<='1'; J13 <='1'; J14 <='1'; J15 <='1';
                end case;                
                i <= (i+1) mod 8; 
            end if;       
        end process;

end Behavioral;
