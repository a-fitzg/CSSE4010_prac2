----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 12:24:45
-- Design Name: 
-- Module Name: frequency_divider - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_divider is
    Port ( CLK  : in STD_LOGIC;
           RST  : in STD_LOGIC;
           Q    : out STD_LOGIC;
           QBAR : out STD_LOGIC);
end frequency_divider;

architecture Behavioral of frequency_divider is

    signal clock_state : std_logic;

begin

    process (CLK, RST)
    begin
        if (RST = '1') then
            clock_state <= '0';
            
        elsif (CLK'event and CLK = '1') then
            clock_state <= not clock_state;
            
        end if;
    end process;

    Q    <= clock_state;
    QBAR <= not clock_state;

end Behavioral;
