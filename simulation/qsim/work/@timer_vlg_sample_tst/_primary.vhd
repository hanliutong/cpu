library verilog;
use verilog.vl_types.all;
entity Timer_vlg_sample_tst is
    port(
        Crystal         : in     vl_logic;
        HALT            : in     vl_logic;
        Set0            : in     vl_logic;
        Set_DST         : in     vl_logic;
        Set_EXC         : in     vl_logic;
        Set_Fi          : in     vl_logic;
        Set_INT         : in     vl_logic;
        Set_SRC         : in     vl_logic;
        Start_Re        : in     vl_logic;
        Tplus1          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Timer_vlg_sample_tst;
