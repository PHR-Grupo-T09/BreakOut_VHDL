library IEEE;
use IEEE.std_logic_1164.all;


entity MatrizLED is
port (
    izquierda, izquierdaOut : inout std_logic;
    derecha, derechaOut : inout std_logic;
    RESET, RESETOUT : inout std_logic;
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

    -- Biestable D --------------------------------------------------------------------

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

    -- MUX -----------------------------------------------------------------------------

    signal enable : std_logic;

    signal mux_in0_0, mux_in0_1, mux_in0_2, mux_in0_3, mux_in0_4, mux_in0_5, mux_in0_6, mux_in0_7 : std_logic_vector(7 downto 0);
    signal mux_in1_0, mux_in1_1, mux_in1_2, mux_in1_3, mux_in1_4, mux_in1_5, mux_in1_6, mux_in1_7 : std_logic_vector(7 downto 0);

    signal mux_sel0: std_logic_vector(2 downto 0);
    
    signal muxout0_0, muxout0_1, muxout0_3,  muxout0_2, muxout0_4, muxout0_5, muxout0_6, muxout0_7  : std_logic;
    signal muxout1_0, muxout1_1, muxout1_3,  muxout1_2, muxout1_4, muxout1_5, muxout1_6, muxout1_7  : std_logic;

    component MUX_Generico is 
        generic(N : positive := 2);
        port(
            i_i    : in std_logic_vector(2**N-1 downto 0);
            sel_i       : in std_logic_vector (N-1 downto 0);
            ena_i       : in std_logic;
            y_o         : out std_logic
        );
    end component;
    
    
    signal clkDiv : std_logic;
    component DivisorFrecuencia is
        port (
            clk100mhz: 	in STD_LOGIC;
            clkOut:		out STD_LOGIC
        );
    end component;


    begin

        -- Enable general a todos los MUX
        enable <= '1';
    
        -- Entradas de seleccion para los mux de las filas con movimiento derecha e izquierda.
        RESETOUT <= RESET;
        derechaOut <= derecha;
        izquierdaOut <= izquierda;

        -- DIVISOR FRECUENCIA -----------------------------------------------------------
        
        div: DivisorFrecuencia port map ( clk100mhz => clk , clkOut => clkDiv);


---------- FILA 0 --------------------------------------------------------------------------

        -- MUX 0

        Mux0_0: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_0, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_0);
        Mux0_1: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_1, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_1);
        Mux0_2: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_2, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_2);
        Mux0_3: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_3, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_3);
        Mux0_4: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_4, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_4);
        Mux0_5: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_5, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_5);        
        Mux0_6: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_6, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_6);
        Mux0_7: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in0_7, sel_i => mux_sel0, ena_i => enable, y_o => muxout0_7);
        
        -- Bies D 0

        d00: biestableD port map(D => muxout0_0, clk => clkDiv, Q => Q0_0, QN => QN0_0);
        d01: biestableD port map(D => muxout0_1, clk => clkDiv, Q => Q0_1, QN => QN0_1);
        d02: biestableD port map(D => muxout0_2, clk => clkDiv, Q => Q0_2, QN => QN0_2);
        d03: biestableD port map(D => muxout0_3, clk => clkDiv, Q => Q0_3, QN => QN0_3);
        d04: biestableD port map(D => muxout0_4, clk => clkDiv, Q => Q0_4, QN => QN0_4);
        d05: biestableD port map(D => muxout0_5, clk => clkDiv, Q => Q0_5, QN => QN0_5);
        d06: biestableD port map(D => muxout0_6, clk => clkDiv, Q => Q0_6, QN => QN0_6);
        d07: biestableD port map(D => muxout0_7, clk => clkDiv, Q => Q0_7, QN => QN0_7);

        
        mux_sel0(0) <= RESET;
        mux_sel0(1) <= derecha;
        mux_sel0(2) <= izquierda;

        -- Mux 0_0
        mux_in0_0(0) <= Q0_0;   --000
        mux_in0_0(3) <= '0';    --011
        mux_in0_0(5) <= '0';    --101
        mux_in0_0(6) <= Q0_0;   --110
        mux_in0_0(7) <= '0';    --111

        mux_in0_0(1) <= '0';    -- 00 1
        mux_in0_0(2) <= '0';    -- 01 0 
        mux_in0_0(4) <= Q0_1;   -- 10 0

        -- Mux 0_1
        mux_in0_1(0) <= Q0_1;
        mux_in0_1(3) <= '0';
        mux_in0_1(5) <= '0';
        mux_in0_1(6) <= Q0_1;
        mux_in0_1(7) <= '0';

        mux_in0_1(1) <= '0';   -- 00 1 RESET
        mux_in0_1(2) <= Q0_0;  -- 01 0 DERECHA
        mux_in0_1(4) <= Q0_2;  -- 10 0 IZQUIERDA

        -- Mux 0_2
        mux_in0_2(0) <= Q0_2;
        mux_in0_2(3) <= '0';
        mux_in0_2(5) <= '0';
        mux_in0_2(6) <= Q0_2;
        mux_in0_2(7) <= '0';

        mux_in0_2(1) <= '0';   -- 00 1 RESET
        mux_in0_2(2) <= Q0_1;  -- 01 0 DERECHA
        mux_in0_2(4) <= Q0_3;  -- 10 0 IZQUIERDA

        -- Mux 0_3
        mux_in0_3(0) <= Q0_3;
        mux_in0_3(3) <= '1';
        mux_in0_3(5) <= '1';
        mux_in0_3(6) <= Q0_3;
        mux_in0_3(7) <= '1';

        mux_in0_3(1) <= '1';   -- 00 1 RESET
        mux_in0_3(2) <= Q0_2;  -- 01 0 DERECHA
        mux_in0_3(4) <= Q0_4;  -- 10 0 IZQUIERDA

        -- Mux 0_4
        mux_in0_4(0) <= Q0_4;
        mux_in0_4(3) <= '1';
        mux_in0_4(5) <= '1';
        mux_in0_4(6) <= Q0_4;
        mux_in0_4(7) <= '1';

        mux_in0_4(1) <= '1';   -- 00 1 RESET
        mux_in0_4(2) <= Q0_3;  -- 01 0 DERECHA
        mux_in0_4(4) <= Q0_5;  -- 10 0 IZQUIERDA

        -- Mux 0_5
        mux_in0_5(0) <= Q0_5;
        mux_in0_5(3) <= '1';
        mux_in0_5(5) <= '1';
        mux_in0_5(6) <= Q0_5;
        mux_in0_5(7) <= '1';

        mux_in0_5(1) <= '1';   -- 00 1 RESET
        mux_in0_5(2) <= Q0_4;  -- 01 0 DERECHA
        mux_in0_5(4) <= Q0_6;  -- 10 0 IZQUIERDA

        -- Mux 0_6
        mux_in0_6(0) <= Q0_6;
        mux_in0_6(3) <= '0';
        mux_in0_6(5) <= '0';
        mux_in0_6(6) <= Q0_6;
        mux_in0_6(7) <= '0';

        mux_in0_6(1) <= '0';   -- 00 1 RESET
        mux_in0_6(2) <= Q0_5;  -- 01 0 DERECHA
        mux_in0_6(4) <= Q0_7;  -- 10 0 IZQUIERDA

        -- Mux 0_7
        mux_in0_7(0) <= Q0_7;
        mux_in0_7(3) <= '0';
        mux_in0_7(5) <= '0';
        mux_in0_7(6) <= Q0_7;
        mux_in0_7(7) <= '0';

        mux_in0_7(1) <= '0';   -- 00 1 RESET
        mux_in0_7(2) <= Q0_6;  -- 01 0 DERECHA
        mux_in0_7(4) <= '0';   -- 10 0 IZQUIERDA


