library verilog;
use verilog.vl_types.all;
entity R_adrr is
    port(
        R_addr          : out    vl_logic_vector(15 downto 0);
        d               : in     vl_logic;
        EXC             : in     vl_logic;
        DST             : in     vl_logic;
        \mod\           : in     vl_logic_vector(1 downto 0);
        \_reg\          : in     vl_logic_vector(2 downto 0);
        r_m             : in     vl_logic_vector(2 downto 0);
        w               : in     vl_logic;
        T               : in     vl_logic_vector(3 downto 0)
    );
end R_adrr;
