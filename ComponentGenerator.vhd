library ieee;
use ieee.std_logic_1164.all;


-------------------------------Generator entity-------------------------
	entity ComponentGenerator is

		port(
			clk		 			: in	std_logic;
			inputBinaryLevel	: in	std_logic_vector(9 downto 0);
			increment 			: in	std_logic;
			decrement 			: in	std_logic;
			
			outputLED1	 	: out	std_logic_vector(3 downto 0);
			outputLED2	 	: out	std_logic_vector(3 downto 0);
			outputLED3	 	: out	std_logic_vector(3 downto 0);
			outputLED4		: out	std_logic_vector(3 downto 0);
			outputLED5	 	: out	std_logic_vector(3 downto 0);
			outputLED6	 	: out	std_logic_vector(3 downto 0);
			outputSignal	: out	std_logic;
			periodEnd		: out	std_logic
		);

	end entity;
	
-------------------------------WidePulseGenerator architecture-------------------------
	architecture WidePulseGenerator of ComponentGenerator is
	
	-- Function for convert std_logic_vector to integer value	
	function Vector10ToInt(signal bitVector: in std_logic_vector(9 downto 0)) return integer is
		variable i : integer := 0;
		variable pow : integer := 1;
		variable result : integer := 0;
	begin
		for i in 0 to 9 loop
			if( bitVector(i) = '1' ) then
				result := result + pow;
			end if;
			pow := pow * 2;
		end loop;
			
		return result;
	end Vector10ToInt;
	
	-- Function for convert integer value to std_logic_vector
	function IntToVector4(inIntValue : in integer) return std_logic_vector is
		variable i : integer := 0;
		variable intValue : integer;
		variable result : std_logic_vector(3 downto 0);
	begin
		intValue := inIntValue;
		for i in 0 to 3 loop
			if ((intValue REM 2) = 1) then
				result(i) := '1';
			else
				result(i) := '0';
			end if;
			intValue := intValue / 2;
		end loop;
		
		return result;
	end IntToVector4;
	
	-- Function for convert std_logic_vector to integer value	
	function GetValueDigit(inValue, position: in integer) return integer is
		variable i : integer := 0;
		variable result : integer := 0;
	begin
		result := inValue;
		result := result / 10**(position-1);
		result := result REM 10;
		
		return result;
	end GetValueDigit;

	-- Procentage of pulse fill	
	shared variable iterator : integer := 0;
	shared variable inputLevel : integer := 0;
	shared variable inputLevelBuffer : integer := 0;
	shared variable fillProcentage : integer := 0;
		
	begin
		process (clk)
		variable levelCounter : integer := 0;
		begin
			if (rising_edge(clk)) then
				if(iterator < 1000) then
					iterator := iterator + 1;
				else
					iterator := 0;
					
					if(levelCounter < 1024) then
						levelCounter := levelCounter + 1;
						periodEnd <= '0';
					else
						inputLevel := inputLevelBuffer;
						levelCounter := 0;
						periodEnd <= '1';
					end if;
					
					if(levelCounter >= inputLevel) then
						outputSignal <= '0';
						outputLED1 <= "1111";
						outputLED2 <= "1111";
						outputLED3 <= "1111";
						outputLED4 <= "1111";
						outputLED5 <= "1111";
						outputLED6 <= "1111";
					else
						outputSignal <= '1';
						outputLED1 <= IntToVector4(GetValueDigit(fillProcentage, 1));
						outputLED2 <= IntToVector4(GetValueDigit(fillProcentage, 2));
						outputLED3 <= IntToVector4(GetValueDigit(fillProcentage, 3));
						outputLED4 <= IntToVector4(GetValueDigit(fillProcentage, 4));
						outputLED5 <= IntToVector4(GetValueDigit(fillProcentage, 5));
						outputLED6 <= IntToVector4(GetValueDigit(fillProcentage, 6));
					end if;
				end if;
			end if;
		end process;
		
		process (inputBinaryLevel)
		begin
			inputLevelBuffer := Vector10ToInt(inputBinaryLevel);
			fillProcentage := inputLevelBuffer * 100 / 1023;
		end process;
		
	end WidePulseGenerator;