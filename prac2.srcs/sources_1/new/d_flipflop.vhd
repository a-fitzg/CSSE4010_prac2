----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.08.2020 10:25:47
-- Design Name: 
-- Module Name: d_flipflop - Behavioral
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

entity d_flipflop is
    Port ( D    : inout STD_LOGIC;
           CLK  : in STD_LOGIC;
           Q    : out STD_LOGIC;
           QBAR : inout STD_LOGIC);
end d_flipflop;

architecture Behavioral of d_flipflop is
begin
    process(CLK, D)
    begin
        if (CLK 'event and CLK = '1') then
        
--            if (D = '1') then
--                Q <= D;
--                QBAR <= not D;
--            elsif (D = '0') then
--                Q <= '0';
--                QBAR <= '1';
--            end if;

            if (D = '1') then
                Q <= '1';
                QBAR <= '0';
                D <= '0';
            elsif (D = '0') then
                Q <= '0';
                QBAR <= '1';
                D <= '1';
            end if;
                

        end if;
    end process;
end Behavioral;
