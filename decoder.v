module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);
input [15:0] INST;
output reg [2:0]DR; 
output reg [2:0]SA;
output reg [2:0]SB;
output reg [5:0]IMM;
output reg MB;
output reg[2:0]FS;
output reg MD;
output reg LD;
output reg MW;
output reg [2:0]BS;
output reg [5:0]OFF;
output reg HALT;

always @ (*) begin
	case(INST[15:12])
	4'b0000: begin
		if(INST[2:0] == 3'b001) begin
			DR = 0;
			SA = 0;
			SB = 0;
			IMM = 0;
			MB = 0;
			FS = 0;
			MD = 0;
			LD = 0;
			MW = 0;
			BS = 3'd4;
			OFF = 6'b000000;
			HALT = 1;
		end else begin
			DR = 0;
			SA = 0;
			SB = 0;
			IMM = 0;
			MB = 0;
			FS = 0;
			MD = 0;
			LD = 0;
			MW = 0;
			BS = 3'd4;
			OFF = 6'b000000;
			HALT = 0;
		end
	end

	4'b0010: begin //LB
		DR = INST[8:6];
		SA = INST[11:9];
		SB = 0;
		IMM = INST[5:0];
		MB = 1;
		FS = 0;
		MD = 1;
		LD = 1;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b0100: begin //SB
		DR = 0;
		SA = INST[11:9];
		SB = INST[8:6];
		IMM = INST[5:0];
		MB = 1;
		FS = 0;
		MD = 0;
		LD = 0;
		MW = 1;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b0101: begin //ADDI
		DR = INST[8:6];
		SA = INST[11:9];
		SB = 0;
		IMM = INST[5:0];
		MB = 1;
		FS = 0;
		MD = 0;
		LD = 1;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b0110: begin //ANDI
		DR = INST[8:6];
		SA = INST[11:9];
		SB = 0;
		IMM = INST[5:0];
		MB = 1;
		FS = 3'b101;
		MD = 0;
		LD = 1;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b0111: begin //ORI
		DR = INST[8:6];
		SA = INST[11:9];
		SB = 0;
		IMM = INST[5:0];
		MB = 1;
		FS = 3'b110;
		MD = 0;
		LD = 1;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b1111: begin //ALU OPS
		DR = INST[5:3];
		SA = INST[11:9];
		SB = INST[8:6];
		IMM = 0;
		MB = 0;
		FS = INST[2:0];
		MD = 0;
		LD = 1;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end

	4'b1000: begin
		DR = 0;
		SA = INST[11:9];
		SB = INST[8:6];
		IMM = 0;
		MB = 0;
		FS = 3'b001;
		MD = 0;
		LD = 0;
		MW = 0;
		BS = 3'd0 ;
		OFF = INST[5:0];
		HALT = 0;
	end

	4'b1001: begin
		DR = 0;
		SA = INST[11:9];
		SB = INST[8:6];
		IMM = 0;
		MB = 0;
		FS = 3'b001;
		MD = 0;
		LD = 0;
		MW = 0;
		BS = 3'd1;
		OFF = INST[5:0];
		HALT = 0;
	end
	
	4'b1010: begin
		DR = 0;
		SA = INST[11:9];
		SB = 0;
		IMM = 3'b000;
		MB = 1;
		FS = 3'b000;
		MD = 0;
		LD = 0;
		MW = 0;
		BS = 3'd2;
		OFF = INST[5:0];
		HALT = 0;
	end
	
	4'b1011: begin
		DR = 0;
		SA = INST[11:9];
		SB = 0;
		IMM = 3'b000;
		MB = 1;
		FS = 3'b000;
		MD = 0;
		LD = 0;
		MW = 0;
		BS = 3'd3;
		OFF = INST[5:0];
		HALT = 0;
	end

	default: begin
		DR = 0;
		SA = 0;
		SB = 0;
		IMM = 0;
		MB = 0;
		FS = 0;
		MD = 0;
		LD = 0;
		MW = 0;
		BS = 3'd4;
		OFF = 6'b000000;
		HALT = 0;
	end
	endcase
end

endmodule
