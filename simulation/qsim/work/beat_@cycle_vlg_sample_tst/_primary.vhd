library verilog;
use verilog.vl_types.all;
entity beat_Cycle_vlg_sample_tst is
    port(
        Reset           : in     vl_logic;
        Tpuls1          : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end beat_Cycle_vlg_sample_tst;
