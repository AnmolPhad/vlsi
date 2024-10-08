----------------------------------------------------------------------------------
-- Company			: Logsun Systems,Pune
-- Engineer			: YOGESH GUNJAL
-- Create Date		: 11:30:53 21/04/2018 
-- Design Name		: ADC0804
-- Module Name		: ADC - Behavioral 
-- Project Name	: Interfacin of ADC0804 with FPGA board
-- Target Devices	: XC6SLX9 
-- Connection		: J2-J2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADC is
    Port ( clk  : in  STD_LOGIC;
           rst  : in  STD_LOGIC;
           WR   : out  STD_LOGIC:='1';
           RD   : out  STD_LOGIC:='1';
			  CS   : out  STD_LOGIC:='1';
           INTR : in  STD_LOGIC);
end ADC;

architecture Behavioral of ADC is
signal clock: std_logic:='0';
type state is (run,done,check);
signal status:state;
begin
----------------------------------------------------------------------------------
-----------------Process for clock divid by 5000----------------------------------

Process(clk,rst)
	variable Temp: integer range 1 to 10000;
begin
	
if(rst='0') then 
			Temp:=1;
			clock<='0';
elsif(rising_edge(clk)) then
			Temp:=Temp+1;
if(Temp=10000) then
			Temp:=1;
			clock<= not clock;			
	end if;
	end if;
end Process;

----------------------------------------------------------------------------------
----------------------Process for ADC(0804) conversion----------------------------

Process(rst,clock,INTR)
begin
if(rst='0') then
			RD<='1';
			WR<='1';
			CS<='1';
elsif(rising_edge(clock)) then
			status<=run;
			WR<='0';
			CS<='0';
case status is
when run =>		RD<='1';
					WR<='0';   			--low to high pulse to start
					WR<='1';
					status<=check;
when check=>   if(INTR='1')then	--check INTR pin to became low
					status<=check;		--indicate end of conversion	
					else
					status<=done;
					end if;
when done =>  	RD<='0';				--high to low pulse for reading the data from ADC
					status<=run;		--Repeat the process
end case;
end if;
end Process;
end Behavioral;
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------