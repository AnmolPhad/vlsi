----------------------------------------------------------------------------------
-- Company: Logsun Systems Pune
-- Engineer: Yogesh Gunjal
-- 
-- Create Date:    11:31:59 04/26/2018 
-- Design Name: 
-- Module Name:    Digital_Logic - Behavioral 
-- Project Name: 	Led and Switches interface with FPGA
-- Target Devices: XC6SLX9-2tqg144
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           e : in  STD_LOGIC;
           f : in  STD_LOGIC;
           g : in  STD_LOGIC;
           h : in  STD_LOGIC;
           i : in  STD_LOGIC;
           j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           l : in  STD_LOGIC;
           m : in  STD_LOGIC;
           n : in  STD_LOGIC;
           o : in  STD_LOGIC;
           p : in  STD_LOGIC;
           out1 : out  STD_LOGIC;
           out2 : out  STD_LOGIC;
           out3 : out  STD_LOGIC;
           out4 : out  STD_LOGIC;
           out5 : out  STD_LOGIC;
           out6 : out  STD_LOGIC;
           out7 : out  STD_LOGIC;
           out8 : out  STD_LOGIC;
           out9 : out  STD_LOGIC;
           out10 : out  STD_LOGIC;
           out11 : out  STD_LOGIC;
           out12 : out  STD_LOGIC;
           out13 : out  STD_LOGIC;
           out14 : out  STD_LOGIC;
           out15 : out  STD_LOGIC;
           out16 : out  STD_LOGIC);
end test;

architecture Behavioral of test is

begin

out1<= a;
out2<= b;
out3<= c;
out4<= d;
out5<= e;
out6<= f;
out7<= g;
out8<= h;
out9<= i;
out10<= j;
out11<= k;
out12<= l;
out13<= m;
out14<= n;
out15<= o;
out16<= p;

end Behavioral;