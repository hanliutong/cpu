module shifting_register(clk,DL,DH,CNT,CL,SHL,SHR,SAL,SAR,ROL,ROR,RCL,RCR,CF0,WB,QL,QH,CF,count,state);
input clk;//时钟信号
input [7:0]DL;//输入的低八位
input [7:0]DH;//输入的高八位
input [7:0]CNT;//需要移动的位数
input [7:0]CL;//是否需要去寄存器取数（移位次数）
input SHL, SHR, SAL, SAR, ROL, ROR, RCL, RCR, CF0, WB;//移位指令信号与标识寄存器输入信号、字/字节操作信号
output reg [7:0]QL;//移动后的低八位
output reg [7:0]QH;//移动后的高八位
output reg CF;//进位标志CF
output reg [7:0]count;//计数器
output reg [15:0]state;//状态寄存器，存储每次移位的过程
reg [7:0]Num;

always @ (posedge clk) //敏感事件：时钟上升沿到来
begin
	if(CNT>8'b00000001) Num[7:0]<=CL[7:0];
	else if(CNT==8'b00000001) Num[7:0]<=8'b00000001;
	else Num[7:0]<=8'b0;
	if(~WB) begin
		if(count==8'b00000000) begin state[7:0]<=DL[7:0]; CF<=CF0; count <= count + 1; end//如果计数器为0，则把输入的低八位赋给现态，并初始化CF寄存器的值
		else if(count <= Num) begin//移动次数（计数器）小于需要移动的位数（Num）
			count <= count + 1;//移动次数加一（计数器加一）
			case ({SHL, SHR, SAL, SAR, ROL, ROR, RCL, RCR})
			8'b10000000: begin state<={state[6:0],1'b0}; CF<=state[7]; end			//字节逻辑左移
			8'b00100000: begin state<={state[6:0],1'b0}; CF<=state[7]; end			//字节算术左移
			8'b00001000: begin state<={state[6:0],state[7]}; CF<=state[7]; end	//字节循环左移
			8'b00000100: begin state<={state[6:0],CF}; state[0]<=CF; end			//字节带进位的循环左移
			8'b01000000: begin state<={1'b0,state[7:1]}; CF<=state[0]; end			//字节逻辑右移
			8'b00010000: begin state<={state[7],state[7:1]}; CF<=state[0]; end	//字节算术右移
			8'b00000100: begin state<={state[0],state[7:1]}; CF<=state[0]; end	//字节循环右移
			8'b00000001: begin state<={CF,state[7:1]}; CF<=state[0]; end			//字节带进位的循环右移
			default:state[7:0]<=state[7:0];
			endcase
			end
		else//当移动次数等于目标移位位数时（只有当计数器记满需要移动的位数后才会进入）
			begin
		//	QL=state[7:0];//现态值（移位完成的8位二进制数字）赋给输出（QL） 
			count <= 0;//清零计数器（随后将会读入D的值）
			end
	end
	if(WB) begin
		if(count==8'b00000000) begin state[15:0]<={DH[7:0],DL[7:0]}; CF<=CF0; count <= count + 1; end//如果计数器为0，则把输入的低八位赋给现态，并初始化CF寄存器的值
		else if(count <= Num) begin//移动次数（计数器）小于需要移动的位数（Num）
			count <= count + 1;//移动次数加一（计数器加一）
			case ({SHL, SHR, SAL, SAR, ROL, ROR, RCL, RCR})
			8'b10000000: begin state<={state[14:0],1'b0}; CF<=state[15]; end			//字逻辑左移
			8'b00100000: begin state<={state[14:0],1'b0}; CF<=state[15]; end			//字算术左移
			8'b00001000: begin state<={state[14:0],state[15]}; CF<=state[15]; end	//字循环左移
			8'b00000100: begin state<={state[14:0],CF}; state[0]<=CF; end				//字带进位的循环左移
			8'b01000000: begin state<={1'b0,state[15:1]}; CF<=state[0]; end			//字逻辑右移
			8'b00010000: begin state<={state[15],state[15:1]}; CF<=state[0]; end		//字算术右移
			8'b00000100: begin state<={state[0],state[15:1]}; CF<=state[0]; end		//字循环右移
			8'b00000001: begin state<={CF,state[15:1]}; CF<=state[0]; end				//字带进位的循环右移
			default:state[15:0]<=state[15:0];
			endcase
			end
		else//当移动次数等于目标移位位数时（只有当计数器记满需要移动的位数后才会进入）
			begin
		//	{QH[7:0],QL[7:0]}=state[15:0];//现态值（移位完成的8位二进制数字）赋给输出（QL） 
			count <= 0;//清零计数器（随后将会读入Din的值）
			end
	end
end
always @(posedge clk)
if(~WB) QL=state[7:0];
else {QH[7:0],QL[7:0]}=state[15:0];
endmodule 