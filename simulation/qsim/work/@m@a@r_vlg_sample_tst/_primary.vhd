library verilog;
use verilog.vl_types.all;
entity MAR_vlg_sample_tst is
    port(
        D               : in     vl_logic_vector(15 downto 0);
        IBUS_MAR        : in     vl_logic;
        MAR_ABUS        : in     vl_logic;
        MAR_IBUS        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MAR_vlg_sample_tst;
