library verilog;
use verilog.vl_types.all;
entity CLK_maker_vlg_sample_tst is
    port(
        Crystal         : in     vl_logic;
        HALT            : in     vl_logic;
        Start_Reset     : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CLK_maker_vlg_sample_tst;
