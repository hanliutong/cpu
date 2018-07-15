library verilog;
use verilog.vl_types.all;
entity beat_Cycle is
    port(
        clk             : in     vl_logic;
        Tpuls1          : in     vl_logic;
        Reset           : in     vl_logic;
        T               : out    vl_logic_vector(7 downto 0)
    );
end beat_Cycle;
