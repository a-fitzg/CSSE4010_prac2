----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.08.2020 13:44:57
-- Design Name: 
-- Module Name: output_decoder - Behavioral
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

entity output_decoder is
    Port ( in1    : in  STD_LOGIC_VECTOR (3 downto 0);
           in2    : in  STD_LOGIC_VECTOR (3 downto 0);
           in3    : in  STD_LOGIC_VECTOR (3 downto 0);
           in4    : in  STD_LOGIC_VECTOR (3 downto 0);
           unlock : out STD_LOGIC;
           lock   : out STD_LOGIC);
end output_decoder;

architecture Behavioral of output_decoder is

    -- Unlock code is 0874
    constant check1 : STD_LOGIC_VECTOR(3 downto 0) := x"9";
    constant check2 : STD_LOGIC_VECTOR(3 downto 0) := x"8";
    constant check3 : STD_LOGIC_VECTOR(3 downto 0) := x"7";
    constant check4 : STD_LOGIC_VECTOR(3 downto 0) := x"4";
    
    
begin

    process(in1, in2, in3, in4)
    begin
        if in1 = check1 then
            unlock <= '1';
        else
            unlock <= '0';
        end if;
    end process;

end Behavioral;
