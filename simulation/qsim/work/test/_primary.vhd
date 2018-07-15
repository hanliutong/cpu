library verilog;
use verilog.vl_types.all;
entity test is
    port(
        q               : out    vl_logic_vector(7 downto 0);
        inclock         : in     vl_logic;
        we              : in     vl_logic;
        outclock        : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 1);
        data            : in     vl_logic_vector(7 downto 0)
    );
end test;
