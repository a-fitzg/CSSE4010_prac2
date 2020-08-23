----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 16:31:14
-- Design Name: 
-- Module Name: ssd_decoder - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssd_decoder is Port ( 
           input  : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (6 downto 0));
end ssd_decoder;

architecture Behavioral of ssd_decoder is

begin

    process (input)
    begin
        case input is
            when x"0"   => output <= "0000001"; -- 0     
            when x"1"   => output <= "1001111"; -- 1 
            when x"2"   => output <= "0010010"; -- 2 
            when x"3"   => output <= "0000110"; -- 3 
            when x"4"   => output <= "1001100"; -- 4 
            when x"5"   => output <= "0100100"; -- 5 
            when x"6"   => output <= "0100000"; -- 6 
            when x"7"   => output <= "0001111"; -- 7 
            when x"8"   => output <= "0000000"; -- 8     
            when x"9"   => output <= "0000100"; -- 9 
            when x"A"   => output <= "0000010"; -- A
            when x"B"   => output <= "1100000"; -- B
            when x"C"   => output <= "0110001"; -- C
            when x"D"   => output <= "1000010"; -- D
            when x"E"   => output <= "0110000"; -- E
            when x"F"   => output <= "0111000"; -- F
            when others => output <= "1111111"; -- Default
            end case; 
    end process;

end Behavioral;
