library verilog;
use verilog.vl_types.all;
entity CPU_Cycle is
    port(
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        Set_FI          : in     vl_logic;
        Set_DST         : in     vl_logic;
        Set_SRC         : in     vl_logic;
        Set_EXC         : in     vl_logic;
        Set_INT         : in     vl_logic;
        FI              : out    vl_logic;
        DST             : out    vl_logic;
        SRC             : out    vl_logic;
        EXC             : out    vl_logic;
        INT             : out    vl_logic
    );
end CPU_Cycle;
