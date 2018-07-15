library verilog;
use verilog.vl_types.all;
entity Timer_vlg_check_tst is
    port(
        CLK             : in     vl_logic;
        DST             : in     vl_logic;
        EXC             : in     vl_logic;
        FI              : in     vl_logic;
        INT             : in     vl_logic;
        SRC             : in     vl_logic;
        T               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Timer_vlg_check_tst;
