module control(OP, BSEL, CISEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP);

	// inputs
	input [2:0] OP;

	// outputs
	output reg BSEL;
	output reg CISEL;
	output reg [1:0] OSEL;
	output reg SHIFT_LA;
	output reg SHIFT_LR;
	output reg LOGICAL_OP;

	always@(*)
		begin
			if (OP == 3'b000) begin //addition
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b00;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b0;
		   end
			
			else if (OP == 3'b001) begin //subtraction
				BSEL<=1'b1;
				CISEL<=1'b1;
				OSEL<=2'b00;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b0;
			end
			
			else if (OP == 3'b010) begin //arithmetic shift right
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b01;
				SHIFT_LA<=1'b1;
				SHIFT_LR<=1'b1;
				LOGICAL_OP<=1'b0;
			end
			
			else if (OP == 3'b011) begin //logical shift right
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b01;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b1;
				LOGICAL_OP<=1'b0;
			end
			
			else if (OP == 3'b100) begin //logical shift left
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b01;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b0;
			end
			
			else if (OP == 3'b101) begin //AND
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b10;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b1;
			end
			
			else if (OP == 3'b110) begin //OR
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b10;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b0;
			end
			
			else begin
				BSEL<=1'b0;
				CISEL<=1'b0;
				OSEL<=2'b00;
				SHIFT_LA<=1'b0;
				SHIFT_LR<=1'b0;
				LOGICAL_OP<=1'b0;
			end
		end

endmodule