`timescale 1ns/1ns

module Adder (inLhs, inRhs, out);
parameter WIDTH = 10;
	
input [WIDTH - 1:0] inLhs;
input [WIDTH - 1:0] inRhs;

output [WIDTH - 1:0] out;

assign out = inLhs + inRhs;
endmodule