module logical(A, B, OP, Y);

   // inputs
	input [7:0] A;
	input [7:0] B;
	input OP;

	// outputs
	output reg [7:0] Y;
  
always@(*)
	begin 
		if (OP) begin 
		Y<= A & B; end
		else begin 
		Y<= A | B; end
	end
	
endmodule
