`timescale 1ns/1ps
module TB_PC();
reg[9:0] inPC = 1'b0000000000;
reg clk = 0;
reg rst = 0;
reg freeze = 0;
wire[9:0] outPC;
PCRegister pcr(.clk(clk), .rst(rst), .inPC(inPC), .outPC(outPC), .freeze(freeze));
initial repeat(10000) #20 clk = ~clk;
initial repeat(10000) #20 inPC = inPC + 2'b11;
initial begin
	#1000
	rst =1;
	#10
	rst =0;
	#1000
	freeze=1;
	#20
	freeze=0;
end
endmodule
	
	