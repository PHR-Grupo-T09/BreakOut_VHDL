library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EncenderLeds is
Port (  
        RESETLeds, RESET1Leds : inout std_logic;
        
        izquierdaBotInLeds, izquierdaBotOutLeds : inout std_logic;
        derechaBotInLeds, derechaBotOutLeds : inout std_logic;

        clk: in std_logic;

        Q_0_0, Q_0_1, Q_0_2, Q_0_3, Q_0_4, Q_0_5, Q_0_6, Q_0_7 : inout std_logic;
        Q_1_0, Q_1_1, Q_1_2, Q_1_3, Q_1_4, Q_1_5, Q_1_6, Q_1_7 : inout std_logic;
        Q_2_0, Q_2_1, Q_2_2, Q_2_3, Q_2_4, Q_2_5, Q_2_6, Q_2_7 : inout std_logic;
        Q_3_0, Q_3_1, Q_3_2, Q_3_3, Q_3_4, Q_3_5, Q_3_6, Q_3_7 : inout std_logic;
        Q_4_0, Q_4_1, Q_4_2, Q_4_3, Q_4_4, Q_4_5, Q_4_6, Q_4_7 : inout std_logic;
        Q_5_0, Q_5_1, Q_5_2, Q_5_3, Q_5_4, Q_5_5, Q_5_6, Q_5_7 : inout std_logic;
        Q_6_0, Q_6_1, Q_6_2, Q_6_3, Q_6_4, Q_6_5, Q_6_6, Q_6_7 : inout std_logic;
        Q_7_0, Q_7_1, Q_7_2, Q_7_3, Q_7_4, Q_7_5, Q_7_6, Q_7_7 : inout std_logic;


        J0,J1,J2,J3,J4,J5,J6,J7: out std_logic;
        J8,J9,J10,J11,J12,J13,J14,J15: out std_logic
    );
end EncenderLeds;


architecture Behavioral of EncenderLeds is
signal i: integer := 0;


component MatrizLED is
port (
    izquierdaBotIn, izquierdaBotOut : inout std_logic;
    derechaBotIn, derechaBotOut : inout std_logic;
    RESET, RESET1 : inout std_logic;
    clk : in std_logic;
    Q0_0, Q0_1, Q0_2, Q0_3, Q0_4, Q0_5, Q0_6, Q0_7 : inout std_logic;
    Q1_0, Q1_1, Q1_2, Q1_3, Q1_4, Q1_5, Q1_6, Q1_7 : inout std_logic;
    Q2_0, Q2_1, Q2_2, Q2_3, Q2_4, Q2_5, Q2_6, Q2_7 : inout std_logic;
    Q3_0, Q3_1, Q3_2, Q3_3, Q3_4, Q3_5, Q3_6, Q3_7 : inout std_logic;
    Q4_0, Q4_1, Q4_2, Q4_3, Q4_4, Q4_5, Q4_6, Q4_7 : inout std_logic;
    Q5_0, Q5_1, Q5_2, Q5_3, Q5_4, Q5_5, Q5_6, Q5_7 : inout std_logic;
    Q6_0, Q6_1, Q6_2, Q6_3, Q6_4, Q6_5, Q6_6, Q6_7 : inout std_logic;
    Q7_0, Q7_1, Q7_2, Q7_3, Q7_4, Q7_5, Q7_6, Q7_7 : inout std_logic
);
end component;

signal clkDiv : std_logic;
component DivisorFrecuenciaBarridoMatriz is
    port (
        clk100mhz: 	in STD_LOGIC;
        clkOut:		out STD_LOGIC
    );
end component;

signal L15, L14, L13, L12, L3, L2, L1, L0 : std_logic;
component lineasEncendidas is
    Port (
            Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : inout std_logic;
            algunoEncendido: out std_logic
        );
end component;

