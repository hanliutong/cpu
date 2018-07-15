library verilog;
use verilog.vl_types.all;
entity Memory_vlg_check_tst is
    port(
        DBUS_OUT        : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Memory_vlg_check_tst;
