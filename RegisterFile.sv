module RegisterFile(clk,
					rst,
					src1,
					src2, 
					Dest_wb,
					Result_WB,
					wrtieBackEn,
					reg1,
					reg2);
input clk, rst;
input [3:0] src1, src2, Dest_wb;
input[31:0] Result_WB,
input wrtieBackEn;
logic [31:0] rfile[15:0];
output [31:0] reg1, reg2;

assign rfile[0] = 32'b0;

always@(*)begin
	reg1 <= rfile[src1];
	reg2 <= rfile [src2];	
end

always@(negedge)begin
	if(wrtieBackEn && Dest_wb != 0)
		begin
			rfile[Dest_wb] = Result_WB;
		end
end

endmodule


