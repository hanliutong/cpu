library verilog;
use verilog.vl_types.all;
entity CLK_maker is
    port(
        Crystal         : in     vl_logic;
        HALT            : in     vl_logic;
        Start_Reset     : in     vl_logic;
        clk             : out    vl_logic
    );
end CLK_maker;
