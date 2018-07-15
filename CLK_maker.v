module CLK_maker(Crystal,HALT,Start_Reset,clk);
input Crystal,HALT,Start_Reset;
output clk;
reg Available_mark = 0;


always @ (posedge Start_Reset or posedge HALT)
begin
	if (HALT)
	begin
		Available_mark = 0;
	end

	else if (Start_Reset)
	begin
		Available_mark = 1;
	end
end
assign clk = Available_mark && Crystal && !Start_Reset;
endmodule