---------- FILA 1 --------------------------------------------------------------------------

        -- MUX 1

        Mux1_0: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_0, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_0);
        Mux1_1: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_1, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_1);
        Mux1_2: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_2, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_2);
        Mux1_3: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_3, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_3);
        Mux1_4: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_4, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_4);
        Mux1_5: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_5, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_5);        
        Mux1_6: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_6, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_6);
        Mux1_7: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in1_7, sel_i => mux_sel0, ena_i => enable, y_o => muxout1_7);

        -- Bies D 1

        d10: biestableD port map(D => muxout1_0, clk => clkDiv, Q => Q1_0, QN => QN1_0);
        d11: biestableD port map(D => muxout1_1, clk => clkDiv, Q => Q1_1, QN => QN1_1);
        d12: biestableD port map(D => muxout1_2, clk => clkDiv, Q => Q1_2, QN => QN1_2);
        d13: biestableD port map(D => muxout1_3, clk => clkDiv, Q => Q1_3, QN => QN1_3);
        d14: biestableD port map(D => muxout1_4, clk => clkDiv, Q => Q1_4, QN => QN1_4);
        d15: biestableD port map(D => muxout1_5, clk => clkDiv, Q => Q1_5, QN => QN1_5);
        d16: biestableD port map(D => muxout1_6, clk => clkDiv, Q => Q1_6, QN => QN1_6);
        d17: biestableD port map(D => muxout1_7, clk => clkDiv, Q => Q1_7, QN => QN1_7);

        -- Mux 1_0
        mux_in1_0(0) <= Q1_0;   --000
        mux_in1_0(3) <= '0';    --011
        mux_in1_0(5) <= '0';    --101
        mux_in1_0(6) <= Q1_0;   --110
        mux_in1_0(7) <= '0';    --111

        mux_in1_0(1) <= '0';    -- 00 1
        mux_in1_0(2) <= '0';    -- 01 0 
        mux_in1_0(4) <= Q1_1;   -- 10 0

        -- Mux 1_1
        mux_in1_1(0) <= Q1_1;
        mux_in1_1(3) <= '0';
        mux_in1_1(5) <= '0';
        mux_in1_1(6) <= Q1_1;
        mux_in1_1(7) <= '0';

        mux_in1_1(1) <= '0';   -- 00 1 RESET
        mux_in1_1(2) <= Q1_0;  -- 01 0 DERECHA
        mux_in1_1(4) <= Q1_2;  -- 10 0 IZQUIERDA

        -- Mux 1_2
        mux_in1_2(0) <= Q1_2;
        mux_in1_2(3) <= '0';
        mux_in1_2(5) <= '0';
        mux_in1_2(6) <= Q1_2;
        mux_in1_2(7) <= '0';

        mux_in1_2(1) <= '0';   -- 00 1 RESET
        mux_in1_2(2) <= Q1_1;  -- 01 0 DERECHA
        mux_in1_2(4) <= Q1_3;  -- 10 0 IZQUIERDA

        -- Mux 1_3
        mux_in1_3(0) <= Q1_3;
        mux_in1_3(3) <= '0';
        mux_in1_3(5) <= '0';
        mux_in1_3(6) <= Q1_3;
        mux_in1_3(7) <= '0';

        mux_in1_3(1) <= '0';   -- 00 1 RESET
        mux_in1_3(2) <= Q1_2;  -- 01 0 DERECHA
        mux_in1_3(4) <= Q1_4;  -- 10 0 IZQUIERDA

        -- Mux 1_4
        mux_in1_4(0) <= Q1_4;
        mux_in1_4(3) <= '1';
        mux_in1_4(5) <= '1';
        mux_in1_4(6) <= Q1_4;
        mux_in1_4(7) <= '1';

        mux_in1_4(1) <= '1';   -- 00 1 RESET
        mux_in1_4(2) <= Q1_3;  -- 01 0 DERECHA
        mux_in1_4(4) <= Q1_5;  -- 10 0 IZQUIERDA

        -- Mux 1_5
        mux_in1_5(0) <= Q1_5;
        mux_in1_5(3) <= '0';
        mux_in1_5(5) <= '0';
        mux_in1_5(6) <= Q1_5;
        mux_in1_5(7) <= '0';

        mux_in1_5(1) <= '0';   -- 00 1 RESET
        mux_in1_5(2) <= Q1_4;  -- 01 0 DERECHA
        mux_in1_5(4) <= Q1_6;  -- 10 0 IZQUIERDA

        -- Mux 1_6
        mux_in1_6(0) <= Q1_6;
        mux_in1_6(3) <= '0';
        mux_in1_6(5) <= '0';
        mux_in1_6(6) <= Q1_6;
        mux_in1_6(7) <= '0';

        mux_in1_6(1) <= '0';   -- 00 1 RESET
        mux_in1_6(2) <= Q1_5;  -- 01 0 DERECHA
        mux_in1_6(4) <= Q1_7;  -- 10 0 IZQUIERDA

        -- Mux 1_7
        mux_in1_7(0) <= Q1_7;
        mux_in1_7(3) <= '0';
        mux_in1_7(5) <= '0';
        mux_in1_7(6) <= Q1_7;
        mux_in1_7(7) <= '0';

        mux_in1_7(1) <= '0';   -- 00 1 RESET
        mux_in1_7(2) <= Q1_6;  -- 01 0 DERECHA
        mux_in1_7(4) <= '0';   -- 10 0 IZQUIERDA














        -- Biestables D ------------------------------------------------------------------

        -- ConexiÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n de las seÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±ales D a las entradas de los biestables D
        
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
