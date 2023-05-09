library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Botones2 is
    Port ( BUTTON : in STD_LOGIC;
           LED : out STD_LOGIC);
end Botones2;

architecture Behavioral of Botones2 is

signal Q, Qn : std_logic;
 component biestableJK is
        port (
        status, notStatus : out std_logic;
        clk, j, k : in std_logic
    );
    end component;
    
begin
 j0: biestableJK port map(status =>Q,notStatus => Qn, clk => BUTTON, j =>'1',k =>'1');



  LED <= Q;

end Behavioral;
