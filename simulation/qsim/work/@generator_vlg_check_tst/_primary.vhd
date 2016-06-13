library verilog;
use verilog.vl_types.all;
entity Generator_vlg_check_tst is
    port(
        outputLED1      : in     vl_logic_vector(6 downto 0);
        outputLED2      : in     vl_logic_vector(6 downto 0);
        outputLED3      : in     vl_logic_vector(6 downto 0);
        outputLED4      : in     vl_logic_vector(6 downto 0);
        outputLED5      : in     vl_logic_vector(6 downto 0);
        outputLED6      : in     vl_logic_vector(6 downto 0);
        outputSignal    : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Generator_vlg_check_tst;
