`timescale 1ns/1ns

module PCRegister(freeze, rst, clk, inPC, outPC);

input freeze, rst, clk;
input [9:0]inPC;

output reg [9:0]outPC;

always@(posedge clk)begin
	if(rst)
		outPC <= 0;
	else if(!freeze)
		outPC <= inPC;
end

endmodule