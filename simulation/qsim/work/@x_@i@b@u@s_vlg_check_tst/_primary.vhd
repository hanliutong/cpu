library verilog;
use verilog.vl_types.all;
entity X_IBUS_vlg_check_tst is
    port(
        Dout            : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end X_IBUS_vlg_check_tst;
