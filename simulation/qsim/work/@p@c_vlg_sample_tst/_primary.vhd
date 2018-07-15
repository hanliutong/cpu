library verilog;
use verilog.vl_types.all;
entity PC_vlg_sample_tst is
    port(
        IBUS            : in     vl_logic_vector(15 downto 0);
        IBUS_PC         : in     vl_logic;
        PC_IBUS         : in     vl_logic;
        PCplus1         : in     vl_logic;
        zero_PC         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PC_vlg_sample_tst;
