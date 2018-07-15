library verilog;
use verilog.vl_types.all;
entity Memory_vlg_sample_tst is
    port(
        ABUS            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        DBUS            : in     vl_logic_vector(15 downto 0);
        MRD             : in     vl_logic;
        MWR             : in     vl_logic;
        W_B             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Memory_vlg_sample_tst;
