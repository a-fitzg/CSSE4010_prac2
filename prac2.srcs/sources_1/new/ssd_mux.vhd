----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 00:43:10
-- Design Name: 
-- Module Name: ssd_mux - Behavioral
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

entity ssd_mux is
    Port ( in1    : in  STD_LOGIC_VECTOR (3 downto 0);
           in2    : in  STD_LOGIC_VECTOR (3 downto 0);
           in3    : in  STD_LOGIC_VECTOR (3 downto 0);
           in4    : in  STD_LOGIC_VECTOR (3 downto 0);
           S      : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end ssd_mux;

architecture Behavioral of ssd_mux is

begin
    process (S)
    begin
        case S is
            when "00"   => output <= in1;
            when "01"   => output <= in2;
            when "10"   => output <= in3;
            when "11"   => output <= in4;
            when others => output <= "0000";
        end case;
    end process;
end Behavioral;
