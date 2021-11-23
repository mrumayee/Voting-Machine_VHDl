LIBRARY ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY votingmachine_tb IS
END votingmachine_tb;
ARCHITECTURE votingmachine_arch OF votingmachine_tb IS
-- constants
-- signals
SIGNAL clock : STD_LOGIC;
SIGNAL countofparty1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL countofparty2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL countofparty3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL party1 : STD_LOGIC;
SIGNAL party2 : STD_LOGIC;
SIGNAL party3 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL selectparty : STD_LOGIC;
-- Clock period definitions
constant clk_period : time := 20 ns;
COMPONENT votingmachine
PORT (
clock : IN STD_LOGIC;
countofparty1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
countofparty2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
countofparty3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
party1 : IN STD_LOGIC;
party2 : IN STD_LOGIC;
party3 : IN STD_LOGIC;
reset : IN STD_LOGIC;
selectparty : IN STD_LOGIC
);
END COMPONENT;
BEGIN
i1 : votingmachine
PORT MAP (
-- list connections between master ports and signals
clock => clock,
countofparty1 => countofparty1,
countofparty2 => countofparty2,
countofparty3 => countofparty3,
party1 => party1,
party2 => party2,
party3 => party3,
reset => reset,
selectparty => selectparty
);
--Clock process definitions
clock_process :process
begin
clock <= '0';
wait for clk_period/2;
clock <= '1';
wait for clk_period/2;
end process clock_process;
init : PROCESS
-- variable declarations
BEGIN
-- code that executes only once
reset<='1';
party1<='0';
party2<='0';
party3<='0';
selectparty<='0';wait for 10 ns;
reset <='0'; wait for 10 ns;
party1<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party1<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party2<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party2<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party3<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party3<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party1<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party1<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party1<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party1<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party2<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party2<='0'; wait for 20 ns;
selectparty<='0';wait for 20 ns;
party3<='1'; wait for 20 ns;
selectparty<='1';wait for 20 ns;
party3<='0'; wait for 20 ns;
wait for 40 ns;
END PROCESS init;
END votingmachine_arch;

