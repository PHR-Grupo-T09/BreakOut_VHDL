library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Botones is
    Port (  buttonIn : in STD_LOGIC;
            buttonOut : out STD_LOGIC);
end Botones;

architecture Behavioral of Botones is

    signal Q, Qn : std_logic;

    component biestableJK is
            port (
            status, notStatus : out std_logic;
            clk, j, k : in std_logic
        );
        end component;

    begin

        j0: biestableJK port map(status =>Q,notStatus => Qn, clk => buttonIn, j =>'1',k =>'1');

        buttonOut <= Q;

end Behavioral;
