library IEEE;
use IEEE.std_logic_1164.all;

entity biestableJK is
    port (
        status, notStatus : out std_logic;
        clk, j, k : in std_logic
    );
end entity;

architecture behav of biestableJK is

    signal internalQ : std_logic;

begin

    status <= internalQ;
    notStatus <= not internalQ;

    main_process : process (clk)
    begin

        if rising_edge (clk) then
            if j = '0' and k = '0' then
                internalQ <= internalQ;
            elsif j = '0' and k = '1' then
                internalQ <= '0';
            elsif j = '1' and k = '0' then
                internalQ <= '1';
            else
                internalQ <= not internalQ;
            end if;
        end if;
        report "    internalQ=" & std_logic'image(internalQ);

    end process;

end behav;
