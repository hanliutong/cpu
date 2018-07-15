library verilog;
use verilog.vl_types.all;
entity CU_Timer_vlg_check_tst is
    port(
        BUS_MDR         : in     vl_logic;
        clk             : in     vl_logic;
        cnt             : in     vl_logic_vector(3 downto 0);
        DST             : in     vl_logic;
        FI              : in     vl_logic;
        I_DBUS          : in     vl_logic;
        IBUS_IR         : in     vl_logic;
        IBUS_MAR        : in     vl_logic;
        IBUS_PC         : in     vl_logic;
        M_clk           : in     vl_logic;
        MAR_ABUS        : in     vl_logic;
        MAR_IBUS        : in     vl_logic;
        MDR_DBUS        : in     vl_logic;
        MDR_IBUS        : in     vl_logic;
        MRD             : in     vl_logic;
        MWR             : in     vl_logic;
        PC_IBUS         : in     vl_logic;
        PCplus1         : in     vl_logic;
        setTp1          : in     vl_logic;
        T               : in     vl_logic_vector(7 downto 0);
        temp            : in     vl_logic_vector(47 downto 0);
        W_B             : in     vl_logic;
        zero_PC         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CU_Timer_vlg_check_tst;
