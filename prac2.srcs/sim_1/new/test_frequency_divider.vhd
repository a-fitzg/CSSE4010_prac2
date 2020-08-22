----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 12:46:20
-- Design Name: 
-- Module Name: test_frequency_divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_frequency_divider is
--  Port ( );
end test_frequency_divider;

architecture Behavioral of test_frequency_divider is

    component frequency_divider port ( 
        CLK  : in  STD_LOGIC;
        RST  : in  STD_LOGIC;
        Q    : out STD_LOGIC;
        QBAR : out STD_LOGIC);
    end component;
    
    signal CLK  : STD_LOGIC;
    signal RST  : STD_LOGIC;
    signal Q    : STD_LOGIC;
    signal QBAR : STD_LOGIC;

begin

    u1 : frequency_divider port map (
        CLK  => CLK,
        RST  => RST,
        Q    => Q,
        QBAR => QBAR);

    input_gen : process
    begin
        CLK <= '0';
        RST <= '1';
        wait for 5ps;
        RST <= '0';
        wait for 5ps;
        
        for I in 1 to 8 loop
        
            CLK <= '1';
            wait for 5ps;
            CLK <= '0';
            wait for 5ps;
            
        end loop;
        wait;
    end process;

end Behavioral;
