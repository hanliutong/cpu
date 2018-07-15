module CU(
input FI,DST,SRC,EXC,INT,clk,
input [7:0]T,
input [5:0]OpCode,
input d,w,
input [1:0]mod,
input [2:0]_reg,
input [2:0]r_m,


output reg 
		Tplus1,Tset0,Set_DST,Set_SRC,Set_EXC,Set_INT,Set_FI,
		ADDC,SUBC,ANDC,ORC,XORC,NOTC,INCAC,DECAC,IBUS_RA,IBUS_RB,ALU_BUS,
		RE,WE,R_IBUS,W_B,
		IBUS_RBL,RBL_IBUS,
		IBUS_SR,SR_IBUS,SHLC,SHRC,SALC,SARC,ROLC,RORC,
		IBUS_PC,PCplus1,zero_PC,PC_IBUS,
		IBUS_IR,
		IBUS_MAR,MAR_ABUS,MAR_IBUS,
		BUS_MDR,I_DBUS,MDR_DBUS,MDR_IBUS,
		MRD,MWR,M_clk,
		HALT,IMUL,
output reg [47:0]temp,
output reg [3:0]cnt=4'b0001

);
reg Op_MOV1;
reg Op_MOV2;
reg Op_MOV3;
reg Op_MOV4;
reg Op_ADD1;
reg Op_INCAC;
reg Op_JMP;
reg Op_PUSH;
reg Op_POP;
reg HLT;

