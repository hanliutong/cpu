library verilog;
use verilog.vl_types.all;
entity MyCPU_vlg_sample_tst is
    port(
        Crystal         : in     vl_logic;
        Start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MyCPU_vlg_sample_tst;