begin
    
    MatrizLED_inst: MatrizLED port map (izquierdaBotIn => izquierdaBotInLeds, izquierdaBotOut => izquierdaBotOutLeds, derechaBotIn => derechaBotInLeds, derechaBotOut => derechaBotOutLeds, RESET => RESETLeds, RESET1 => RESET1Leds, clk => clk,
                    Q0_0 => Q_0_0, Q0_1 => Q_0_1, Q0_2 => Q_0_2, Q0_3 => Q_0_3, Q0_4 => Q_0_4, Q0_5 => Q_0_5, Q0_6 => Q_0_6, Q0_7 => Q_0_7,
                    Q1_0 => Q_1_0, Q1_1 => Q_1_1, Q1_2 => Q_1_2, Q1_3 => Q_1_3, Q1_4 => Q_1_4, Q1_5 => Q_1_5, Q1_6 => Q_1_6, Q1_7 => Q_1_7,
                    Q2_0 => Q_2_0, Q2_1 => Q_2_1, Q2_2 => Q_2_2, Q2_3 => Q_2_3, Q2_4 => Q_2_4, Q2_5 => Q_2_5, Q2_6 => Q_2_6, Q2_7 => Q_2_7,
                    Q3_0 => Q_3_0, Q3_1 => Q_3_1, Q3_2 => Q_3_2, Q3_3 => Q_3_3, Q3_4 => Q_3_4, Q3_5 => Q_3_5, Q3_6 => Q_3_6, Q3_7 => Q_3_7,
                    Q4_0 => Q_4_0, Q4_1 => Q_4_1, Q4_2 => Q_4_2, Q4_3 => Q_4_3, Q4_4 => Q_4_4, Q4_5 => Q_4_5, Q4_6 => Q_4_6, Q4_7 => Q_4_7,
                    Q5_0 => Q_5_0, Q5_1 => Q_5_1, Q5_2 => Q_5_2, Q5_3 => Q_5_3, Q5_4 => Q_5_4, Q5_5 => Q_5_5, Q5_6 => Q_5_6, Q5_7 => Q_5_7,
                    Q6_0 => Q_6_0, Q6_1 => Q_6_1, Q6_2 => Q_6_2, Q6_3 => Q_6_3, Q6_4 => Q_6_4, Q6_5 => Q_6_5, Q6_6 => Q_6_6, Q6_7 => Q_6_7,
                    Q7_0 => Q_7_0, Q7_1 => Q_7_1, Q7_2 => Q_7_2, Q7_3 => Q_7_3, Q7_4 => Q_7_4, Q7_5 => Q_7_5, Q7_6 => Q_7_6, Q7_7 => Q_7_7 );

    div: DivisorFrecuenciaBarridoMatriz port map ( clk100mhz => clk , clkOut => clkDiv);

    L_15: lineasEncendidas port map (Q0 => Q_0_0, Q1 => Q_0_1, Q2 => Q_0_2, Q3 => Q_0_3, Q4 => Q_0_4, Q5 => Q_0_5, Q6 => Q_0_6, Q7 => Q_0_7, algunoEncendido => L15);
    --L14: lineasEncendidas port map (Q0 => Q1_0, Q1 => Q1_1, Q2 => Q1_2, Q3 => Q1_3, Q4 => Q1_4, Q5 => Q1_5, Q6 => Q1_6, Q7 => Q1_7, algunoEncendido => L14);
    --L13: lineasEncendidas port map (Q0 => Q2_0, Q1 => Q2_1, Q2 => Q2_2, Q3 => Q2_3, Q4 => Q2_4, Q5 => Q2_5, Q6 => Q2_6, Q7 => Q2_7, algunoEncendido => L13);
    --L12: lineasEncendidas port map (Q0 => Q3_0, Q1 => Q3_1, Q2 => Q3_2, Q3 => Q3_3, Q4 => Q3_4, Q5 => Q3_5, Q6 => Q3_6, Q7 => Q3_7, algunoEncendido => L12);
    --L3 : lineasEncendidas port map (Q0 => Q4_0, Q1 => Q4_1, Q2 => Q4_2, Q3 => Q4_3, Q4 => Q4_4, Q5 => Q4_5, Q6 => Q4_6, Q7 => Q4_7, algunoEncendido => L3);
    --L2 : lineasEncendidas port map (Q0 => Q5_0, Q1 => Q5_1, Q2 => Q5_2, Q3 => Q5_3, Q4 => Q5_4, Q5 => Q5_5, Q6 => Q5_6, Q7 => Q5_7, algunoEncendido => L2);
    --L1 : lineasEncendidas port map (Q0 => Q6_0, Q1 => Q6_1, Q2 => Q6_2, Q3 => Q6_3, Q4 => Q6_4, Q5 => Q6_5, Q6 => Q6_6, Q7 => Q6_7, algunoEncendido => L1);
    --L0 : lineasEncendidas port map (Q0 => Q7_0, Q1 => Q7_1, Q2 => Q7_2, Q3 => Q7_3, Q4 => Q7_4, Q5 => Q7_5, Q6 => Q7_6, Q7 => Q7_7, algunoEncendido => L0);
    
    process (clkDiv)
        begin            
            if rising_edge(clkDiv) then 
                case i is 
                    when 0 =>   J0<='1'; J1 <='1'; J2 <='1'; J3 <='1'; J12<='1'; J13 <='1'; J14 <='1'; 

                                if (L15 = '1') then
                                    J15 <='0';

                                    if (Q_0_0 = '1') then J4  <= '1'; else J4  <= '0'; end if;
                                    if (Q_0_1 = '1') then J5  <= '1'; else J5  <= '0'; end if;
                                    if (Q_0_2 = '1') then J6  <= '1'; else J6  <= '0'; end if;
                                    if (Q_0_3 = '1') then J7  <= '1'; else J7  <= '0'; end if;

                                    if (Q_0_4 = '1') then J8  <= '1'; else J8  <= '0'; end if;
                                    if (Q_0_5 = '1') then J9  <= '1'; else J9  <= '0'; end if;
                                    if (Q_0_6 = '1') then J10 <= '1'; else J10 <= '0'; end if;
                                    if (Q_0_7 = '1') then J11 <= '1'; else J11 <= '0'; end if;
                                
                                else
                                    J15 <='1';
                                end if;


                                
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
