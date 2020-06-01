module registerFile(CLK, RESET, SA, SB, LD, DR, D_in, DataA, DataB);
input CLK;
input RESET;
input [2:0]SA;
input [2:0]SB;
input LD;
input [2:0] DR;
input [7:0] D_in;
output reg [7:0] DataA;
output reg [7:0] DataB;

reg [7:0] R [0:7];
reg R_write;

always @(*) begin
	DataA <= R[SA];
	DataB <= R[SB];
end
	

always @(posedge CLK) begin
	if(RESET == 1) begin
		R[0] <= 8'b00000000;
		R[1] <= 8'b00000000;
		R[2] <= 8'b00000000;
		R[3] <= 8'b00000000;
		R[4] <= 8'b00000000;
		R[5] <= 8'b00000000;
		R[6] <= 8'b00000000;
		R[7] <= 8'b00000000;
	end
	
	
	if(R_write == 1) begin
		R[DR] <= D_in;
	end
end

always @(*) begin
	R_write = LD;
end
endmodule
