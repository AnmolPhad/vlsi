----------------------------------------------------------------------------------
-- Company       : Logsun Systems,Pune
-- Engineer      : Yogesh Gunjal
-- Create Date   : 18/4/2018 
-- Design Name   : Keypad + 7 Segment Display
-- Module Name   : keypad - Behavioral 
-- Project Name  : Keypad interfacing with FPGA board
-- Target Devices: Spartance-6 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
entity Segment is
    Port ( clk 	: in  STD_LOGIC;
           rst 	: in  STD_LOGIC;
			  digit 	: out STD_LOGIC_VECTOR (3 downto 0);
           display: out STD_LOGIC_VECTOR (7 downto 0));
end Segment;
----------------------------------------------------------------------------------
architecture Behavioral of Segment is
SIGNAL state : integer range 1 to 16:=1 ;
SIGNAL data:STD_LOGIC_VECTOR (7 downto 0);
SIGNAL clock:STD_LOGIC;
begin
----------------------------------------------------------------------------------
---------Process for clock divide by 10-------------------------------------------
----------------------------------------------------------------------------------
Process(clk,rst)
variable temp:integer range 1 to 99999999;
begin
if(rst='0') then
temp:=1;
elsif(rising_edge(clk)) then
temp:=temp+1;
if(temp=9999999) then
clock<= not clock;
temp:=1;
end if;
end if;
end process;
---------------------------------------------------------------------------------
--------Process for Keypad scan & Display----------------------------------------
---------------------------------------------------------------------------------
process(clock,rst)
begin
if (rst='0') then
state<=1;
data<=x"00";
digit<="1111";
elsif rising_edge (clock) then
	case state is
	when 1  => data<= x"C0";state<=2;  -----------0
	when 2  => data<= x"F9";state<=3;  -----------1 
	when 3  => data<= x"A4";state<=4;  -----------2 	
	when 4  => data<= x"B0";state<=5;  -----------3 
	when 5  => data<= x"99";state<=6;  -----------4
	when 6  => data<= x"92";state<=7;  -----------5 
	when 7  => data<= x"82";state<=8;  -----------6 	
	when 8  => data<= x"F8";state<=9;  -----------7
	when 9  => data<= x"80";state<=10; -----------8
	when 10 => data<= x"90";state<=11; -----------9
	when 11 => data<= x"88";state<=12; -----------A	
	when 12 => data<= x"83";state<=13; -----------B
	when 13 => data<= x"C6";state<=14; -----------C
	when 14 => data<= x"A1";state<=15; -----------D
	when 15 => data<= x"86";state<=16; -----------E
	when 16 => data<= x"8E";state<=1;  -----------F	
	when others=>data<=x"FF";
	end case;
end if;
end process;
display<=data;
end Behavioral;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
