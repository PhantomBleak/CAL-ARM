`timescale 1ns/1ps
module TB();
reg[9:0] pc = 10'd0;
wire [9:0] out;
Adder a1(.inLhs(pc), .out(out), .inRhs(4));
endmodule