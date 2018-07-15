library verilog;
use verilog.vl_types.all;
entity CU_Timer is
    port(
        IBUS_PC         : out    vl_logic;
        FI              : out    vl_logic;
        Cy              : in     vl_logic;
        start           : in     vl_logic;
        DST             : out    vl_logic;
        clk             : out    vl_logic;
        T               : out    vl_logic_vector(7 downto 0);
        W_B             : out    vl_logic;
        PCplus1         : out    vl_logic;
        zero_PC         : out    vl_logic;
        PC_IBUS         : out    vl_logic;
        IBUS_IR         : out    vl_logic;
        IBUS_MAR        : out    vl_logic;
        MAR_ABUS        : out    vl_logic;
        MAR_IBUS        : out    vl_logic;
        BUS_MDR         : out    vl_logic;
        I_DBUS          : out    vl_logic;
        MDR_DBUS        : out    vl_logic;
        MDR_IBUS        : out    vl_logic;
        MRD             : out    vl_logic;
        MWR             : out    vl_logic;
        M_clk           : out    vl_logic;
        setTp1          : out    vl_logic;
        cnt             : out    vl_logic_vector(3 downto 0);
        temp            : out    vl_logic_vector(47 downto 0)
    );
end CU_Timer;
