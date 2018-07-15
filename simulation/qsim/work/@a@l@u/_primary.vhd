library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        PF              : out    vl_logic;
        RB              : in     vl_logic_vector(15 downto 0);
        RA              : in     vl_logic_vector(15 downto 0);
        ADDC            : in     vl_logic;
        SUBC            : in     vl_logic;
        ANDC            : in     vl_logic;
        ORC             : in     vl_logic;
        XORC            : in     vl_logic;
        NOTC            : in     vl_logic;
        INCAC           : in     vl_logic;
        DECAC           : in     vl_logic;
        ZF              : out    vl_logic;
        W_B             : in     vl_logic;
        SF              : out    vl_logic;
        CF              : out    vl_logic;
        DOUT            : out    vl_logic_vector(15 downto 0);
        MULTC           : in     vl_logic
    );
end ALU;
