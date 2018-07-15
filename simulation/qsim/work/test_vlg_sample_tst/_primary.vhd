library verilog;
use verilog.vl_types.all;
entity test_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(15 downto 1);
        data            : in     vl_logic_vector(7 downto 0);
        inclock         : in     vl_logic;
        outclock        : in     vl_logic;
        we              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end test_vlg_sample_tst;
