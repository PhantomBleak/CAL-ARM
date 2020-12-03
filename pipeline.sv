`timescale 1ns/1ns

module pipeline(clk, rst, start, done);

input clk, rst, start;

output done;

logic [31:0]PC;
logic [31:0]instruction;
IFState IFState(rst, clk, 1'b0, 1'b0, 1'b0, 32'd0, PC, instruction);

endmodule
