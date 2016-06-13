-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
	
entity Generator is

	port(
		clk		 			: in	std_logic;
		inputBinaryLevel	: in	std_logic_vector(9 downto 0);
		
		outputLED1 			: out	std_logic_vector(6 downto 0);
		outputLED2 			: out	std_logic_vector(6 downto 0);
		outputLED3 			: out	std_logic_vector(6 downto 0);
		outputLED4 			: out	std_logic_vector(6 downto 0);
		outputLED5 			: out	std_logic_vector(6 downto 0);
		outputLED6 			: out	std_logic_vector(6 downto 0);
		outputSignal	: out	std_logic;
		periodEnd		: out	std_logic
	);

end entity;

architecture GeneratorMainBlockArc of Generator is

------------------------Components declaration-------------------------------
component ComponentGenerator
port
(
	clk		 			: in	std_logic;
	inputBinaryLevel	: in	std_logic_vector(9 downto 0);
	
	outputLED1	 	: out	std_logic_vector(3 downto 0);
	outputLED2	 	: out	std_logic_vector(3 downto 0);
	outputLED3	 	: out	std_logic_vector(3 downto 0);
	outputLED4		: out	std_logic_vector(3 downto 0);
	outputLED5	 	: out	std_logic_vector(3 downto 0);
	outputLED6	 	: out	std_logic_vector(3 downto 0);
	outputSignal	: out	std_logic;
	periodEnd		: out	std_logic
);
end component;

component NumLEDIndicator
port
(
	num :		in std_logic_vector(3 downto 0);
	outputBinaryNum: out std_logic_vector(6 downto 0)
);
end component;

signal num_1, num_2, num_3, num_4, num_5, num_6 : std_logic_vector(3 downto 0);

begin
	
	GEN: ComponentGenerator
	port map (clk, inputBinaryLevel, num_1, num_2, num_3, num_4, num_5, num_6, outputSignal, periodEnd);
	
	LED1: NumLEDIndicator
	port map (num_1, outputLED1);
	
	LED2: NumLEDIndicator
	port map (num_2, outputLED2);
	
	LED3: NumLEDIndicator
	port map (num_3, outputLED3);
	
	LED4: NumLEDIndicator
	port map (num_4, outputLED4);
	
	LED5: NumLEDIndicator
	port map (num_5, outputLED5);
	
	LED6: NumLEDIndicator
	port map (num_6, outputLED6);

end GeneratorMainBlockArc;





























