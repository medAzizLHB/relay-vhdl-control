--The ULN2803 contain eight input and output which is operated by 5v supply. 
--Here only four pins are needed to make a connection between FPGA and relay. 
--The ULN2803 IC is used to drive the both relay with individual electrical pulse. 
--The relay ON and OFF are shown by the LEDs. 
--PTB connectors have been used to connect load. 
--The voltage range specification has been given on the relay in which voltage it can be operated. 
--The load should be within specification of voltage range of the relay. 
--Otherwise the relay as well as FPGA will be damaged.

--------------------------------------------------------------------------------VHDL Code description---------------------------------------------------------------------------
--This code has been written as to enable the relay simultaneously. 
--The FPGA is operated by 50 MHz and the time is in terms of ns. 
--The time should be converted into in terms of second to enable the relay. 
--So that loop is created for one second. 
--Therefore two relay is operated simultaneously with one second time delay.
---------medAzizLHB---------@SkorpTech--------------------------

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

 

entity relay is

port ( clock : in std_logic;

       a     : out std_logic

               );

end relay;

 

architecture Behavioral of relay is

begin

process(clock)

variable i : integer := 0;

begin

if clock'event and clock = '1' then

if i <= 50000000 then

i := i + 1;

a <= '1';

elsif i > 50000000 and i < 100000000 then

i := i + 1;

a <= '0';

elsif i = 100000000 then

i := 0; 

end if;

end if;

end process;

end Behavioral;