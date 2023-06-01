library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Botones is
    Port (  buttonIn : inout STD_LOGIC;
            buttonOut : inout STD_LOGIC);
end Botones;

architecture Behavioral of Botones is


    begin
        process1: process(buttonIn)
        
      begin 
      if(buttonIn = '1') then 
        buttonOut <=   '1';
        else 
        buttonOut <= '0';
        end if;
        end process;     

end Behavioral;

