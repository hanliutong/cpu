library verilog;
use verilog.vl_types.all;
entity X_IBUS_vlg_sample_tst is
    port(
        BUS_X           : in     vl_logic;
        DIn             : in     vl_logic_vector(15 downto 0);
        X_IBUS          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end X_IBUS_vlg_sample_tst;
