library verilog;
use verilog.vl_types.all;
entity Generator is
    port(
        clk             : in     vl_logic;
        inputBinaryLevel: in     vl_logic_vector(9 downto 0);
        outputLED1      : out    vl_logic_vector(6 downto 0);
        outputLED2      : out    vl_logic_vector(6 downto 0);
        outputLED3      : out    vl_logic_vector(6 downto 0);
        outputLED4      : out    vl_logic_vector(6 downto 0);
        outputLED5      : out    vl_logic_vector(6 downto 0);
        outputLED6      : out    vl_logic_vector(6 downto 0);
        outputSignal    : out    vl_logic
    );
end Generator;
