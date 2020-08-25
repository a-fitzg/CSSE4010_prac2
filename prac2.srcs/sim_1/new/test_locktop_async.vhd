----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 16:03:07
-- Design Name: 
-- Module Name: test_locktop_async - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_locktop_async is
--  Port ( );
end test_locktop_async;

architecture Behavioral of test_locktop_async is

    component locktop_async port (
           digit_a    : in  STD_LOGIC_VECTOR (3 downto 0);
           digit_b    : in  STD_LOGIC_VECTOR (3 downto 0);
           b1         : in  STD_LOGIC;
           b2         : in  STD_LOGIC;
           RST        : in  STD_LOGIC;
           lock       : out STD_LOGIC;
           unlock     : out STD_LOGIC;
           extern_clk : in  STD_LOGIC;
           ssd_select : out STD_LOGIC_VECTOR (3 downto 0);
           ssd_bus    : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal digit_a    : STD_LOGIC_VECTOR (3 downto 0);
    signal digit_b    : STD_LOGIC_VECTOR (3 downto 0);
    signal b1         : STD_LOGIC;
    signal b2         : STD_LOGIC;
    signal RST        : STD_LOGIC;
    signal lock       : STD_LOGIC;
    signal unlock     : STD_LOGIC;
    signal extern_clk : STD_LOGIC;
    signal ssd_select : STD_LOGIC_VECTOR (3 downto 0);
    signal ssd_bus    : STD_LOGIC_VECTOR (6 downto 0);
    
begin

    u1 : locktop_async port map (
        digit_a	   => digit_a,
        digit_b    => digit_b,
        b1         => b1,
        b2         => b2,
        RST        => RST,
        lock       => lock,
        unlock     => unlock,
        extern_clk => extern_clk,
        ssd_select => ssd_select,
        ssd_bus	   => ssd_bus);

    input_gen : process
    begin
        RST <= '0';
        digit_a <= "0000";
        digit_b <= "0000";
        b1 <= '0';
        b2 <= '0';
        --extern_clk <= '0';
        --for i in 0 to 7 loop
            digit_a <= STD_LOGIC_VECTOR(TO_UNSIGNED(4, digit_a'length));
            digit_b <= STD_LOGIC_VECTOR(TO_UNSIGNED(5, digit_b'length));
            wait for 1ps;
            b1 <= '1';
            wait for 1ps;
            b1 <= '0';
 
            digit_a <= STD_LOGIC_VECTOR(TO_UNSIGNED(3, digit_a'length));
            digit_b <= STD_LOGIC_VECTOR(TO_UNSIGNED(3, digit_b'length));
            wait for 1ps;
            b2 <= '1';
            wait for 1ps;
            b2 <= '0';

        --end loop;
    end process;

end Behavioral;
