----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2023 13:54:29
-- Design Name: 
-- Module Name: MUX_Generico - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_Generico is
    generic(N : positive := 2);
    port(i_i    : in std_logic_vector(2**N-1 downto 0);
    sel_i       : in std_logic_vector (N-1 downto 0);
    ena_i       : in std_logic;
    y_o         : out std_logic
    );
end MUX_Generico;

architecture Arq of MUX_Generico is
begin

    y_o <= i_i(to_integer(unsigned(sel_i))) and ena_i;
end architecture Arq;
