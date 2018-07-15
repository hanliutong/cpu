module M_ctrl(
input W_B,
input [15:0]ABUS,
input [15:0]DBUS,
input [15:0]Q,
output reg [15:0] A_plus,
output reg [15:0] DBUS_,
output reg [15:0] Dout
);

always @(ABUS or W_B)
if (W_B&&ABUS[0])
	begin
	A_plus = ABUS + 1'b1;
	Dout = {DBUS[7:0],DBUS[15:8]};
	end
else 
	begin
	A_plus = ABUS;
	Dout = DBUS;
	end
	
always @(Q or ABUS[0])
if (ABUS[0])
	DBUS_ = {Q[7:0],Q[15:8]};
else DBUS_ = {Q[15:8],Q[7:0]};

endmodule

	