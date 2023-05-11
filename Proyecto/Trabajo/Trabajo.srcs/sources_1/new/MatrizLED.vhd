library IEEE;
use IEEE.std_logic_1164.all;


entity MatrizLED is
port (
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
end entity;

architecture behav of MatrizLED is

    signal D0_0, D0_1, D0_2, D0_3, D0_4, D0_5, D0_6, D0_7 : std_logic;
    signal D1_0, D1_1, D1_2, D1_3, D1_4, D1_5, D1_6, D1_7 : std_logic;
    signal D2_0, D2_1, D2_2, D2_3, D2_4, D2_5, D2_6, D2_7 : std_logic;
    signal D3_0, D3_1, D3_2, D3_3, D3_4, D3_5, D3_6, D3_7 : std_logic;
    signal D4_0, D4_1, D4_2, D4_3, D4_4, D4_5, D4_6, D4_7 : std_logic;
    signal D5_0, D5_1, D5_2, D5_3, D5_4, D5_5, D5_6, D5_7 : std_logic;
    signal D6_0, D6_1, D6_2, D6_3, D6_4, D6_5, D6_6, D6_7 : std_logic;
    signal D7_0, D7_1, D7_2, D7_3, D7_4, D7_5, D7_6, D7_7 : std_logic;

    signal QN0_0, QN0_1, QN0_2, QN0_3, QN0_4, QN0_5, QN0_6, QN0_7 : std_logic;
    signal QN1_0, QN1_1, QN1_2, QN1_3, QN1_4, QN1_5, QN1_6, QN1_7 : std_logic;
    signal QN2_0, QN2_1, QN2_2, QN2_3, QN2_4, QN2_5, QN2_6, QN2_7 : std_logic;
    signal QN3_0, QN3_1, QN3_2, QN3_3, QN3_4, QN3_5, QN3_6, QN3_7 : std_logic;
    signal QN4_0, QN4_1, QN4_2, QN4_3, QN4_4, QN4_5, QN4_6, QN4_7 : std_logic;
    signal QN5_0, QN5_1, QN5_2, QN5_3, QN5_4, QN5_5, QN5_6, QN5_7 : std_logic;
    signal QN6_0, QN6_1, QN6_2, QN6_3, QN6_4, QN6_5, QN6_6, QN6_7 : std_logic;
    signal QN7_0, QN7_1, QN7_2, QN7_3, QN7_4, QN7_5, QN7_6, QN7_7 : std_logic;


    component biestableD is
        port (
            D, clk : in std_logic;
            Q : inout std_logic;
            QN : out std_logic
        );
    end component;

            
    signal mux_in0, mux_in1, mux_in2, mux_in3, mux_in4, mux_in5, mux_in6, mux_in7 : std_logic_vector(7 downto 0);
    signal mux_sel: std_logic_vector(2 downto 0);
    signal enable, muxout0, muxout1,  muxout2, muxout3, muxout4, muxout5, muxout6, muxout7  : std_logic;

    component MUX_Generico is 
        generic(N : positive := 2);
        port(
            i_i    : in std_logic_vector(2**N-1 downto 0);
            sel_i       : in std_logic_vector (N-1 downto 0);
            ena_i       : in std_logic;
            y_o         : out std_logic
        );
    end component;


    begin
    
          mux_sel <= "010";
        -- Enable general a todos los MUX

        enable <= '1';

        -- Especificas
        -- mux_in(1) <= ''; -- 001 Mover derecha PONER LA SALIDA DEL MUX DE LA IZQUIERDA
        -- mux_in(2) <= ''; -- 010 Disposicion inicial de la matriz de led
        -- mux_in(4) <= ''; -- 100 Mover izquierda PONER LA SALIDA DEL MUX DE LA DERECHA


        -- Mux 0

        mux_in0(0) <= muxout0; -- Entrada anulada para cuando no haces nada 0 0 0 (se quede como estÃ¡)
        mux_in0(3) <= muxout0; -- 011 NO Se Usa
        mux_in0(5) <= muxout0; -- 101 NO Se Usa
        mux_in0(6) <= muxout0; -- 110 NO Se Usa
        mux_in0(7) <= muxout0; -- Entrada anulada 1 1 1 (se quede como estÃ¡)

        mux_in0(1) <= '0';    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in0(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in0(4) <= muxout1;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux0: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0, sel_i => mux_sel, ena_i => enable, y_o => muxout0);

        -- Mux 1

        mux_in1(0) <= muxout1;
        mux_in1(3) <= muxout1;
        mux_in1(5) <= muxout1;
        mux_in1(6) <= muxout1;
        mux_in1(7) <= muxout1;

        mux_in1(1) <= muxout0;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in1(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in1(4) <= muxout2;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux1: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1, sel_i => mux_sel, ena_i => enable, y_o => muxout1);

        -- Mux 2

        mux_in2(0) <= muxout2;
        mux_in2(3) <= muxout2;
        mux_in2(5) <= muxout2;
        mux_in2(6) <= muxout2;
        mux_in2(7) <= muxout2;

        mux_in2(1) <= muxout1;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in2(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in2(4) <= muxout3;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux2: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in2, sel_i => mux_sel, ena_i => enable, y_o => muxout2);
        -- Mux 3
            
        mux_in3(0) <= muxout3;
        mux_in3(3) <= muxout3;
        mux_in3(5) <= muxout3;
        mux_in3(6) <= muxout3;
        mux_in3(7) <= muxout3;

        mux_in3(1) <= muxout2;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in3(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in3(4) <= muxout4;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux3: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in3, sel_i => mux_sel, ena_i => enable, y_o => muxout3);

        -- Mux 4

        mux_in4(0) <= muxout4;
        mux_in4(3) <= muxout4;
        mux_in4(5) <= muxout4;
        mux_in4(6) <= muxout4;
        mux_in4(7) <= muxout4;

        mux_in4(1) <= muxout3;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in4(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in4(4) <= muxout5;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux4: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in4, sel_i => mux_sel, ena_i => enable, y_o => muxout4);

        -- Mux 5

        mux_in5(0) <= muxout5;
        mux_in5(3) <= muxout5;
        mux_in5(5) <= muxout5;
        mux_in5(6) <= muxout5;
        mux_in5(7) <= muxout5;

        mux_in5(1) <= muxout4;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in5(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in5(4) <= muxout6;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux5: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in5, sel_i => mux_sel, ena_i => enable, y_o => muxout5);

        -- Mux 6

        mux_in6(0) <= muxout6;
        mux_in6(3) <= muxout6;
        mux_in6(5) <= muxout6;
        mux_in6(6) <= muxout6;
        mux_in6(7) <= muxout6;

        mux_in6(1) <= muxout5;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in6(2) <= '0';        -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in6(4) <= muxout7;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux6: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in6, sel_i => mux_sel, ena_i => enable, y_o => muxout6);

        -- Mux 7

        mux_in7(0) <= muxout7;
        mux_in7(3) <= muxout7;
        mux_in7(5) <= muxout7;
        mux_in7(6) <= muxout7;
        mux_in7(7) <= muxout7;

        mux_in7(1) <= muxout6;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in7(2) <= '0';        -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in7(4) <= muxout0;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux7: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in7, sel_i => mux_sel, ena_i => enable, y_o => muxout7);

        -- ConexiÃ³n de las seÃ±ales D a las entradas de los biestables D
        d00: biestableD port map(D => D0_0, clk => clk, Q => Q0_0, QN => QN0_0);
        d01: biestableD port map(D => D0_1, clk => clk, Q => Q0_1, QN => QN0_1);
        d02: biestableD port map(D => D0_2, clk => clk, Q => Q0_2, QN => QN0_2);
        d03: biestableD port map(D => D0_3, clk => clk, Q => Q0_3, QN => QN0_3);
        d04: biestableD port map(D => D0_4, clk => clk, Q => Q0_4, QN => QN0_4);
        d05: biestableD port map(D => D0_5, clk => clk, Q => Q0_5, QN => QN0_5);
        d06: biestableD port map(D => D0_6, clk => clk, Q => Q0_6, QN => QN0_6);
        d07: biestableD port map(D => D0_7, clk => clk, Q => Q0_7, QN => QN0_7);
        
