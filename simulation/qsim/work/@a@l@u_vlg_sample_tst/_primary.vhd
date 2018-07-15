library verilog;
use verilog.vl_types.all;
entity ALU_vlg_sample_tst is
    port(
        ADDC            : in     vl_logic;
        ANDC            : in     vl_logic;
        DECAC           : in     vl_logic;
        INCAC           : in     vl_logic;
        MULTC           : in     vl_logic;
        NOTC            : in     vl_logic;
        ORC             : in     vl_logic;
        RA              : in     vl_logic_vector(15 downto 0);
        RB              : in     vl_logic_vector(15 downto 0);
        SUBC            : in     vl_logic;
        W_B             : in     vl_logic;
        XORC            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ALU_vlg_sample_tst;
