module beat_Cycle(clk, Tpuls1,Reset,T);
input clk, Tpuls1, Reset;
output reg [7:0]T = 0000_0001;
always @ (negedge clk)
begin
	if (Reset)
	T <= 8'b0000_0001;
	else if (Tpuls1)
	begin
	T <= {T[6:0],1'b0};
	end
	else
	T <= T;
end
endmodule
