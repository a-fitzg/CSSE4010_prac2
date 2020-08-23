----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 23:56:37
-- Design Name: 
-- Module Name: test_binary_counter - Behavioral
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

entity test_binary_counter is
--  Port ( );
end test_binary_counter;

architecture Behavioral of test_binary_counter is

    component binary_counter port (
        RST  : in STD_LOGIC;
        CLK  : in STD_LOGIC;
        X    : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    signal RST : STD_LOGIC;
    signal CLK : STD_LOGIC;
    signal X   : STD_LOGIC_VECTOR(1 downto 0);

begin

    u1 : binary_counter port map (
        RST => RST,
        CLK => CLK,
        X   => X);
        
    input_gen : process
    begin
        RST <= '0';
        for i in 0 to 7 loop
            CLK <= '1';
            wait for 5ps;
            CLK <= '0';
            wait for 5ps;
        end loop;
    end process;

end Behavioral;
