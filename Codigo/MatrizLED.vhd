library IEEE;
use IEEE.std_logic_1164.all;


entity MatrizLED is
port (
    disparoIn : inout std_logic;
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
    
    signal Q50, Q51, Q52, Q53, Q54, Q55, Q56, Q57 : std_logic;
    signal Q50_1, Q51_1, Q52_1, Q53_1, Q54_1, Q55_1, Q56_1, Q57_1 : std_logic;
   
    signal QN50, QN51, QN52, QN53, QN54, QN55, QN56, QN57 : std_logic;
    signal QN50_1, QN51_1, QN52_1, QN53_1, QN54_1, QN55_1, QN56_1, QN57_1 : std_logic;
    
    
    signal Q60, Q61, Q62, Q63, Q64, Q65, Q66, Q67 : std_logic;
    signal Q60_1, Q61_1, Q62_1, Q63_1, Q64_1, Q65_1, Q66_1, Q67_1 : std_logic;
   
    signal QN60, QN61, QN62, QN63, QN64, QN65, QN66, QN67 : std_logic;
    signal QN60_1, QN61_1, QN62_1, QN63_1, QN64_1, QN65_1, QN66_1, QN67_1 : std_logic;

    
    signal Q70, Q71, Q72, Q73, Q74, Q75, Q76, Q77 : std_logic;
    signal Q70_1, Q71_1, Q72_1, Q73_1, Q74_1, Q75_1, Q76_1, Q77_1 : std_logic;
   
    signal QN70, QN71, QN72, QN73, QN74, QN75, QN76, QN77 : std_logic;
    signal QN70_1, QN71_1, QN72_1, QN73_1, QN74_1, QN75_1, QN76_1, QN77_1 : std_logic;

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
    signal mux_in5_0, mux_in5_1, mux_in5_2, mux_in5_3, mux_in5_4, mux_in5_5, mux_in5_6, mux_in5_7 : std_logic_vector(3 downto 0);
    signal mux_in6_0, mux_in6_1, mux_in6_2, mux_in6_3, mux_in6_4, mux_in6_5, mux_in6_6, mux_in6_7 : std_logic_vector(3 downto 0);
    signal mux_in7_0, mux_in7_1, mux_in7_2, mux_in7_3, mux_in7_4, mux_in7_5, mux_in7_6, mux_in7_7 : std_logic_vector(3 downto 0);

    signal mux_sel0: std_logic_vector(2 downto 0);
    signal mux_sel5_0, mux_sel5_1, mux_sel5_2, mux_sel5_3, mux_sel5_4, mux_sel5_5, mux_sel5_6, mux_sel5_7: std_logic_vector(1 downto 0);
    signal mux_sel6_0, mux_sel6_1, mux_sel6_2, mux_sel6_3, mux_sel6_4, mux_sel6_5, mux_sel6_6, mux_sel6_7: std_logic_vector(1 downto 0);
    signal mux_sel7_0, mux_sel7_1, mux_sel7_2, mux_sel7_3, mux_sel7_4, mux_sel7_5, mux_sel7_6, mux_sel7_7: std_logic_vector(1 downto 0);
    
    signal muxout0_0, muxout0_1, muxout0_3,  muxout0_2, muxout0_4, muxout0_5, muxout0_6, muxout0_7  : std_logic;
    signal muxout1_0, muxout1_1, muxout1_3,  muxout1_2, muxout1_4, muxout1_5, muxout1_6, muxout1_7  : std_logic;
    signal muxout5_0, muxout5_1, muxout5_3,  muxout5_2, muxout5_4, muxout5_5, muxout5_6, muxout5_7  : std_logic;
    signal muxout6_0, muxout6_1, muxout6_3,  muxout6_2, muxout6_4, muxout6_5, muxout6_6, muxout6_7  : std_logic;
    signal muxout7_0, muxout7_1, muxout7_3,  muxout7_2, muxout7_4, muxout7_5, muxout7_6, muxout7_7  : std_logic;
    
    signal disparo50, disparo50_1 : std_logic;
    signal disparo51, disparo51_1 : std_logic;
    signal disparo52, disparo52_1 : std_logic;
    signal disparo53, disparo53_1 : std_logic;
    signal disparo54, disparo54_1 : std_logic;
    signal disparo55, disparo55_1 : std_logic;
    signal disparo56, disparo56_1 : std_logic;
    signal disparo57, disparo57_1 : std_logic;
    
    signal disparo60, disparo60_1 : std_logic;
    signal disparo61, disparo61_1 : std_logic;
    signal disparo62, disparo62_1 : std_logic;
    signal disparo63, disparo63_1 : std_logic;
    signal disparo64, disparo64_1 : std_logic;
    signal disparo65, disparo65_1 : std_logic;
    signal disparo66, disparo66_1 : std_logic;
    signal disparo67, disparo67_1 : std_logic;
    
    signal disparo70, disparo70_1 : std_logic;
    signal disparo71, disparo71_1 : std_logic;
    signal disparo72, disparo72_1 : std_logic;
    signal disparo73, disparo73_1 : std_logic;
    signal disparo74, disparo74_1 : std_logic;
    signal disparo75, disparo75_1 : std_logic;
    signal disparo76, disparo76_1 : std_logic;
    signal disparo77, disparo77_1 : std_logic;


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

    signal botonOut : std_logic;
    component Botones is
        Port (  buttonIn : inout STD_LOGIC;
                buttonOut : inout STD_LOGIC);
    end component;


    signal inicioDisparo0, inicioDisparo1, inicioDisparo2, inicioDisparo3, inicioDisparo4, inicioDisparo5, inicioDisparo6, inicioDisparo7 : std_logic;
    
    begin

        -- Enable general a todos los MUX
        enable <= '1';
    
        -- Entradas de seleccion para los mux de las filas con movimiento derecha e izquierda.
        RESETOUT <= RESET;
        derechaOut <= derecha;
        izquierdaOut <= izquierda;

        -- BOTON ------------------------------------------------------------------------
        
        boton: Botones port map ( buttonIn => disparoIn , buttonOut => botonOut);

        -- DIVISOR FRECUENCIA -----------------------------------------------------------
        
        div: DivisorFrecuencia port map ( clk100mhz => clk , clkOut => clkDiv);



--------------------------------------------------------------------------------------------------------        
---------- ZONA 1 --------------------------------------------------------------------------------------
---------- Filas de movimiento (fila 0 y fila 1) -------------------------------------------------------
        
        -- FILA 0 --------------------------------------------------------------------------------------

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


        -- FILA 1 --------------------------------------------------------------------------

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



--------------------------------------------------------------------------------------------------------
---------- ZONA 2 --------------------------------------------------------------------------------------
---------- Columnas Solo de Disparo (Fila 2 - Fila 4) --------------------------------------------------

        -- Columna 0 ------------------------------------------------------------------------------------
        
        inicioDisparo0 <= (Q1_0 and derecha and izquierda) or (Q1_0 and botonOut);
        
        d20: biestableD port map(D => inicioDisparo0, clk => clkDiv, Q => Q2_0, QN => QN2_0);
        d30: biestableD port map(D => Q2_0, clk => clkDiv, Q => Q3_0, QN => QN3_0);
        d40: biestableD port map(D => Q3_0, clk => clkDiv, Q => Q4_0, QN => QN4_0);
       
        --d60: biestableD port map(D => Q5_0, clk => clkDiv, Q => Q6_0, QN => QN6_0);
        --d70: biestableD port map(D => Q6_0, clk => clkDiv, Q => Q7_0, QN => QN7_0);
        
        -- Columna 1 ------------------------------------------------------------------------------------
        
        inicioDisparo1 <= (Q1_1 and derecha and izquierda) or (Q1_1 and botonOut);
        
        d21: biestableD port map(D => inicioDisparo1, clk => clkDiv, Q => Q2_1, QN => QN2_1);
        d31: biestableD port map(D => Q2_1, clk => clkDiv, Q => Q3_1, QN => QN3_1);
        d41: biestableD port map(D => Q3_1, clk => clkDiv, Q => Q4_1, QN => QN4_1);
        
        --d61: biestableD port map(D => Q5_1, clk => clkDiv, Q => Q6_1, QN => QN6_1);
        --d71: biestableD port map(D => Q6_1, clk => clkDiv, Q => Q7_1, QN => QN7_1);

        -- Columna 2 ------------------------------------------------------------------------------------
        
        inicioDisparo2 <= (Q1_2 and derecha and izquierda) or (Q1_2 and botonOut);
                
        d22: biestableD port map(D => inicioDisparo2, clk => clkDiv, Q => Q2_2, QN => QN2_1);
        d32: biestableD port map(D => Q2_2, clk => clkDiv, Q => Q3_2, QN => QN3_2);
        d42: biestableD port map(D => Q3_2, clk => clkDiv, Q => Q4_2, QN => QN4_2);
        
        --d62: biestableD port map(D => Q5_2, clk => clkDiv, Q => Q6_2, QN => QN6_2);
        --d72: biestableD port map(D => Q6_2, clk => clkDiv, Q => Q7_2, QN => QN7_2);
        
        -- Columna 3 ------------------------------------------------------------------------------------
                
        inicioDisparo3 <= (Q1_3 and derecha and izquierda) or (Q1_3 and botonOut);
        
        d23: biestableD port map(D => inicioDisparo3, clk => clkDiv, Q => Q2_3, QN => QN2_3);
        d33: biestableD port map(D => Q2_3, clk => clkDiv, Q => Q3_3, QN => QN3_3);
        d43: biestableD port map(D => Q3_3, clk => clkDiv, Q => Q4_3, QN => QN4_3);
        
        --d63: biestableD port map(D => Q5_3, clk => clkDiv, Q => Q6_3, QN => QN6_3);
        --d73: biestableD port map(D => Q6_3, clk => clkDiv, Q => Q7_3, QN => QN7_3);
    
        -- Columna 4 ------------------------------------------------------------------------------------
        
        inicioDisparo4 <= (Q1_4 and derecha and izquierda) or (Q1_4 and botonOut);
        
        d24: biestableD port map(D => inicioDisparo4, clk => clkDiv, Q => Q2_4, QN => QN2_4);
        d34: biestableD port map(D => Q2_4, clk => clkDiv, Q => Q3_4, QN => QN3_4);
        d44: biestableD port map(D => Q3_4, clk => clkDiv, Q => Q4_4, QN => QN4_4);
        
        --d64: biestableD port map(D => Q5_4, clk => clkDiv, Q => Q6_4, QN => QN6_4);
        --d74: biestableD port map(D => Q6_4, clk => clkDiv, Q => Q7_4, QN => QN7_4);
        
        -- Columna 5 ------------------------------------------------------------------------------------
        
        inicioDisparo5 <= (Q1_5 and derecha and izquierda) or (Q1_5 and botonOut);
                
        d25: biestableD port map(D => inicioDisparo5, clk => clkDiv, Q => Q2_5, QN => QN2_5);
        d35: biestableD port map(D => Q2_5, clk => clkDiv, Q => Q3_5, QN => QN3_5);
        d45: biestableD port map(D => Q3_5, clk => clkDiv, Q => Q4_5, QN => QN4_5);
        
        --d65: biestableD port map(D => Q5_5, clk => clkDiv, Q => Q6_5, QN => QN6_5);
        --d75: biestableD port map(D => Q6_5, clk => clkDiv, Q => Q7_5, QN => QN7_5);
        
        -- Columna 6 ------------------------------------------------------------------------------------
                
        inicioDisparo6 <= (Q1_6 and derecha and izquierda) or (Q1_6 and botonOut);
                
        d26: biestableD port map(D => inicioDisparo6, clk => clkDiv, Q => Q2_6, QN => QN2_6);
        d36: biestableD port map(D => Q2_6, clk => clkDiv, Q => Q3_6, QN => QN3_6);
        d46: biestableD port map(D => Q3_6, clk => clkDiv, Q => Q4_6, QN => QN4_6);
        
        --d66: biestableD port map(D => Q5_6, clk => clkDiv, Q => Q6_6, QN => QN6_6);
        --d76: biestableD port map(D => Q6_6, clk => clkDiv, Q => Q7_6, QN => QN7_6);
        
        -- Columna 7 ------------------------------------------------------------------------------------
                
        inicioDisparo7 <= (Q1_7 and derecha and izquierda) or (Q1_7 and botonOut);
                
        d27: biestableD port map(D => inicioDisparo7, clk => clkDiv, Q => Q2_7, QN => QN2_7);
        d37: biestableD port map(D => Q2_7, clk => clkDiv, Q => Q3_7, QN => QN3_7);
        d47: biestableD port map(D => Q3_7, clk => clkDiv, Q => Q4_7, QN => QN4_7);
        
        --d67: biestableD port map(D => Q5_7, clk => clkDiv, Q => Q6_7, QN => QN6_7);
        --d77: biestableD port map(D => Q6_7, clk => clkDiv, Q => Q7_7, QN => QN7_7);
        
        

--------------------------------------------------------------------------------------------------------
---------- ZONA 3 --------------------------------------------------------------------------------------
---------- Filas de Bloques (Fila 5 - Fila 7) ----------------------------------------------------------

        
        -- Fila 5 --------------------------------------------------------------------------------------
        
        -- MUX 5
        Mux5_0: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_0, sel_i => mux_sel5_0, ena_i => enable, y_o => muxout5_0);
        Mux5_1: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_1, sel_i => mux_sel5_1, ena_i => enable, y_o => muxout5_1);
        Mux5_2: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_2, sel_i => mux_sel5_2, ena_i => enable, y_o => muxout5_2);
        Mux5_3: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_3, sel_i => mux_sel5_3, ena_i => enable, y_o => muxout5_3);
        Mux5_4: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_4, sel_i => mux_sel5_4, ena_i => enable, y_o => muxout5_4);
        Mux5_5: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_5, sel_i => mux_sel5_5, ena_i => enable, y_o => muxout5_5);        
        Mux5_6: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_6, sel_i => mux_sel5_6, ena_i => enable, y_o => muxout5_6);
        Mux5_7: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in5_7, sel_i => mux_sel5_7, ena_i => enable, y_o => muxout5_7);
        
        -- Bies D 5
        d50: biestableD port map(D => muxout5_0, clk => clkDiv, Q => Q50, QN => QN50);
        d51: biestableD port map(D => muxout5_1, clk => clkDiv, Q => Q51, QN => QN51);
        d52: biestableD port map(D => muxout5_2, clk => clkDiv, Q => Q52, QN => QN52);
        d53: biestableD port map(D => muxout5_3, clk => clkDiv, Q => Q53, QN => QN53);
        d54: biestableD port map(D => muxout5_4, clk => clkDiv, Q => Q54, QN => QN54);
        d55: biestableD port map(D => muxout5_5, clk => clkDiv, Q => Q55, QN => QN55);
        d56: biestableD port map(D => muxout5_6, clk => clkDiv, Q => Q56, QN => QN56);
        d57: biestableD port map(D => muxout5_7, clk => clkDiv, Q => Q57, QN => QN57);
         
        d50_1: biestableD port map(D => disparo50_1, clk => clkDiv, Q => Q50_1, QN => QN50_1);
        d51_1: biestableD port map(D => disparo51_1, clk => clkDiv, Q => Q51_1, QN => QN51_1);
        d52_1: biestableD port map(D => disparo52_1, clk => clkDiv, Q => Q52_1, QN => QN52_1);
        d53_1: biestableD port map(D => disparo53_1, clk => clkDiv, Q => Q53_1, QN => QN53_1);
        d54_1: biestableD port map(D => disparo54_1, clk => clkDiv, Q => Q54_1, QN => QN54_1);
        d55_1: biestableD port map(D => disparo55_1, clk => clkDiv, Q => Q55_1, QN => QN55_1);
        d56_1: biestableD port map(D => disparo56_1, clk => clkDiv, Q => Q56_1, QN => QN56_1);
        d57_1: biestableD port map(D => disparo57_1, clk => clkDiv, Q => Q57_1, QN => QN57_1);

         
        -- Mux 5_0
        disparo50 <= Q4_0 and Q50;
        disparo50_1 <= Q4_0 and (not disparo50);
        
        mux_sel5_0(0) <= RESET;
        mux_sel5_0(1) <= disparo50;
        
        mux_in5_0(0) <= Q50;   -- 00
        mux_in5_0(1) <= '1';    -- 01 RESET
        mux_in5_0(2) <= '0';    -- 10 DISPARO
        mux_in5_0(3) <= Q50;    -- 11
        
        Q5_0 <= Q50 or Q50_1;
        
        -- Mux 5_1
        disparo51 <= Q4_1 and Q51;
        disparo51_1 <= Q4_1 and (not disparo51);
        
        mux_sel5_1(0) <= RESET;
        mux_sel5_1(1) <= disparo51;
        
        mux_in5_1(0) <= Q51;   -- 00
        mux_in5_1(1) <= '0';    -- 01 RESET
        mux_in5_1(2) <= '0';    -- 10 DISPARO
        mux_in5_1(3) <= Q51;    -- 11
        
        Q5_1 <= Q51 or Q51_1;
        
        -- Mux 5_2
        disparo52 <= Q4_2 and Q52;
        disparo52_1 <= Q4_2 and (not disparo52);
        
        mux_sel5_2(0) <= RESET;
        mux_sel5_2(1) <= disparo52;
        
        mux_in5_2(0) <= Q52;   -- 00
        mux_in5_2(1) <= '1';    -- 01 RESET
        mux_in5_2(2) <= '0';    -- 10 DISPARO
        mux_in5_2(3) <= Q52;    -- 11
        
        Q5_2 <= Q52 or Q52_1;
        
        -- Mux 5_3
        disparo53 <= Q4_3 and Q53;
        disparo53_1 <= Q4_3 and (not disparo53);
        
        mux_sel5_3(0) <= RESET;
        mux_sel5_3(1) <= disparo53;
        
        mux_in5_3(0) <= Q53;   -- 00
        mux_in5_3(1) <= '0';    -- 01 RESET
        mux_in5_3(2) <= '0';    -- 10 DISPARO
        mux_in5_3(3) <= Q53;    -- 11
        
        Q5_3 <= Q53 or Q53_1;
        
        -- Mux 5_4
        disparo54 <= Q4_4 and Q54;
        disparo54_1 <= Q4_4 and (not disparo54);
        
        mux_sel5_4(0) <= RESET;
        mux_sel5_4(1) <= disparo54;
        
        mux_in5_4(0) <= Q54;   -- 00
        mux_in5_4(1) <= '1';    -- 01 RESET
        mux_in5_4(2) <= '0';    -- 10 DISPARO
        mux_in5_4(3) <= Q54;    -- 11
        
        Q5_4 <= Q54 or Q54_1;
        
        -- Mux 5_5
        disparo55 <= Q4_5 and Q55;
        disparo55_1 <= Q4_5 and (not disparo55);
        
        mux_sel5_5(0) <= RESET;
        mux_sel5_5(1) <= disparo55;
        
        mux_in5_5(0) <= Q55;   -- 00
        mux_in5_5(1) <= '0';    -- 01 RESET
        mux_in5_5(2) <= '0';    -- 10 DISPARO
        mux_in5_5(3) <= Q55;    -- 11
        
        Q5_5 <= Q55 or Q55_1;
        
        -- Mux 5_6
        disparo56 <= Q4_6 and Q56;
        disparo56_1 <= Q4_6 and (not disparo56);
        
        mux_sel5_6(0) <= RESET;
        mux_sel5_6(1) <= disparo56;
        
        mux_in5_6(0) <= Q56;   -- 00
        mux_in5_6(1) <= '1';    -- 01 RESET
        mux_in5_6(2) <= '0';    -- 10 DISPARO
        mux_in5_6(3) <= Q56;    -- 11
        
        Q5_6 <= Q56 or Q56_1;
        
        -- Mux 5_7
        disparo57 <= Q4_7 and Q57;
        disparo57_1 <= Q4_7 and (not disparo57);
        
        mux_sel5_7(0) <= RESET;
        mux_sel5_7(1) <= disparo57;
        
        mux_in5_7(0) <= Q57;   -- 00
        mux_in5_7(1) <= '0';    -- 01 RESET
        mux_in5_7(2) <= '0';    -- 10 DISPARO
        mux_in5_7(3) <= Q57;    -- 11
        
        Q5_7 <= Q57 or Q57_1;
        
        
        -- Fila 6 --------------------------------------------------------------------------------------

        -- MUX 6
        Mux6_0: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_0, sel_i => mux_sel6_0, ena_i => enable, y_o => muxout6_0);
        Mux6_1: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_1, sel_i => mux_sel6_1, ena_i => enable, y_o => muxout6_1);
        Mux6_2: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_2, sel_i => mux_sel6_2, ena_i => enable, y_o => muxout6_2);
        Mux6_3: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_3, sel_i => mux_sel6_3, ena_i => enable, y_o => muxout6_3);
        Mux6_4: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_4, sel_i => mux_sel6_4, ena_i => enable, y_o => muxout6_4);
        Mux6_5: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_5, sel_i => mux_sel6_5, ena_i => enable, y_o => muxout6_5);        
        Mux6_6: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_6, sel_i => mux_sel6_6, ena_i => enable, y_o => muxout6_6);
        Mux6_7: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in6_7, sel_i => mux_sel6_7, ena_i => enable, y_o => muxout6_7);
        
        -- Bies D 6
        d60: biestableD port map(D => muxout6_0, clk => clkDiv, Q => Q60, QN => QN60);
        d61: biestableD port map(D => muxout6_1, clk => clkDiv, Q => Q61, QN => QN61);
        d62: biestableD port map(D => muxout6_2, clk => clkDiv, Q => Q62, QN => QN62);
        d63: biestableD port map(D => muxout6_3, clk => clkDiv, Q => Q63, QN => QN63);
        d64: biestableD port map(D => muxout6_4, clk => clkDiv, Q => Q64, QN => QN64);
        d65: biestableD port map(D => muxout6_5, clk => clkDiv, Q => Q65, QN => QN65);
        d66: biestableD port map(D => muxout6_6, clk => clkDiv, Q => Q66, QN => QN66);
        d67: biestableD port map(D => muxout6_7, clk => clkDiv, Q => Q67, QN => QN67);
        
        d60_1: biestableD port map(D => disparo60_1, clk => clkDiv, Q => Q60_1, QN => QN60_1);
        d61_1: biestableD port map(D => disparo61_1, clk => clkDiv, Q => Q61_1, QN => QN61_1);
        d62_1: biestableD port map(D => disparo62_1, clk => clkDiv, Q => Q62_1, QN => QN62_1);
        d63_1: biestableD port map(D => disparo63_1, clk => clkDiv, Q => Q63_1, QN => QN63_1);
        d64_1: biestableD port map(D => disparo64_1, clk => clkDiv, Q => Q64_1, QN => QN64_1);
        d65_1: biestableD port map(D => disparo65_1, clk => clkDiv, Q => Q65_1, QN => QN65_1);
        d66_1: biestableD port map(D => disparo66_1, clk => clkDiv, Q => Q66_1, QN => QN66_1);
        d67_1: biestableD port map(D => disparo67_1, clk => clkDiv, Q => Q67_1, QN => QN67_1);
        
        
        -- Mux 6_0
        disparo60 <= Q50_1 and Q60;
        disparo60_1 <= Q50_1 and (not disparo60);
        
        mux_sel6_0(0) <= RESET;
        mux_sel6_0(1) <= disparo60;
        
        mux_in6_0(0) <= Q60;   -- 00
        mux_in6_0(1) <= '0';    -- 01 RESET
        mux_in6_0(2) <= '0';    -- 10 DISPARO
        mux_in6_0(3) <= Q60;    -- 11
        
        Q6_0 <= Q60 or Q60_1;
        
        -- Mux 6_1
        disparo61 <= Q51_1 and Q61;
        disparo61_1 <= Q51_1 and (not disparo61);
        
        mux_sel6_1(0) <= RESET;
        mux_sel6_1(1) <= disparo61;
        
        mux_in6_1(0) <= Q61;   -- 00
        mux_in6_1(1) <= '1';    -- 01 RESET
        mux_in6_1(2) <= '0';    -- 10 DISPARO
        mux_in6_1(3) <= Q61;    -- 11
        
        Q6_1 <= Q61 or Q61_1;
        
        -- Mux 6_2
        disparo62 <= Q52_1 and Q62;
        disparo62_1 <= Q52_1 and (not disparo62);
        
        mux_sel6_2(0) <= RESET;
        mux_sel6_2(1) <= disparo62;
        
        mux_in6_2(0) <= Q62;   -- 00
        mux_in6_2(1) <= '0';    -- 01 RESET
        mux_in6_2(2) <= '0';    -- 10 DISPARO
        mux_in6_2(3) <= Q62;    -- 11
        
        Q6_2 <= Q62 or Q62_1;
        
        -- Mux 6_3
        disparo63 <= Q53_1 and Q63;
        disparo63_1 <= Q53_1 and (not disparo63);
        
        mux_sel6_3(0) <= RESET;
        mux_sel6_3(1) <= disparo63;
        
        mux_in6_3(0) <= Q63;   -- 00
        mux_in6_3(1) <= '1';    -- 01 RESET
        mux_in6_3(2) <= '0';    -- 10 DISPARO
        mux_in6_3(3) <= Q63;    -- 11
        
        Q6_3 <= Q63 or Q63_1;
        
        -- Mux 6_4
        disparo64 <= Q54_1 and Q64;
        disparo64_1 <= Q54_1 and (not disparo64);
        
        mux_sel6_4(0) <= RESET;
        mux_sel6_4(1) <= disparo64;
        
        mux_in6_4(0) <= Q64;   -- 00
        mux_in6_4(1) <= '0';    -- 01 RESET
        mux_in6_4(2) <= '0';    -- 10 DISPARO
        mux_in6_4(3) <= Q64;    -- 11
        
        Q6_4 <= Q64 or Q64_1;
        
        -- Mux 6_5
        disparo65 <= Q55_1 and Q65;
        disparo65_1 <= Q55_1 and (not disparo65);
        
        mux_sel6_5(0) <= RESET;
        mux_sel6_5(1) <= disparo65;
        
        mux_in6_5(0) <= Q65;   -- 00
        mux_in6_5(1) <= '1';    -- 01 RESET
        mux_in6_5(2) <= '0';    -- 10 DISPARO
        mux_in6_5(3) <= Q65;    -- 11
        
        Q6_5 <= Q65 or Q65_1;
        
        -- Mux 6_6
        disparo66 <= Q56_1 and Q66;
        disparo66_1 <= Q56_1 and (not disparo66);
        
        mux_sel6_6(0) <= RESET;
        mux_sel6_6(1) <= disparo66;
        
        mux_in6_6(0) <= Q66;   -- 00
        mux_in6_6(1) <= '0';    -- 01 RESET
        mux_in6_6(2) <= '0';    -- 10 DISPARO
        mux_in6_6(3) <= Q66;    -- 11
        
        Q6_6 <= Q66 or Q66_1;
        
        -- Mux 6_7
        disparo67 <= Q57_1 and Q67;
        disparo67_1 <= Q57_1 and (not disparo67);
        
        mux_sel6_7(0) <= RESET;
        mux_sel6_7(1) <= disparo67;
        
        mux_in6_7(0) <= Q67;   -- 00
        mux_in6_7(1) <= '1';    -- 01 RESET
        mux_in6_7(2) <= '0';    -- 10 DISPARO
        mux_in6_7(3) <= Q67;    -- 11
        
        Q6_7 <= Q67 or Q67_1;
        
        
        -- Fila 7 --------------------------------------------------------------------------------------
        
        -- MUX 7
        Mux7_0: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_0, sel_i => mux_sel7_0, ena_i => enable, y_o => muxout7_0);
        Mux7_1: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_1, sel_i => mux_sel7_1, ena_i => enable, y_o => muxout7_1);
        Mux7_2: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_2, sel_i => mux_sel7_2, ena_i => enable, y_o => muxout7_2);
        Mux7_3: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_3, sel_i => mux_sel7_3, ena_i => enable, y_o => muxout7_3);
        Mux7_4: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_4, sel_i => mux_sel7_4, ena_i => enable, y_o => muxout7_4);
        Mux7_5: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_5, sel_i => mux_sel7_5, ena_i => enable, y_o => muxout7_5);        
        Mux7_6: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_6, sel_i => mux_sel7_6, ena_i => enable, y_o => muxout7_6);
        Mux7_7: MUX_Generico generic map(N => 2)
        port map(i_i => mux_in7_7, sel_i => mux_sel7_7, ena_i => enable, y_o => muxout7_7);
        
        -- Bies D 7
        d70: biestableD port map(D => muxout7_0, clk => clkDiv, Q => Q70, QN => QN70);
        d71: biestableD port map(D => muxout7_1, clk => clkDiv, Q => Q71, QN => QN71);
        d72: biestableD port map(D => muxout7_2, clk => clkDiv, Q => Q72, QN => QN72);
        d73: biestableD port map(D => muxout7_3, clk => clkDiv, Q => Q73, QN => QN73);
        d74: biestableD port map(D => muxout7_4, clk => clkDiv, Q => Q74, QN => QN74);
        d75: biestableD port map(D => muxout7_5, clk => clkDiv, Q => Q75, QN => QN75);
        d76: biestableD port map(D => muxout7_6, clk => clkDiv, Q => Q76, QN => QN76);
        d77: biestableD port map(D => muxout7_7, clk => clkDiv, Q => Q77, QN => QN77);
        
        d70_1: biestableD port map(D => disparo70_1, clk => clkDiv, Q => Q70_1, QN => QN70_1);
        d71_1: biestableD port map(D => disparo71_1, clk => clkDiv, Q => Q71_1, QN => QN71_1);
        d72_1: biestableD port map(D => disparo72_1, clk => clkDiv, Q => Q72_1, QN => QN72_1);
        d73_1: biestableD port map(D => disparo73_1, clk => clkDiv, Q => Q73_1, QN => QN73_1);
        d74_1: biestableD port map(D => disparo74_1, clk => clkDiv, Q => Q74_1, QN => QN74_1);
        d75_1: biestableD port map(D => disparo75_1, clk => clkDiv, Q => Q75_1, QN => QN75_1);
        d76_1: biestableD port map(D => disparo76_1, clk => clkDiv, Q => Q76_1, QN => QN76_1);
        d77_1: biestableD port map(D => disparo77_1, clk => clkDiv, Q => Q77_1, QN => QN77_1);
        
        -- Mux 7_0
        disparo70 <= Q60_1 and Q70;
        disparo70_1 <= Q60_1 and (not disparo70);
        
        mux_sel7_0(0) <= RESET;
        mux_sel7_0(1) <= disparo70;
        
        mux_in7_0(0) <= Q70;   -- 00
        mux_in7_0(1) <= '1';    -- 01 RESET
        mux_in7_0(2) <= '0';    -- 10 DISPARO
        mux_in7_0(3) <= Q70;    -- 11
        
        Q7_0 <= Q70 or Q70_1;
        
        -- Mux 7_1
        disparo71 <= Q61_1 and Q71;
        disparo71_1 <= Q61_1 and (not disparo71);
        
        mux_sel7_1(0) <= RESET;
        mux_sel7_1(1) <= disparo71;
        
        mux_in7_1(0) <= Q71;   -- 00
        mux_in7_1(1) <= '0';    -- 01 RESET
        mux_in7_1(2) <= '0';    -- 10 DISPARO
        mux_in7_1(3) <= Q71;    -- 11
        
        Q7_1 <= Q71 or Q71_1;
        
        -- Mux 7_2
        disparo72 <= Q62_1 and Q72;
        disparo72_1 <= Q62_1 and (not disparo72);
        
        mux_sel7_2(0) <= RESET;
        mux_sel7_2(1) <= disparo72;
        
        mux_in7_2(0) <= Q72;   -- 00
        mux_in7_2(1) <= '1';    -- 01 RESET
        mux_in7_2(2) <= '0';    -- 10 DISPARO
        mux_in7_2(3) <= Q72;    -- 11
        
        Q7_2 <= Q72 or Q72_1;
        
        -- Mux 7_3
        disparo73 <= Q63_1 and Q73;
        disparo73_1 <= Q63_1 and (not disparo73);
        
        mux_sel7_3(0) <= RESET;
        mux_sel7_3(1) <= disparo73;
        
        mux_in7_3(0) <= Q73;   -- 00
        mux_in7_3(1) <= '0';    -- 01 RESET
        mux_in7_3(2) <= '0';    -- 10 DISPARO
        mux_in7_3(3) <= Q73;    -- 11
        
        Q7_3 <= Q73 or Q73_1;
        
        -- Mux 7_4
        disparo74 <= Q64_1 and Q74;
        disparo74_1 <= Q64_1 and (not disparo74);
        
        mux_sel7_4(0) <= RESET;
        mux_sel7_4(1) <= disparo74;
        
        mux_in7_4(0) <= Q74;   -- 00
        mux_in7_4(1) <= '1';    -- 01 RESET
        mux_in7_4(2) <= '0';    -- 10 DISPARO
        mux_in7_4(3) <= Q74;    -- 11
        
        Q7_4 <= Q74 or Q74_1;
        
        -- Mux 7_5
        disparo75 <= Q65_1 and Q75;
        disparo75_1 <= Q65_1 and (not disparo75);
        
        mux_sel7_5(0) <= RESET;
        mux_sel7_5(1) <= disparo75;
        
        mux_in7_5(0) <= Q75;   -- 00
        mux_in7_5(1) <= '0';    -- 01 RESET
        mux_in7_5(2) <= '0';    -- 10 DISPARO
        mux_in7_5(3) <= Q75;    -- 11
        
        Q7_5 <= Q75 or Q75_1;
        
        -- Mux 7_6
        disparo76 <= Q66_1 and Q76;
        disparo76_1 <= Q66_1 and (not disparo76);
        
        mux_sel7_6(0) <= RESET;
        mux_sel7_6(1) <= disparo76;
        
        mux_in7_6(0) <= Q76;   -- 00
        mux_in7_6(1) <= '1';    -- 01 RESET
        mux_in7_6(2) <= '0';    -- 10 DISPARO
        mux_in7_6(3) <= Q76;    -- 11
        
        Q7_6 <= Q76 or Q76_1;
        
        -- Mux 7_7
        disparo77 <= Q67_1 and Q77;
        disparo77_1 <= Q67_1 and (not disparo77);
        
        mux_sel7_7(0) <= RESET;
        mux_sel7_7(1) <= disparo77;
        
        mux_in7_7(0) <= Q77;   -- 00
        mux_in7_7(1) <= '0';    -- 01 RESET
        mux_in7_7(2) <= '0';    -- 10 DISPARO
        mux_in7_7(3) <= Q77;    -- 11
        
        Q7_7 <= Q77 or Q77_1;


end behav;
