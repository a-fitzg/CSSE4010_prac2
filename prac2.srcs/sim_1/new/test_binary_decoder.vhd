----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 18:16:09
-- Design Name: 
-- Module Name: test_binary_decoder - Behavioral
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

entity test_binary_decoder is
--  Port ( );
end test_binary_decoder;

architecture Behavioral of test_binary_decoder is

    component binary_decoder port (
           x  : in  STD_LOGIC_VECTOR (1 downto 0);
           d0 : out STD_LOGIC;
           d1 : out STD_LOGIC;
           d2 : out STD_LOGIC;
           d3 : out STD_LOGIC);
    end component;

    signal x    : STD_LOGIC_VECTOR(1 downto 0);
    signal d0   : STD_LOGIC;
    signal d1   : STD_LOGIC;
    signal d2   : STD_LOGIC;
    signal d3   : STD_LOGIC;

begin

    u1 : binary_decoder port map(
        x => x,
        d0 => d0,
        d1 => d1,
        d2 => d2,
        d3 => d3);

    input_gen : process
    begin
        wait for 10ps;
        for i in 0 to 3 loop
            x <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, x'length));
            wait for 10ps;
        end loop;
    end process;

end Behavioral;
