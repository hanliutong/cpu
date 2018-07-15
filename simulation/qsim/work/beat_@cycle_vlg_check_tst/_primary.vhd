library verilog;
use verilog.vl_types.all;
entity beat_Cycle_vlg_check_tst is
    port(
        T               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end beat_Cycle_vlg_check_tst;
