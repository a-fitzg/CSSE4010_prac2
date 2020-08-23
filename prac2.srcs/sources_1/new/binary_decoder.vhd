----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 17:55:59
-- Design Name: 
-- Module Name: binary_decoder - Behavioral
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

entity binary_decoder is
    Port ( x  : in  STD_LOGIC_VECTOR (1 downto 0);
           d0 : out STD_LOGIC;
           d1 : out STD_LOGIC;
           d2 : out STD_LOGIC;
           d3 : out STD_LOGIC);
end binary_decoder;

architecture Behavioral of binary_decoder is

    signal outputs : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

    process (x)
    begin
        case x is
            when "00"   => outputs <= "0001";
            when "01"   => outputs <= "0010";
            when "10"   => outputs <= "0100";
            when "11"   => outputs <= "1000";
            when others => outputs <= "0001";
        end case;
    end process;

    d0 <= outputs(0);
    d1 <= outputs(1);
    d2 <= outputs(2);
    d3 <= outputs(3);

end Behavioral;
