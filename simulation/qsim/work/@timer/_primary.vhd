library verilog;
use verilog.vl_types.all;
entity Timer is
    port(
        FI              : out    vl_logic;
        Crystal         : in     vl_logic;
        Start_Re        : in     vl_logic;
        HALT            : in     vl_logic;
        Set_Fi          : in     vl_logic;
        Set_DST         : in     vl_logic;
        Set_SRC         : in     vl_logic;
        Set_EXC         : in     vl_logic;
        Set_INT         : in     vl_logic;
        DST             : out    vl_logic;
        SRC             : out    vl_logic;
        EXC             : out    vl_logic;
        INT             : out    vl_logic;
        CLK             : out    vl_logic;
        T               : out    vl_logic_vector(7 downto 0);
        Tplus1          : in     vl_logic;
        Set0            : in     vl_logic
    );
end Timer;
