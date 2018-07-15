library verilog;
use verilog.vl_types.all;
entity shifting_register_vlg_sample_tst is
    port(
        CF0             : in     vl_logic;
        CL              : in     vl_logic_vector(7 downto 0);
        CNT             : in     vl_logic_vector(7 downto 0);
        DH              : in     vl_logic_vector(7 downto 0);
        DL              : in     vl_logic_vector(7 downto 0);
        RCL             : in     vl_logic;
        RCR             : in     vl_logic;
        \ROL\           : in     vl_logic;
        \ROR\           : in     vl_logic;
        SAL             : in     vl_logic;
        SAR             : in     vl_logic;
        SHL             : in     vl_logic;
        SHR             : in     vl_logic;
        WB              : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end shifting_register_vlg_sample_tst;
