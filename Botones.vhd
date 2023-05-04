library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
    Port ( BUTTON : in STD_LOGIC;
           LED : out STD_LOGIC);
end TOP;

architecture Behavioral of TOP is

begin

process_1 : process (BUTTON)
  variable LED_state : std_logic := '0'; -- variable para almacenar el estado actual del LED
begin
  if (BUTTON = '1') then
    if (LED_state = '0') then -- si el LED está apagado
      LED_state := '1'; -- enciende el LED
    else
      LED_state := '0'; -- apaga el LED
    end if;
  end if;
  LED <= LED_state; -- actualiza el estado del LED
end process;



end Behavioral;
