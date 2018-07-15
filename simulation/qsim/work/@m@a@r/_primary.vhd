library verilog;
use verilog.vl_types.all;
entity MAR is
    port(
        ABUS_OUT        : out    vl_logic_vector(15 downto 0);
        D               : in     vl_logic_vector(15 downto 0);
        IBUS_MAR        : in     vl_logic;
        MAR_ABUS        : in     vl_logic;
        IBUS_OUT        : out    vl_logic_vector(15 downto 0);
        MAR_IBUS        : in     vl_logic
    );
end MAR;
