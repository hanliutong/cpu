library verilog;
use verilog.vl_types.all;
entity CPU_Cycle_vlg_check_tst is
    port(
        DST             : in     vl_logic;
        EXC             : in     vl_logic;
        FI              : in     vl_logic;
        INT             : in     vl_logic;
        SRC             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CPU_Cycle_vlg_check_tst;
