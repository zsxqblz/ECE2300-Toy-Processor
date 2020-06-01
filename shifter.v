module shifter(A, LA, LR, Y, C); 

	// inputs
	input [7:0] A;
	input LA;
	input LR;
	
	// outputs
	output reg [7:0] Y;
	output reg C;
  
  // implement module here
	always@(*) 
	begin 
	
		if ((~LA)&&(~LR)) begin
		// logical left
		Y[7]<=A[6];
		Y[6]<=A[5];
		Y[5]<=A[4];
		Y[4]<=A[3];
		Y[3]<=A[2];
		Y[2]<=A[1];
		Y[1]<=A[0];
		Y[0]<=1'b0;
		C<=A[7];
		end 
		
		else if ((~LA)&&(LR)) begin
		// logical right
		Y[7]<=1'b0;
		Y[6]<=A[7];
		Y[5]<=A[6];
		Y[4]<=A[5];
		Y[3]<=A[4];
		Y[2]<=A[3];
		Y[1]<=A[2];
		Y[0]<=A[1];
		C<=A[0];
		end 
		
		else begin
		// arithmetic right
		Y[7]<=A[7];
		Y[6]<=A[7];
		Y[5]<=A[6];
		Y[4]<=A[5];
		Y[3]<=A[4];
		Y[2]<=A[3];
		Y[1]<=A[2];
		Y[0]<=A[1];
		C<=A[0];
		end
		
	end
  
endmodule