--        d10: biestableD port map(D => D1_0, clk => clk, Q => Q1_0, QN => QN1_0);
--        d11: biestableD port map(D => D1_1, clk => clk, Q => Q1_1, QN => QN1_1);
--        d12: biestableD port map(D => D1_2, clk => clk, Q => Q1_2, QN => QN1_2);
--        d13: biestableD port map(D => D1_3, clk => clk, Q => Q1_3, QN => QN1_3);
--        d14: biestableD port map(D => D1_4, clk => clk, Q => Q1_4, QN => QN1_4);
--        d15: biestableD port map(D => D1_5, clk => clk, Q => Q1_5, QN => QN1_5);
--        d16: biestableD port map(D => D1_6, clk => clk, Q => Q1_6, QN => QN1_6);
--        d17: biestableD port map(D => D1_7, clk => clk, Q => Q1_7, QN => QN1_7);
        
--        d20: biestableD port map(D => D2_0, clk => clk, Q => Q2_0, QN => QN2_0);
--        d21: biestableD port map(D => D2_1, clk => clk, Q => Q2_1, QN => QN2_1);
--        d22: biestableD port map(D => D2_2, clk => clk, Q => Q2_2, QN => QN2_2);
--        d23: biestableD port map(D => D2_3, clk => clk, Q => Q2_3, QN => QN2_3);
--        d24: biestableD port map(D => D2_4, clk => clk, Q => Q2_4, QN => QN2_4);
--        d25: biestableD port map(D => D2_5, clk => clk, Q => Q2_5, QN => QN2_5);
--        d26: biestableD port map(D => D2_6, clk => clk, Q => Q2_6, QN => QN2_6);
--        d27: biestableD port map(D => D2_7, clk => clk, Q => Q2_7, QN => QN2_7);
        
