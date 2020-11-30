`timescale 1ns/1ns

module muxPrototype(in1, in2, selector, out1);

parameter WIDTH = 10;

input [WIDTH-1:0] in1;
input [WIDTH-1:0] in2;
input selector;

output [WIDTH-1:0] out1;

assign out1 = (selector == 1'b1) ? in1 : in2;

endmodule;