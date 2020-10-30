module Adder (	inLhs,
				inRhs,
				out);
	parameter LHS_WIDTH = 10;
	parameter RHS_WIDTH = 10;
	
	input [LHS_WIDTH - 1:0] inLhs;
	input [RHS_WIDTH - 1:0] inRhs;
	output reg [LHS_WIDTH - 1:0] out;
	assign out = inLhs + inRhs;
endmodule