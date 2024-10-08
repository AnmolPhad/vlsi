----------------------------------------------------------------------------------
-- Company			: Logsun Systems,Pune
-- Engineer			: YOGESH GUNJAL
-- Create Date		: 21/04/2018 
-- Design Name		: DAC0808
-- Module Name		: dac_main - Behavioral 
-- Project Name	: Interfacing DAC0808 with FPGA.
-- Target Devices	: XC6SLX9
-- Tool versions	: 11.1
-- Description    : Program is used to generate square wave
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity dac_main is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end dac_main;

architecture Behavioral of dac_main is
signal clock: std_logic:='0';
signal DAC : std_logic_vector(7 downto 0):=x"00";
begin
----------------------------------------------------------------------------------
-----------------Process for clock divid by 5000----------------------------------

Process(clk,rst)
	variable Temp: integer range 1 to 5000;
begin
	
	if(rst='0') then 
			Temp:=1;
			clock<='0';
	elsif(rising_edge(clk)) then
			Temp:=Temp+1;
	if(Temp=5000) then
			Temp:=1;
			clock<= not clock;			
	end if;
	end if;
end Process;

Process(clock,rst)
begin
	if(rst='0') then
		DAC<= x"00";
	elsif(rising_edge(clock)) then
		DAC(0)<= not DAC(0);
		DAC(1)<= not DAC(1);
		DAC(2)<= not DAC(2);
		DAC(3)<= not DAC(3);
		DAC(4)<= not DAC(4);	
		DAC(5)<= not DAC(5);
		DAC(6)<= not DAC(6);
		DAC(7)<= not DAC(7);
   end if;
end Process;
Dout<=DAC;
	
end Behavioral;

