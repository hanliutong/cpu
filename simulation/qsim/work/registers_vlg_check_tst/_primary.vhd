library verilog;
use verilog.vl_types.all;
entity registers_vlg_check_tst is
    port(
        Rout            : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end registers_vlg_check_tst;
