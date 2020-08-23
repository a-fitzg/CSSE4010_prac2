----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 00:50:01
-- Design Name: 
-- Module Name: test_ssd_mux - Behavioral
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

entity test_ssd_mux is
--  Port ( );
end test_ssd_mux;

architecture Behavioral of test_ssd_mux is

    component ssd_mux port (
           in1    : in  STD_LOGIC_VECTOR (3 downto 0);
           in2    : in  STD_LOGIC_VECTOR (3 downto 0);
           in3    : in  STD_LOGIC_VECTOR (3 downto 0);
           in4    : in  STD_LOGIC_VECTOR (3 downto 0);
           S      : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal in1    : STD_LOGIC_VECTOR (3 downto 0);
    signal in2    : STD_LOGIC_VECTOR (3 downto 0);
    signal in3    : STD_LOGIC_VECTOR (3 downto 0);
    signal in4    : STD_LOGIC_VECTOR (3 downto 0);
    signal S      : STD_LOGIC_VECTOR (1 downto 0);
    signal output : STD_LOGIC_VECTOR (3 downto 0);

begin

    u1 : ssd_mux port map (
        in1    => in1,
        in2    => in2,
        in3    => in3,
        in4    => in4,
        S      => S,
        output => output);

    input_gen : process
    begin
    
        in1 <= x"2";
        in2 <= x"4";
        in3 <= x"6";
        in4 <= x"8";
    
        for i in 0 to 3 loop
            S <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, S'length));
            wait for 10ps;
        end loop;
    end process;

end Behavioral;
