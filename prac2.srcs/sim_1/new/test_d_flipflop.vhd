----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.08.2020 10:48:21
-- Design Name: 
-- Module Name: test_d_flipflop - Behavioral
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

entity test_d_flipflop is
--  Port ( );
end test_d_flipflop;

architecture Behavioral of test_d_flipflop is

    component d_flipflop port (
           D    : inout STD_LOGIC;
           CLK  : in STD_LOGIC;
           Q    : out STD_LOGIC;
           QBAR : inout STD_LOGIC);
    end component;

    signal D    : STD_LOGIC;
    signal CLK  : STD_LOGIC;
    signal Q    : STD_LOGIC;
    signal QBAR : STD_LOGIC;

begin

    u1 : d_flipflop port map (
        D => D,
        CLK => CLK,
        Q => Q,
        QBAR => QBAR);
        
     input_gen : process
     begin
        D <= '0';

        for I in 1 to 8 loop
        
            CLK <= '1';
            wait for 5ps;
            CLK <= '0';
            wait for 5ps;
            
        end loop;
        wait;
     end process;
    

end Behavioral;
