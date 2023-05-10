        -- Mux 2

        mux_in2(0) <= muxout2;
        mux_in2(3) <= muxout2;
        mux_in2(5) <= muxout2;
        mux_in2(6) <= muxout2;
        mux_in2(7) <= muxout2;

        mux_in2(1) <= muxout1;    -- 001 Mover derecha (PONER LA SALIDA DEL MUX DE LA IZQUIERDA)
        mux_in2(2) <= '0';    -- 010 Disposicion inicial  0 0 0 1 1 1 0 0
        mux_in2(4) <= muxout3;    -- 100 Mover izquierda (PONER LA SALIDA DEL MUX DE LA DERECHA)

        Mux1: MUX_Generico generic map(N => 3)
        port map(i_i => mux_in2, sel_i => mux_sel, ena_i => enable, y_o => muxout2);