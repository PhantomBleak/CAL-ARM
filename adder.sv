module adder(inLhs, inRhs, out);
parameter WIDTH = 32;

input [WIDTH - 1:0] inLhs;
input [WIDTH - 1:0] inRhs;

output [WIDTH - 1:0] out;

assign out = inLhs + inRhs;
endmodule
