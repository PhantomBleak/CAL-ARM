module registerFile(rst, clk, WB_EN, RnAddress, RmAddress, RdAddress, WBVal, RnVal, RmVal);

	input clk,rst, WB_EN;
	input [3:0]RnAddress, RmAddress, RdAddress;
	input [31:0]WBVal;

	output [31:0]RnVal, RmVal;

	logic [31:0] RegFile[0:15];

	assign RnVal = RegFile[RnAddress];
	assign RmVal = RegFile[RmAddress];

	always@(posedge clk)begin
		if(rst)begin
			integer j;
			for(j = 0; j < 16; j = j + 1)
				RegFile[j] = 0;
			end
		end

	always@(negedge clk) begin
		if(WB_EN)
			RegFile[RdAddress] <= WBVal;
		end

endmodule
