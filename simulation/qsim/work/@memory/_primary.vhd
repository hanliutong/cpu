library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        DBUS_OUT        : out    vl_logic_vector(15 downto 0);
        MRD             : in     vl_logic;
        clk             : in     vl_logic;
        ABUS            : in     vl_logic_vector(15 downto 0);
        MWR             : in     vl_logic;
        DBUS            : in     vl_logic_vector(15 downto 0);
        W_B             : in     vl_logic
    );
end Memory;
