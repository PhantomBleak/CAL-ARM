module registerFile(clk, WB_EN, RnAddress, RmAddress, RdAddress, WBVal, RnVal, RmVal);

	input clk, WB_EN;
	input [3:0]RnAddress, RmAddress, RdAddress;
	input [31:0]WBVal;

	output [31:0]RnVal, RmVal;

	logic [31:0] RegFile[0:15];

	assign RnVal = RegFile[RnAddress];
	assign RmVal = RegFile[RmAddress];

	always@(negedge clk) begin
		if(WB_EN)
			RegFile[RdAddress] <= WBVal;
		end

endmodule
