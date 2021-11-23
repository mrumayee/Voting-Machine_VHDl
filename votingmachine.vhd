library IEEE;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity votingmachine is
Port ( clock : in STD_LOGIC;
reset : in STD_LOGIC;
party1 : in STD_LOGIC;
party2 : in STD_LOGIC;
party3 : in STD_LOGIC;
selectparty : in STD_LOGIC;
countofparty1 : out STD_LOGIC_VECTOR (2 downto 0);
countofparty2 : out STD_LOGIC_VECTOR (2 downto 0);
countofparty3 : out STD_LOGIC_VECTOR (2 downto 0)
);
end votingmachine;


architecture votingmachine of votingmachine is

signal count1,count2,count3:STD_LOGIC_VECTOR (2 downto 0);
signal status :STD_LOGIC_VECTOR (2 downto 0);
constant initial :STD_LOGIC_VECTOR (2 downto 0):="001";
constant check :STD_LOGIC_VECTOR (2 downto 0):="010";
constant party1_status :STD_LOGIC_VECTOR (2 downto 0):="011";
constant party2_status :STD_LOGIC_VECTOR (2 downto 0):="100";
constant party3_status :STD_LOGIC_VECTOR (2 downto 0):="101";
constant done :STD_LOGIC_VECTOR (2 downto 0):="110";

begin
process(clock,reset,party1,party2,party3)
begin
if(reset='1') then
count1<=(others=>'0');
count2<=(others=>'0');
count3<=(others=>'0');
status<=initial;
else
if(rising_edge(clock)and reset='0') then
case status is
when initial=>
---Now lets check which party button has been pressed.
if(party1='1' or party2='1' or party3='1') then
status<=check;
else
status<=initial;
end if;
when check =>
--Whichever party button has been pressed we will go and check its status
if(party1='1') then status<=party1_status;
elsif(party2='1') then status<=party2_status;
elsif(party3='1') then status<=party3_status;
else
status<=check;
end if;
---Now for whichever party the button is pressed we will increment its count and then will make its status done
---while the other partystatus will remain as before
when party1_status =>
--Next state logic
if (selectparty ='1') then
status<=done;
count1<=count1+'1';
else
status<=party1_status;
end if;
when party2_status =>
--Next state logic
if (selectparty ='1') then
status<=done;
count2<=count2+'1';
else
status<=party2_status;
end if;
when party3_status =>
--Next state logic
if (selectparty ='1') then
status<=done;
count3<=count3+'1';
else
status<=party3_status;
end if;
---After incrementing the count the status of the party is done and done redirects to initial to ask for next inputs.
when done => status<=initial;
when others=>status<=initial;
end case;
end if;
end if;
end process;
---After all the process the count of each party is send to their respective party
countofparty1<=count1;
countofparty2<=count2;
countofparty3<=count3;
end votingmachine;
