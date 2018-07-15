library verilog;
use verilog.vl_types.all;
entity MY_REG_vlg_check_tst is
    port(
        Rout            : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end MY_REG_vlg_check_tst;
