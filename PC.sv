`timescale 1ns/1ns

module PCRegister(rst, clk, freeze, inPC, outPC);

input freeze, rst, clk;
input [31:0]inPC;

output logic [31:0]outPC;

always@(posedge clk)begin
	if(rst)
		outPC <= 0;
	else if(!freeze)
		outPC <= inPC;
end

endmodule
