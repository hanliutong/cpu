library verilog;
use verilog.vl_types.all;
entity MAR_vlg_check_tst is
    port(
        ABUS_OUT        : in     vl_logic_vector(15 downto 0);
        IBUS_OUT        : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end MAR_vlg_check_tst;
