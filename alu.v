module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  
  // ADD YOUR CODE BELOW THIS LINE

  wire BSEL;
  wire [7:0] B_IN;
  wire CISEL;
  wire C_ADDER;
  wire C_SHIFTER;
  wire SHIFT_LA;
  wire SHIFT_LR;
  wire LOGICAL_OP;
  wire [1:0] OSEL;
  wire V_ADDER;
  wire [7:0] Y_ADDER;
  wire [7:0] Y_SHIFTER;
  wire [7:0] Y_LOGICAL;
 
  assign B_IN = BSEL == 0 ? B : ~B;
  assign Y = OSEL == 2'b00 ? Y_ADDER : (OSEL == 2'b01 ? Y_SHIFTER : Y_LOGICAL);
  assign V = OSEL == 2'b00 ? V_ADDER : 1'b0;
  assign C = OSEL == 2'b00 ? C_ADDER : (OSEL == 2'b01 ? C_SHIFTER : 1'b0);
  
  adder adder(.A(A), .B(B_IN), .CI(CISEL), .C(C_ADDER), .Y(Y_ADDER), .V(V_ADDER));
  shifter shifter(.A(A), .LA(SHIFT_LA), .LR(SHIFT_LR), .Y(Y_SHIFTER), .C(C_SHIFTER));
  logical logical(.A(A), .B(B_IN), .OP(LOGICAL_OP), .Y(Y_LOGICAL));
  control control(.OP(OP), .BSEL(BSEL), .CISEL(CISEL), .OSEL(OSEL), .SHIFT_LA(SHIFT_LA), .SHIFT_LR(SHIFT_LR), .LOGICAL_OP(LOGICAL_OP));
  
assign N = Y[7] ? 1'b1:1'b0;
assign Z = (Y == 8'd0) ? 1'b1:1'b0;

  // ADD YOUR CODE ABOVE THIS LINE

endmodule