always @ (OpCode or  FI or DST or SRC or EXC or INT)
begin
	if(OpCode == 6'b110001) Op_MOV1 = 1;
	else Op_MOV1 = 0;

	if(OpCode == 6'b111101) HLT = 1;
	else HLT = 0;

	if(OpCode == 6'b100001) Op_MOV3 = 1;
	else Op_MOV3 = 0;

	if(OpCode == 6'b100000) 
		begin 
		if (DST||EXC)begin Op_MOV3 = 1;Op_MOV2 = 0;end
		else begin Op_MOV2 = 1; Op_MOV3 = 0; end
		end
	else Op_MOV2 = 0;

	if(OpCode == 6'b100011) 
		begin 
		if (DST)begin Op_MOV3 = 1;Op_MOV4 = 0; Op_MOV1 = 0;end
		else if (SRC) begin Op_MOV1 = 1; Op_MOV3 = 0; Op_MOV4 = 0;end
		else begin Op_MOV4 = 1; Op_MOV3 = 0; Op_MOV1 = 0;end
		end

	if (OpCode == 6'b000001 || OpCode ==6'b001010 || OpCode == 6'b001100 || OpCode == 6'b001011 || OpCode == 6'b001101 ||  OpCode == 6'b001110) Op_ADD1 = 1;
	else Op_ADD1 = 0;

	if (OpCode == 6'b010000) Op_INCAC = 1;
	else Op_INCAC = 0;

	if (OpCode == 6'b111010) Op_JMP = 1;
	else Op_JMP = 0;
	if (OpCode == 6'b010101) Op_PUSH = 1;
	else Op_PUSH = 0;
	if (OpCode == 6'b010111) Op_POP = 1;
	else Op_POP = 0;

end

always @ (negedge clk)
begin
if(Tset0||Tplus1)
	cnt = 4'b0001;
else
	cnt = {cnt[2:0],1'b0};
end

always @ (FI or DST or SRC or EXC or INT or T or OpCode or d or w or mod or _reg or r_m)
begin

	casez ({FI,DST,SRC,EXC,INT,T,OpCode,d,w,mod,_reg,r_m})
		29'b10000_00000001_??????_?_?_??_???_???: temp = 48'h0000000A0040;//FI0
		29'b10000_00000010_??????_?_?_??_???_???: temp = 48'h000200656D30;//FI1
		29'b01000_00000001_110001_?_?_??_???_???: temp = 48'h000000600040;//MOV1 DST0
		29'b01000_00000010_110001_?_?_??_???_???: temp = 48'h0000000A0040;//MOV1 DST1
		29'b01000_00000100_110001_?_?_??_???_???: temp = 48'h008200616D40;//MOV1 DST2
		29'b01000_00001000_110001_?_?_??_???_???: temp = 48'h005600600040;//MOV1 DST3
		29'b01000_00010000_110001_?_?_??_???_???: temp = 48'h802200020028;//MOV1 DST4
		29'b00100_00000001_110001_?_?_??_???_???: temp = 48'h000100008040;//MOV1 SRC0
		29'b00100_00000010_110001_?_?_??_???_???: temp = 48'h0000000A0040;//MOV1 SRC1
		29'b00100_00000100_110001_?_?_??_???_???: temp = 48'h000240616D40;//MOV1 SRC2
		29'b00100_00001000_110001_?_?_??_???_???: temp = 48'h000080620024;//MOV1 SRC3
		29'b00010_00000001_110001_?_?_??_???_???: temp = 48'h000020004040;//MOV1 EXC0
		29'b00010_00000010_110001_?_?_??_???_???: temp = 48'h000200011321;//MOV1 EXC1


		29'b01000_00000001_100000_?_?_??_???_???: temp = 48'h000000600028;//MOV2 DST0
		29'b00100_00000001_100000_?_?_??_???_???: temp = 48'h001500000024;//MOV2 SRC0
		29'b00010_00000001_100000_?_?_??_???_???: temp = 48'h000880000021;//MOV2 EXC0

		29'b01000_00000001_100001_?_?_??_???_???: temp = 48'h000000600028;//MOV3 DST0
		29'b00100_00000001_100001_?_?_??_???_???: temp = 48'h0000000A0040;//MOV3 SRC0
		29'b00100_00000010_100001_?_?_??_???_???: temp = 48'h000200636D40;//MOV3 SRC1
		29'b00100_00000100_100001_?_?_??_???_???: temp = 48'h000300616D24;//MOV3 SRC2
		29'b00010_00000001_100001_?_?_??_???_???: temp = 48'h000880000021;//MOV3 EXC0

		29'b01000_00000001_100011_?_?_??_???_???: temp = 48'h000000600028;//MOV4 DST0
		29'b00100_00000001_100011_?_?_??_???_???: temp = 48'h000100008040;//MOV4 SRC0
		29'b00100_00000010_100011_?_?_??_???_???: temp = 48'h0000000A0040;//MOV4 SRC1
		29'b00100_00000100_100011_?_?_??_???_???: temp = 48'h000240616D40;//MOV4 SRC2
		29'b00100_00001000_100011_?_?_??_???_???: temp = 48'h000080620024;//MOV4 SRC3
		29'b00010_00000001_100011_?_?_??_???_???: temp = 48'h000820000021;//MOV4 EXC0

		29'b01000_00000001_000001_?_?_??_???_???: temp = 48'h000000600040;//ADD1 DST0
		29'b01000_00000010_000001_?_?_??_???_???: temp = 48'h001440000028;//ADD1 DST1
		29'b00100_00000001_000001_?_?_??_???_???: temp = 48'h005400000024;//ADD1 SRC0
		29'b00010_00000001_000001_?_?_??_???_???: temp = 48'h008020000040;//ADD1 EXC0
		29'b00010_00000010_000001_?_?_??_???_???: temp = 48'h802A00000021;//ADD1 EXC1


		29'b01000_00000001_010000_?_?_??_???_???: temp = 48'h000000600040;//INCAC DST0
		29'b01000_00000010_010000_?_?_??_???_???: temp = 48'h009400000024;//INCAC DST1
		29'b00010_00000001_010000_?_?_??_???_???: temp = 48'h022800000021;//INCAC EXC0

		29'b01000_00000001_001010_?_?_??_???_???: temp = 48'h000000600040;//SUB1 DST0
		29'b01000_00000010_001010_?_?_??_???_???: temp = 48'h001440000028;//SUB1 DST1
		29'b00100_00000001_001010_?_?_??_???_???: temp = 48'h005400000024;//SUB1 SRC0
		29'b00010_00000001_001010_?_?_??_???_???: temp = 48'h008020000040;//SUB1 EXC0
		29'b00010_00000010_001010_?_?_??_???_???: temp = 48'h402A00000021;//SUB1 EXC1

		29'b01000_00000001_001100_?_?_??_???_???: temp = 48'h000000600040;//XOR1 DST0
		29'b01000_00000010_001100_?_?_??_???_???: temp = 48'h001440000028;//XOR1 DST1
		29'b00100_00000001_001100_?_?_??_???_???: temp = 48'h005400000024;//XOR1 SRC0
		29'b00010_00000001_001100_?_?_??_???_???: temp = 48'h008020000040;//XOR1 EXC0
		29'b00010_00000010_001100_?_?_??_???_???: temp = 48'h082A00000021;//XOR1 EXC1

		29'b01000_00000001_001101_?_?_??_???_???: temp = 48'h000000600040;//AND1 DST0
		29'b01000_00000010_001101_?_?_??_???_???: temp = 48'h001440000028;//AND1 DST1
		29'b00100_00000001_001101_?_?_??_???_???: temp = 48'h005400000024;//AND1 SRC0
		29'b00010_00000001_001101_?_?_??_???_???: temp = 48'h008020000040;//AND1 EXC0
		29'b00010_00000010_001101_?_?_??_???_???: temp = 48'h202A00000021;//AND1 EXC1

		29'b01000_00000001_001110_?_?_??_???_???: temp = 48'h000000600040;//OR1 DST0
		29'b01000_00000010_001110_?_?_??_???_???: temp = 48'h001440000028;//OR1 DST1
		29'b00100_00000001_001110_?_?_??_???_???: temp = 48'h005400000024;//OR1 SRC0
		29'b00010_00000001_001110_?_?_??_???_???: temp = 48'h008020000040;//OR1 EXC0
		29'b00010_00000010_001110_?_?_??_???_???: temp = 48'h102A00000021;//OR1 EXC1

		29'b01000_00000001_001011_?_?_??_???_???: temp = 48'h000000600040;//IMUL DST0
		29'b01000_00000010_001011_?_?_??_???_???: temp = 48'h001440000028;//IMUL DST1
		29'b00100_00000001_001011_?_?_??_???_???: temp = 48'h005400000024;//IMUL SRC0
		29'b00010_00000001_001011_?_?_??_???_???: temp = 48'h008020000040;//IMUL EXC0
		29'b00010_00000010_001011_?_?_??_???_???: temp = 48'h002A00000021;//IMUL EXC1

		29'b00010_00000001_111010_?_?_??_???_???: temp = 48'h0000006A0040;//JMP EXC0
		29'b00010_00000010_111010_?_?_??_???_???: temp = 48'h008200616D40;//JMP EXC1
		29'b00010_00000100_111010_?_?_??_???_???: temp = 48'h000000600040;//JMP EXC2
		29'b00010_00001000_111010_?_?_??_???_???: temp = 48'h004000080040;//JMP EXC3
		29'b00010_00010000_111010_?_?_??_???_???: temp = 48'h802200400021;//JMP EXC4

		29'b01000_00000001_010101_?_?_??_???_???: temp = 48'h000000600028;//PUSH DST0
		29'b00100_00000001_010101_?_?_??_???_???: temp = 48'h001500000024;//PUSH SRC0
		29'b00010_00000001_010101_?_?_??_???_???: temp = 48'h009400000040;//PUSH EXC0
		29'b00010_00000010_010101_?_?_??_???_???: temp = 48'h012A00000040;//PUSH EXC1
		29'b00010_00000100_010101_?_?_??_???_???: temp = 48'h009400000040;//PUSH EXC2
		29'b00010_00001000_010101_?_?_??_???_???: temp = 48'h012A00020040;//PUSH EXC3
		29'b00010_00010000_010101_?_?_??_???_???: temp = 48'h000080004040;//PUSH EXC4
		29'b00010_00100000_010101_?_?_??_???_???: temp = 48'h000200011321;//PUSH EXC5

		29'b01000_00000001_010111_?_?_??_???_???: temp = 48'h000000600028;//POP DST0
		29'b00100_00000001_010111_?_?_??_???_???: temp = 48'h009400020040;//POP SRC0
		29'b00100_00000010_010111_?_?_??_???_???: temp = 48'h000300016D40;//POP SRC1
		29'b00100_00000100_010111_?_?_??_???_???: temp = 48'h022A00000040;//POP SRC2
		29'b00100_00001000_010111_?_?_??_???_???: temp = 48'h009400000040;//POP SRC3
		29'b00100_00010000_010111_?_?_??_???_???: temp = 48'h022A00000024;//POP SRC4
		29'b00010_00000001_010111_?_?_??_???_???: temp = 48'h000880000021;//POP EXC0

		default temp = 0;
	endcase
end



always @ (temp or HLT)
begin
		W_B = 		temp[33]&&((cnt[1]&&(!cnt[0])&&FI&&T[1]) || ((!cnt[2])&&((DST&&T[3])||(EXC&&T[1]))&&Op_MOV1)|| (!cnt[2]&&(DST||SRC)&&T[2]&&Op_MOV1) || (!cnt[2]&&SRC&&(T[1]||T[2])&&Op_MOV3) || (cnt[0]&&EXC&&T[0]&&Op_MOV3) || (cnt[0]&&EXC&&T[1]&&Op_ADD1) ||(((cnt[1]&&T[1])||(cnt[0]&&T[4]))&&EXC&&Op_JMP) || (EXC&&(T[1]||T[3]||T[5])&&Op_PUSH) || (SRC&&(T[2]||T[4])&&Op_POP&&cnt[0]) || (SRC&&T[1]&&cnt[1]&&Op_POP) );
		IBUS_PC =  	temp[22]&&cnt[0]&&clk&& ((FI&&T[1]) || (((DST&&(T[0]||T[2]||T[3]))||(SRC&&(T[2]||T[3])))&&Op_MOV1) || ((DST||(SRC&&(T[1]||T[2])))&&Op_MOV3) || (DST&&T[0]&& (Op_ADD1||Op_INCAC)) || (EXC&&(T[0]||T[1]||T[2]||T[4])&&Op_JMP) || (DST&&Op_PUSH) || (DST&&Op_POP) );
		PCplus1 =  	temp[21]&&cnt[0]&& ((FI&&T[1]) || (((DST&&(T[0]||T[2]||T[3]))||(SRC&&(T[2]||T[3])))&&Op_MOV1) || ((DST||(SRC&&(T[1]||T[2])))&&Op_MOV3) || (DST&&T[0]&& (Op_ADD1||Op_INCAC)) || (EXC&&(T[0]||T[1]||T[2])&&cnt[0]&&Op_JMP) ||(DST&&Op_PUSH)|| (DST&&Op_POP) );
		PC_IBUS =  	temp[19]&&((FI&&T[0]) || ((DST||SRC)&&T[1]&&Op_MOV1) || (SRC&&T[0]&&Op_MOV3) || (EXC&&((T[3]&&cnt[0])||(T[0]&&cnt[1]))&&Op_JMP) );
		IBUS_IR =  	temp[18]&&clk&&cnt[2]&&(!cnt[0])&&FI&&T[1];
		IBUS_MAR = 	temp[17]&&((FI&&T[0]&&clk) || (((DST&&(T[4]||T[1]))||(SRC&&(T[3]||T[1])))&&Op_MOV1&&cnt[0]&&clk) || (((cnt[0]&&T[0])||(cnt[2]&&T[1]))&&clk&&SRC&&Op_MOV3) ||(EXC&&T[0]&&cnt[1]&&clk&&Op_JMP) || (cnt[0]&&EXC&&T[3]&&clk&&Op_PUSH) || (cnt[1]&&clk&&SRC&&T[0]&&Op_POP));
		MAR_ABUS = 	temp[16]&&((FI&&T[1])||((((DST||SRC)&&T[2])||(EXC&&T[1]))&&Op_MOV1) || (SRC&&(T[1]||T[2])&&Op_MOV3) || (EXC&&T[1]&&Op_JMP) || (EXC&&T[5]&&Op_PUSH) || (SRC&&T[1]&&Op_POP));
		MAR_IBUS =  temp[15]&&cnt[0]&&(SRC&&T[0]);

		BUS_MDR  = 	temp[14]&&clk&&((cnt[1]&&(!cnt[0])&&((FI&&T[1])||(((DST&&T[2])||(SRC&&T[2]))&&Op_MOV1))) || (cnt[0]&&EXC&&T[0]&&Op_MOV1) || (cnt[1]&&SRC&&(T[1]||T[2])&&Op_MOV3) || (cnt[1]&&EXC&&T[1]&&Op_JMP) || (cnt[0]&&EXC&&T[4]&&Op_PUSH) || (cnt[1]&&SRC&&T[1]&&Op_POP) );
		I_DBUS  =  	temp[13]&&cnt[1]&&((FI&&T[1]) || (((DST&&T[2])||(SRC&&T[2]))&&Op_MOV1) || (SRC&&(T[1]||T[2])&&Op_MOV3) || (EXC&&T[1]&&Op_JMP) || (cnt[1]&&SRC&&T[1]&&Op_POP));
		MDR_DBUS =  temp[12]&&cnt[0]&&((EXC&&T[1]&&Op_MOV1)||(EXC&&T[5]&&Op_PUSH));
		MDR_IBUS = 	temp[11]&&cnt[2]&&(!cnt[1])&& ( (FI&&T[1])||(((DST&&T[2])||(SRC&&T[2]))&&Op_MOV1) || (SRC&&(T[1]||T[2])&&Op_MOV3) || (EXC&&T[1]&&Op_JMP) || (SRC&&T[1]&&Op_POP) );
		MRD =      	temp[10]&&cnt[1]&&(!cnt[0])&&((FI&&T[1])||(((DST&&T[2])||(SRC&&T[2]))&&Op_MOV1) || (cnt[1]&&SRC&&(T[1]||T[2])&&Op_MOV3) ||(EXC&&T[1]&&Op_JMP) || (SRC&&T[1]&&Op_POP) );
		MWR = 		temp[9]&&cnt[0]&&(!cnt[1])&&((EXC&&T[1]&&Op_MOV1)||(EXC&&T[5]&&Op_PUSH));
		M_clk =    	temp[8]&&cnt[0]&&(!cnt[1])&&clk&&((FI&&T[1])||(((DST&&T[2])||(SRC&&T[2])||(EXC&&T[1]))&&Op_MOV1) || (SRC&&(T[1]||T[2])&&Op_MOV3) || (EXC&&T[1]&&Op_JMP) ||(EXC&&T[5]&&Op_PUSH) || (SRC&&T[1]&&Op_POP) );

		Tplus1 = 	temp[6]&&clk&&((FI&&T[0])||(((DST&&T[2])||(SRC&&T[2]))&&cnt[2]&&Op_MOV1) || (((DST&&(T[0]||T[1]||T[3]))||(EXC&&T[0])||(SRC&&(T[0]||T[1])))&&cnt[1]&&Op_MOV1) || (((cnt[0]&&T[0])||(cnt[2]&&T[1]))&&clk&&SRC&&Op_MOV3) || (cnt[0]&&T[0]&&(DST||EXC)&&Op_ADD1) ||(cnt[0]&&T[0]&&DST&&Op_INCAC) || (cnt[0]&&EXC&&(T[2]||T[3])&&Op_JMP) || (cnt[2]&&EXC&&(T[1]||T[0])&&Op_JMP) || (cnt[0]&&EXC&&(T[1]||T[3]||T[4])&&Op_PUSH) ||(cnt[1]&&EXC&&(T[0]||T[2])&&Op_PUSH)  || (SRC&&Op_POP&&((cnt[1]&&(T[0]||T[3]))||(cnt[0]&&T[2])||(cnt[2]&&T[1]))) );
		Tset0  = 	temp[5]&&clk&& ( (cnt[2]&&(!cnt[1])&&((FI&&T[1]) || (((DST&&T[4])||(SRC&&T[3]))&&Op_MOV1)))||(cnt[0]&&EXC&&T[1]&&Op_MOV1) || ((((DST||EXC)&&cnt[0]&&T[0])||(SRC&&cnt[2]&&T[2]))&&clk&&Op_MOV3) || (cnt[1]&&SRC&&T[0]&&Op_MOV2) || (cnt[1]&&((DST&&T[1])||(SRC&&T[0]))&&Op_ADD1) || (cnt[0]&&EXC&&T[1]&&Op_ADD1) || (((cnt[1]&&DST&&T[1])||(cnt[0]&&EXC&&T[0]))&&Op_INCAC) || (cnt[0]&&EXC&&T[4]&&Op_JMP) || (cnt[0]&&((EXC&&T[5])||DST)&&Op_PUSH) || (cnt[1]&&SRC&&Op_PUSH) || (cnt[0]&&T[0]&&(DST||EXC)&&Op_POP) || (cnt[0]&&SRC&&T[4]&&Op_POP)  || (EXC&&T[0]&&cnt[0]&&Op_MOV4));		
		Set_DST= 	temp[4]&&clk&&cnt[2]&&(!cnt[1])&&FI&&T[1]&&!Op_JMP;
		Set_SRC= 	temp[3]&&clk&&((cnt[2]&&(!cnt[1])&&DST&&T[4]&&Op_MOV1) || (DST&&cnt[0]&&T[0]&&Op_MOV3) || (cnt[1]&&DST&&T[1]&&Op_ADD1) ||(cnt[0]&&DST&&Op_PUSH) || (cnt[0]&&DST&&Op_POP) );
		Set_EXC= 	clk&&((temp[2]&&((cnt[2]&&(!cnt[1])&&SRC&&T[3]&&Op_MOV1) || (SRC&&cnt[2]&&T[2]&&Op_MOV3) || (cnt[1]&&SRC&&T[0]&&Op_MOV2) ||  (cnt[1]&&SRC&&T[0]&&Op_ADD1) ||  (cnt[1]&&DST&&T[1]&&Op_INCAC))) || (FI&&T[1]&&Op_JMP&&cnt[2]) || (SRC&&cnt[1]&&Op_PUSH) || ((cnt[0]&&SRC&&T[4]&&Op_POP) ) );
		Set_FI= 	temp[0]&&clk&&((cnt[0]&&(!cnt[1])&&EXC&&T[1]&&Op_MOV1) || (EXC&&cnt[0]&&T[0]&&Op_MOV3) || (cnt[0]&&EXC&&T[1]&&Op_ADD1)|| (cnt[0]&&EXC&&T[0]&&Op_INCAC) || (cnt[0]&&EXC&&T[4]&&Op_JMP) ||(cnt[0]&&EXC&&T[5]&&Op_PUSH) || (cnt[0]&&EXC&&Op_POP) ||(EXC&&T[0]&&cnt[0]&&Op_MOV4));
		
		IMUL = 		(~|temp[47:40])&&cnt[0]&&EXC&T[1]&&Op_ADD1;
		ADDC = 		temp[47]&&cnt[0]&&((DST&&T[4]&&Op_MOV1)||(EXC&&T[1]&&Op_ADD1)|| (EXC&&T[4]&&Op_JMP));
		SUBC = 		temp[46]&&cnt[0]&&EXC&T[1]&&Op_ADD1;
		ANDC = 		temp[45]&&cnt[0]&&EXC&T[1]&&Op_ADD1;
		ORC = 		temp[44]&&cnt[0]&&EXC&T[1]&&Op_ADD1;
		XORC = 		temp[43]&&cnt[0]&&EXC&T[1]&&Op_ADD1;
		INCAC = 	temp[41]&&cnt[0]&&((EXC&&T[0]&&Op_INCAC)||(SRC&&(T[2]||T[4])&&Op_POP));
		DECAC = 	temp[40]&&cnt[0]&&(EXC&&(T[1]||T[3])&&Op_PUSH);
		IBUS_RA = 	temp[39]&&clk&&((cnt[2]&&(!cnt[1])&&DST&&T[2]&&Op_MOV1)||(cnt[0]&&EXC&&T[0]&&Op_ADD1)||(cnt[1]&&!cnt[0]&&DST&&T[1]&&Op_INCAC)||(cnt[2]&&EXC&&T[1]&&Op_JMP) || (cnt[1]&&EXC&&(T[0]||T[2])&&Op_PUSH)|| (cnt[1]&&SRC&&(T[0]||T[3])&&Op_POP) );
		IBUS_RB = 	temp[38]&&clk&&((cnt[1]&&(!cnt[0])&&DST&&T[3]&&Op_MOV1)||(cnt[1]&&(!cnt[0])&&SRC&&T[0]&&Op_ADD1) || (cnt[0]&&EXC&&T[3]&&Op_JMP) );
		ALU_BUS = 	temp[37]&&cnt[0]&&((DST&&T[4]&&Op_MOV1)||(EXC&&T[1]&&Op_ADD1)||(EXC&&T[0]&&Op_INCAC) ||(EXC&&T[4]&&Op_JMP) ||(EXC&&(T[1]||T[3])&&Op_PUSH) || (SRC&&(T[2]||T[4])&&Op_POP) );

		RE = 		temp[36]&&clk&&cnt[0]&&((DST&&T[3]&&Op_MOV1) || (SRC&&T[0]&&Op_MOV2) || (((SRC&&T[0])||(DST&&T[1]))&&Op_ADD1) || (DST&&T[1]&&Op_INCAC) || (EXC&&(T[0]||T[2])&&Op_PUSH) || (SRC&&T[0]&&Op_PUSH) || (SRC&&(T[0]||T[3])&&Op_POP));
		WE = 		temp[35]&&clk&&cnt[0]&&((EXC&&T[0]&&Op_MOV3) || (EXC&&T[1]&&Op_ADD1) || (EXC&&T[0]&&Op_INCAC) || (EXC&&(T[1]||T[3])&&Op_PUSH) || (((SRC&&(T[2]||T[4]))||(EXC&&T[0]))&&Op_POP) || (EXC&&T[0]&&cnt[0]&&Op_MOV4) );
		R_IBUS = 	temp[34]&&cnt[1]&&(!cnt[0])&&((DST&&T[3]&&Op_MOV1) || (SRC&&T[0]&&Op_MOV2) ||  (((SRC&&T[0])||(DST&&T[1]))&&Op_ADD1) || (DST&&T[1]&&Op_INCAC) || (EXC&&(T[0]||T[2])&&Op_PUSH) || (SRC&&T[0]&&Op_PUSH) ||(SRC&&(T[0]||T[3])&&Op_POP) );

		IBUS_RBL =  temp[32]&&clk&&((cnt[0]&&(SRC&&T[0]&&Op_MOV1)) || (cnt[2]&&SRC&&T[2]&&Op_MOV3) || (cnt[1]&&SRC&&T[0]&&Op_MOV2) || (cnt[1]&&SRC&&T[0]&&Op_PUSH) || (cnt[2]&&SRC&&T[1]&&Op_POP) );
		RBL_IBUS =  temp[31]&&((cnt[0]&&(SRC&&T[3]&&Op_MOV1))||(cnt[0]&&EXC&&T[0]&&Op_MOV3) || (cnt[0]&&EXC&&T[4]&&Op_PUSH) || (cnt[0]&&EXC&&T[0]&&Op_POP));

		IBUS_SR = temp[30]&&clk&&((cnt[2]&&(!cnt[1])&&SRC&&T[2]&&Op_MOV1)||(cnt[1]&&!cnt[0]&&DST&&T[1]&&Op_ADD1));
		SR_IBUS = temp[29]&&cnt[0]&&((EXC&&T[0]&&Op_MOV1)||(EXC&&T[0]&&Op_ADD1) || (EXC&&T[0]&&Op_MOV4) );
		HALT 	= 	HLT;
end

endmodule