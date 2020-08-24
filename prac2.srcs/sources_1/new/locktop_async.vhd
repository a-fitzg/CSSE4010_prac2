----------------------------------------------------------------------------------
-- Company: CSSE4010
-- Engineer: Alexander FitzGerald (45330874)
-- 
-- Create Date: 23.08.2020 11:57:00
-- Design Name: 
-- Module Name: locktop_async - Structural
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

entity locktop_async is
    Port ( digit_a    : in  STD_LOGIC_VECTOR (3 downto 0);
           digit_b    : in  STD_LOGIC_VECTOR (3 downto 0);
           b1         : in  STD_LOGIC;
           b2         : in  STD_LOGIC;
           RST        : in  STD_LOGIC;
           lock       : out STD_LOGIC;
           unlock     : out STD_LOGIC;
           extern_clk : in  STD_LOGIC;
           ssd_select : out STD_LOGIC_VECTOR (3 downto 0);
           ssd_bus    : out STD_LOGIC_VECTOR (6 downto 0));
end locktop_async;

architecture Structural of locktop_async is

    ---------- BUSES ----------

    -- Digit inputs
    signal input1_bus   : STD_LOGIC_VECTOR (3 downto 0);
    signal input2_bus   : STD_LOGIC_VECTOR (3 downto 0);
    signal input3_bus   : STD_LOGIC_VECTOR (3 downto 0);
    signal input4_bus   : STD_LOGIC_VECTOR (3 downto 0);

    -- 1-bit inputs (buttons)
    signal reset_bus    : STD_LOGIC;
    signal b1_bus       : STD_LOGIC;
    signal b2_bus       : STD_LOGIC;

    -- After the registers, the digit saved values are sent to buses
    signal digit1_bus       : STD_LOGIC_VECTOR (3 downto 0);
    signal digit2_bus       : STD_LOGIC_VECTOR (3 downto 0);
    signal digit3_bus       : STD_LOGIC_VECTOR (3 downto 0);
    signal digit4_bus       : STD_LOGIC_VECTOR (3 downto 0);
    
    -- From binary counter, this bus selects the digit to display
    signal digit_select_bus : STD_LOGIC_VECTOR (1 downto 0);
    
    -- From ssd mux, this is the currently selected digit value (before ssd encoding)
    signal digit_bus        : STD_LOGIC_VECTOR (3 downto 0);


    ---------- COMPONENTS ----------

    component register_simple port (
        rst       : in STD_LOGIC;
        dir       : in STD_LOGIC; 
		en        : in STD_LOGIC ;   
        clk       : in STD_LOGIC;
        reg_in    : in STD_LOGIC_VECTOR(3 downto 0); 
        reg_out   : out STD_LOGIC_VECTOR(3 downto 0);  
        -- \/ Ignore \/ 
        reg_out_p : out STD_LOGIC_VECTOR(3 downto 0);
		regSL     : inout STD_LOGIC_VECTOR(3 downto 0);
		regSR     : inout STD_LOGIC_VECTOR(3 downto 0);
		regSLa    : inout STD_LOGIC_VECTOR(3 downto 0);
		regSRa    : inout STD_LOGIC_VECTOR(3 downto 0);
		regSdir   : inout STD_LOGIC_VECTOR(3 downto 0);
		reg_out1  : out STD_LOGIC_VECTOR(3 downto 0); 
		reg_out2  : out STD_LOGIC_VECTOR(3 downto 0));        
    end component;
    
    component output_decoder port ( 
        in1    : in  STD_LOGIC_VECTOR (3 downto 0);
        in2    : in  STD_LOGIC_VECTOR (3 downto 0);
        in3    : in  STD_LOGIC_VECTOR (3 downto 0);
        in4    : in  STD_LOGIC_VECTOR (3 downto 0);
        unlock : out STD_LOGIC;
        lock   : out STD_LOGIC);
    end component;
    
    component binary_counter port (
        RST  : in STD_LOGIC;
        CLK  : in STD_LOGIC;
        X    : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component ssd_mux port (
        in1    : in  STD_LOGIC_VECTOR (3 downto 0);
        in2    : in  STD_LOGIC_VECTOR (3 downto 0);
        in3    : in  STD_LOGIC_VECTOR (3 downto 0);
        in4    : in  STD_LOGIC_VECTOR (3 downto 0);
        S      : in  STD_LOGIC_VECTOR (1 downto 0);
        output : out STD_LOGIC_VECTOR (3 downto 0));
    end component ;
    
    component ssd_decoder port (
        input  : in  STD_LOGIC_VECTOR (3 downto 0);
        output : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component binary_decoder port (
        x  : in  STD_LOGIC_VECTOR (1 downto 0);
        d0 : out STD_LOGIC;
        d1 : out STD_LOGIC;
        d2 : out STD_LOGIC;
        d3 : out STD_LOGIC);
    end component;
    
begin

    input1_bus  <= digit_a;
    input2_bus  <= digit_b;
    input3_bus  <= digit_a;
    input4_bus  <= digit_b;
    b1_bus      <= b1;
    b2_bus      <= b2;
    reset_bus   <= RST;

    r1 : register_simple port map (
        rst       => RST,
        clk       => b1,
        dir       => '0',
        en        => '0',
        reg_in    => input1_bus,
        reg_out   => digit1_bus,
        -- Unused signals, all open
        reg_out_p => open,
        regSL     => open,
        regSR     => open,
        regSLa    => open,
        regSRa    => open,
        regSdir   => open,
        reg_out1  => open,
        reg_out2  => open);

    r2 : register_simple port map (
        rst       => RST,
        clk       => b1,
        dir       => '0',
        en        => '0',
        reg_in    => input2_bus,
        reg_out   => digit2_bus,
        -- Unused signals, all open
        reg_out_p => open,
        regSL     => open,
        regSR     => open,
        regSLa    => open,
        regSRa    => open,
        regSdir   => open,
        reg_out1  => open,
        reg_out2  => open);
        
    r3 : register_simple port map (
        rst       => RST,
        clk       => b2,
        dir       => '0',
        en        => '0',
        reg_in    => input3_bus,
        reg_out   => digit3_bus,
        -- Unused signals, all open
        reg_out_p => open,
        regSL     => open,
        regSR     => open,
        regSLa    => open,
        regSRa    => open,
        regSdir   => open,
        reg_out1  => open,
        reg_out2  => open);

    r4 : register_simple port map (
        rst       => RST,
        clk       => b2,
        dir       => '0',
        en        => '0',
        reg_in    => input4_bus,
        reg_out   => digit4_bus,
        -- Unused signals, all open
        reg_out_p => open,
        regSL     => open,
        regSR     => open,
        regSLa    => open,
        regSRa    => open,
        regSdir   => open,
        reg_out1  => open,
        reg_out2  => open);

    dec : output_decoder port map (
        in1 <= digit1_bus,
        in2 <= digit2_bus,
        in3 <= digit3_bus,
        in4 <= digit4_bus);
        --unlock <= unlock,
        --lock <= lock);

    mux : ssd_mux port map (
        in1    <= digit1_bus,
        in2    <= digit2_bus,
        in3    <= digit3_bus,
        in4    <= digit4_bus,
        S      <= digit_select_bus,
        output <= digit_bus);

    bin_counter: binary_counter port map (
        RST => ,
        CLK => extern_clk,
        X => digit_select_bus);

    

end Structural;