--        d30: biestableD port map(D => D3_0, clk => clk, Q => Q3_0, QN => QN3_0);
--        d31: biestableD port map(D => D3_1, clk => clk, Q => Q3_1, QN => QN3_1);
--        d32: biestableD port map(D => D3_2, clk => clk, Q => Q3_2, QN => QN3_2);
--        d33: biestableD port map(D => D3_3, clk => clk, Q => Q3_3, QN => QN3_3);
--        d34: biestableD port map(D => D3_4, clk => clk, Q => Q3_4, QN => QN3_4);
--        d35: biestableD port map(D => D3_5, clk => clk, Q => Q3_5, QN => QN3_5);
--        d36: biestableD port map(D => D3_6, clk => clk, Q => Q3_6, QN => QN3_6);
--        d37: biestableD port map(D => D3_7, clk => clk, Q => Q3_7, QN => QN3_7);
        
--        d40: biestableD port map(D => D4_0, clk => clk, Q => Q4_0, QN => QN4_0);
--        d41: biestableD port map(D => D4_1, clk => clk, Q => Q4_1, QN => QN4_1);
--        d42: biestableD port map(D => D4_2, clk => clk, Q => Q4_2, QN => QN4_2);
--        d43: biestableD port map(D => D4_3, clk => clk, Q => Q4_3, QN => QN4_3);
--        d44: biestableD port map(D => D4_4, clk => clk, Q => Q4_4, QN => QN4_4);
--        d45: biestableD port map(D => D4_5, clk => clk, Q => Q4_5, QN => QN4_5);
--        d46: biestableD port map(D => D4_6, clk => clk, Q => Q4_6, QN => QN4_6);
--        d47: biestableD port map(D => D4_7, clk => clk, Q => Q4_7, QN => QN4_7);
        
--        d50: biestableD port map(D => D5_0, clk => clk, Q => Q5_0, QN => QN5_0);
--        d51: biestableD port map(D => D5_1, clk => clk, Q => Q5_1, QN => QN5_1);
--        d52: biestableD port map(D => D5_2, clk => clk, Q => Q5_2, QN => QN5_2);
--        d53: biestableD port map(D => D5_3, clk => clk, Q => Q5_3, QN => QN5_3);
--        d54: biestableD port map(D => D5_4, clk => clk, Q => Q5_4, QN => QN5_4);
--        d55: biestableD port map(D => D5_5, clk => clk, Q => Q5_5, QN => QN5_5);
--        d56: biestableD port map(D => D5_6, clk => clk, Q => Q5_6, QN => QN5_6);
--        d57: biestableD port map(D => D5_7, clk => clk, Q => Q5_7, QN => QN5_7);
        
--        d60: biestableD port map(D => D6_0, clk => clk, Q => Q6_0, QN => QN6_0);
--        d61: biestableD port map(D => D6_1, clk => clk, Q => Q6_1, QN => QN6_1);
--        d62: biestableD port map(D => D6_2, clk => clk, Q => Q6_2, QN => QN6_2);
--        d63: biestableD port map(D => D6_3, clk => clk, Q => Q6_3, QN => QN6_3);
--        d64: biestableD port map(D => D6_4, clk => clk, Q => Q6_4, QN => QN6_4);
--        d65: biestableD port map(D => D6_5, clk => clk, Q => Q6_5, QN => QN6_5);
--        d66: biestableD port map(D => D6_6, clk => clk, Q => Q6_6, QN => QN6_6);
--        d67: biestableD port map(D => D6_7, clk => clk, Q => Q6_7, QN => QN6_7);
        
--        d70: biestableD port map(D => D7_0, clk => clk, Q => Q7_0, QN => QN7_0);
--        d71: biestableD port map(D => D7_1, clk => clk, Q => Q7_1, QN => QN7_1);
--        d72: biestableD port map(D => D7_2, clk => clk, Q => Q7_2, QN => QN7_2);
--        d73: biestableD port map(D => D7_3, clk => clk, Q => Q7_3, QN => QN7_3);
--        d74: biestableD port map(D => D7_4, clk => clk, Q => Q7_4, QN => QN7_4);
--        d75: biestableD port map(D => D7_5, clk => clk, Q => Q7_5, QN => QN7_5);
--        d76: biestableD port map(D => D7_6, clk => clk, Q => Q7_6, QN => QN7_6);
--        d77: biestableD port map(D => D7_7, clk => clk, Q => Q7_7, QN => QN7_7);


end behav;
