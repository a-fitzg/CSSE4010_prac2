----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 17:33:25
-- Design Name: 
-- Module Name: test_ssd_decoder - Behavioral
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

entity test_ssd_decoder is
--  Port ( );
end test_ssd_decoder;

architecture Behavioral of test_ssd_decoder is

    component ssd_decoder port (
        input  : in  STD_LOGIC_VECTOR (3 downto 0);
        output : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal input  : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal output : STD_LOGIC_VECTOR (6 downto 0);

begin

    u1 : ssd_decoder port map(
        input  => input,
        output => output);

    input_gen : process
    begin
        for i in 0 to 15 loop
            input <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, input'length));
            wait for 10ps;
        end loop;
        wait;
    end process;

end Behavioral;
