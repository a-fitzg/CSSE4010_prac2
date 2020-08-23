----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.08.2020 15:05:01
-- Design Name: 
-- Module Name: test_register_simple - Behavioral
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

entity test_register_simple is
--  Port ( );
end test_register_simple;

architecture Behavioral of test_register_simple is

    component register_simple port (
        rst: in std_logic;
        dir: in std_logic; 
		en: in std_logic ;   
        clk : in std_logic;
        reg_in : in std_logic_vector(3 downto 0); 
        reg_out : out std_logic_vector(3 downto 0);
        -- Unused
        reg_out_p : out std_logic_vector(3 downto 0);
		regSL : inout std_logic_vector(3 downto 0);		      -- \
		regSR : inout std_logic_vector(3 downto 0);           --  |
		regSLa : inout std_logic_vector(3 downto 0);		  --  } inout allow writing and reading this signal from within the architecture
		regSRa : inout std_logic_vector(3 downto 0);          --  |
		regSdir : inout std_logic_vector(3 downto 0);         -- /
		reg_out1 : out std_logic_vector(3 downto 0); 
		reg_out2 : out std_logic_vector(3 downto 0)); 
    end component;
    
    signal rst : STD_LOGIC;
    signal dir : STD_LOGIC;
    signal en  : STD_LOGIC;
    signal clk : STD_LOGIC;
    signal reg_in : STD_LOGIC_VECTOR (3 downto 0);
    signal reg_out : STD_LOGIC_VECTOR (3 downto 0);

begin

    r1 : register_simple port map (
        rst       => rst,
        clk       => clk,
        dir       => '0',
        en        => '0',
        reg_in    => reg_in,
        reg_out   => reg_out);

    input_gen : process
    begin
        rst <= '0';
        clk <= '0';
        for i in 0 to 7 loop
            reg_in <= STD_LOGIC_VECTOR(TO_UNSIGNED((i * 2), reg_in'length));
            wait for 2ps;
            reg_in <= STD_LOGIC_VECTOR(TO_UNSIGNED((i * 2) + 1, reg_in'length));
            wait for 1ps;
            clk <= '1';
            wait for 1ps;
            clk <= '0';
        end loop;
    end process;
end Behavioral;
