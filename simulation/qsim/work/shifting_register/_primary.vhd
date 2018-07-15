library verilog;
use verilog.vl_types.all;
entity shifting_register is
    port(
        clk             : in     vl_logic;
        DL              : in     vl_logic_vector(7 downto 0);
        DH              : in     vl_logic_vector(7 downto 0);
        CNT             : in     vl_logic_vector(7 downto 0);
        CL              : in     vl_logic_vector(7 downto 0);
        SHL             : in     vl_logic;
        SHR             : in     vl_logic;
        SAL             : in     vl_logic;
        SAR             : in     vl_logic;
        \ROL\           : in     vl_logic;
        \ROR\           : in     vl_logic;
        RCL             : in     vl_logic;
        RCR             : in     vl_logic;
        CF0             : in     vl_logic;
        WB              : in     vl_logic;
        QL              : out    vl_logic_vector(7 downto 0);
        QH              : out    vl_logic_vector(7 downto 0);
        CF              : out    vl_logic
    );
end shifting_register;
