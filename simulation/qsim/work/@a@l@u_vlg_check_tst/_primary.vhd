library verilog;
use verilog.vl_types.all;
entity ALU_vlg_check_tst is
    port(
        CF              : in     vl_logic;
        DOUT            : in     vl_logic_vector(15 downto 0);
        PF              : in     vl_logic;
        SF              : in     vl_logic;
        ZF              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ALU_vlg_check_tst;
