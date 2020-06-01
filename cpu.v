module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  reg [7:0] NextPC;
  wire MW;
  
  // ADD YOUR CODE BELOW THIS LINE
  wire [2:0]DR;
  wire [2:0]SA;
  wire [2:0]SB;
  wire [5:0]IMM;
  wire MB;
  wire [2:0]FS;
  wire MD;
  wire LD;
  wire [2:0]BS;
  wire [5:0] OFF;
  wire HALT;
  
  wire C;
  wire V;
  wire N;
  wire Z;
  
  reg H;
  reg EN_L_prev;
  reg MP;
  
  wire [7:0] IMM_extended;
  wire [7:0] OFF_extended;
  wire [7:0] B_input;
 
  assign IMM_extended[7:6] = IMM[5] == 0 ? 2'b00 : 2'b11;
  assign IMM_extended[5:0] = IMM;
  assign OFF_extended[6:1] = OFF;
  assign OFF_extended[0] = 0;
  assign OFF_extended[7] = OFF[5];
  assign B_input = MB == 0 ? DataB : IMM_extended;
  assign DataC = MD == 0 ? DataD : Din;
	
	decoder decoder(.INST(Iin), .DR(DR), .SA(SA), .SB(SB), .IMM(IMM), .MB(MB), .FS(FS), .MD(MD), .LD(LD), .MW(MW), .BS(BS), .OFF(OFF), .HALT(HALT));
	registerFile registerFile(.CLK(CLK), .RESET(RESET), .SA(SA), .SB(SB), .LD(LD), .DR(DR), .D_in(DataC), .DataA(DataA), .DataB(DataB));
	alu alu(.A(DataA), .B(B_input), .OP(FS), .Y(DataD), .C(C), .V(V), .N(N), .Z(Z));
	
	always @(*) begin
		if(RESET == 1) begin
		H = 0;
		end else if(H == 0 & HALT == 1) begin
		H = 1;
		end else if(H == 1 & EN_L_prev == 1 & EN_L == 0) begin
		H = 0;
		end else if(H == 1 & HALT == 1) begin
		H = 1;
		end else begin
		H = 0;
		end
	end
	
	always @(posedge CLK) begin
		EN_L_prev = EN_L;
	end
	
	always @(*) begin
		case(BS)
			3'd0: MP = Z;
			3'd1: MP = ~Z;
			3'd2: MP = ~N;
			3'd3: MP = N;
			3'd4: MP = 0;
			default: MP = 0;
		endcase
	end
	
	
	always @(*) begin
		if (H == 0) begin
			NextPC = (MP == 1) ? PC + 8'd2 + OFF_extended : PC + 8'd2;
		end
		else NextPC = PC + 8'd2;
	end
	
	always @(posedge CLK) begin
		if(RESET == 1) begin
			PC = 0;
		end
		else if(H == 0) begin
			PC = NextPC;
		end
	end
		
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
