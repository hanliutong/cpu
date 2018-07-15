library verilog;
use verilog.vl_types.all;
entity X_IBUS is
    port(
        Dout            : out    vl_logic_vector(15 downto 0);
        DIn             : in     vl_logic_vector(15 downto 0);
        BUS_X           : in     vl_logic;
        X_IBUS          : in     vl_logic
    );
end X_IBUS;
