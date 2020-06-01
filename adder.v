module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output reg [7:0] Y;
  output reg C;
  output reg V;
  
  reg Cout_0;
  reg Cout_1;
  reg Cout_2;
  reg Cout_3;
  reg Cout_4;
  reg Cout_5;
  reg Cout_6;
  reg Cout_7;
  
  always@(*)
 begin 
 
	Y[0]<=(A[0]^B[0])^CI; // bit 0
	Cout_0<=((B[0]&CI)|(A[0]&CI)|(A[0]&B[0]));
	
	Y[1]<=(A[1]^B[1])^Cout_0; // bit 1
	Cout_1<=((B[1]&Cout_0)|(A[1]&Cout_0)|(A[1]&B[1]));
	
	Y[2]<=(A[2]^B[2])^Cout_1; // bit 2
	Cout_2<=((B[2]&Cout_1)|(A[2]&Cout_1)|(A[2]&B[2]));
	
	Y[3]<=(A[3]^B[3])^Cout_2; // bit 3
	Cout_3<=((B[3]&Cout_2)|(A[3]&Cout_2)|(A[3]&B[3]));
	
	Y[4]<=(A[4]^B[4])^Cout_3; // bit 4
	Cout_4<=((B[4]&Cout_3)|(A[4]&Cout_3)|(A[4]&B[4]));
	
	Y[5]<=(A[5]^B[5])^Cout_4; // bit 5
	Cout_5<=((B[5]&Cout_4)|(A[5]&Cout_4)|(A[5]&B[5]));
	
	Y[6]<=(A[6]^B[6])^Cout_5; // bit 6
	Cout_6<=((B[6]&Cout_5)|(A[6]&Cout_5)|(A[6]&B[6]));
	
	Y[7]<=(A[7]^B[7])^Cout_6; // bit 7 
	Cout_7<=((B[7]&Cout_6)|(A[7]&Cout_6)|(A[7]&B[7]));
	
	C<=Cout_7;
	
	if (Cout_6 == Cout_7) begin
		V<=1'b0; end
	else begin
		V<=1'b1; end
end 

endmodule
