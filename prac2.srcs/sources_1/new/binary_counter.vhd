----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 23:38:55
-- Design Name: 
-- Module Name: binary_counter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_counter is
    Port ( RST  : in STD_LOGIC;
           CLK  : in STD_LOGIC;
           X    : out STD_LOGIC_VECTOR (1 downto 0));
end binary_counter;

architecture Behavioral of binary_counter is

    signal count : std_logic_vector(1 downto 0) := "00";

begin

    process (CLK)
    begin
        if (RST = '1') then
            count <= "00";
        elsif (CLK'event and CLK = '1') then
            count <= count + 1;
        end if;
        
        X <= count;
        
    end process;

end Behavioral;
