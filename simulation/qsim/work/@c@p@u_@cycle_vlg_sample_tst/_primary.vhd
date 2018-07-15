library verilog;
use verilog.vl_types.all;
entity CPU_Cycle_vlg_sample_tst is
    port(
        Reset           : in     vl_logic;
        Set_DST         : in     vl_logic;
        Set_EXC         : in     vl_logic;
        Set_FI          : in     vl_logic;
        Set_INT         : in     vl_logic;
        Set_SRC         : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_Cycle_vlg_sample_tst;
