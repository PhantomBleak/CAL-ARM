module PCRegister(freeze, rst, clk, inPC, outPC);
input freeze;
input rst;
input clk;
input [9:0] inPC;
output reg[9:0] outPC;

always @(rst) begin
	if(rst)
		outPC <= 10'b0;
end

always @(posedge clk) begin
	//else if(freeze) // maybe I should not put that 
		//outPC <= outPC;
	if(!freeze && !rst)
		outPC <= inPC;

end
endmodule