library verilog;
use verilog.vl_types.all;
entity shifting_register_vlg_check_tst is
    port(
        CF              : in     vl_logic;
        QH              : in     vl_logic_vector(7 downto 0);
        QL              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end shifting_register_vlg_check_tst;
