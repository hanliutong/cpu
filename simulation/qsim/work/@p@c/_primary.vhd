library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        Dout            : out    vl_logic_vector(15 downto 0);
        zero_PC         : in     vl_logic;
        IBUS_PC         : in     vl_logic;
        PCplus1         : in     vl_logic;
        IBUS            : in     vl_logic_vector(15 downto 0);
        PC_IBUS         : in     vl_logic
    );
end PC;
