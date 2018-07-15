library verilog;
use verilog.vl_types.all;
entity R_adrr_vlg_check_tst is
    port(
        R_addr          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end R_adrr_vlg_check_tst;
