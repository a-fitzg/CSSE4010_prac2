----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 14:57:29
-- Design Name: 
-- Module Name: test_output_decoder - Behavioral
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

entity test_output_decoder is
--  Port ( );
end test_output_decoder;

architecture Behavioral of test_output_decoder is

    component output_decoder port ( 
           in1    : in  STD_LOGIC_VECTOR (3 downto 0);
           in2    : in  STD_LOGIC_VECTOR (3 downto 0);
           in3    : in  STD_LOGIC_VECTOR (3 downto 0);
           in4    : in  STD_LOGIC_VECTOR (3 downto 0);
           unlock : out STD_LOGIC;
           lock   : out STD_LOGIC);
    end component;

    signal in1    : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal in2    : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal in3    : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal in4    : STD_LOGIC_VECTOR (3 downto 0) := x"0";
    signal unlock : STD_LOGIC;
    signal lock   : STD_LOGIC;

begin

    u1 : output_decoder port map (
        in1     => in1,
        in2     => in2,
        in3     => in3,
        in4     => in4,
        unlock  => unlock,
        lock    => lock);

    input_gen : process
    begin
        in1 <= x"0";
        in2 <= x"0";
        in3 <= x"0";
        in4 <= x"0";
        wait for 10ps;
        in1 <= x"0";
        wait for 10ps;
        in2 <= x"8";
        wait for 10ps;
        in3 <= x"7";
        wait for 10ps;
        in4 <= x"4";
        
        wait;
    end process;
    
end Behavioral;
