library verilog;
use verilog.vl_types.all;
entity CU_Timer_vlg_sample_tst is
    port(
        Cy              : in     vl_logic;
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CU_Timer_vlg_sample_tst;
