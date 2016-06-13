library verilog;
use verilog.vl_types.all;
entity Generator_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        inputBinaryLevel: in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end Generator_vlg_sample_tst;
