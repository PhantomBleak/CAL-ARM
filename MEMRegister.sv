module MEMRegister(rst, clk, WBDestIn, memoryDataIn, ALUResultIn, MEM_R_EN_IN, WB_EN_IN,
  WBDest, memoryData, ALUResult, MEM_R_EN, WB_EN);
  input rst, clk, MEM_R_EN_IN, WB_EN_IN;
  input [3:0]WBDestIn;
  input [31:0]memoryDataIn, ALUResultIn;

  output logic [3:0]WBDest;
  output logic [31:0]memoryData, ALUResult;
  output logic MEM_R_EN, WB_EN;

  always@(posedge clk)begin
    if(rst)
      {WBDest, memoryData, ALUResult, MEM_R_EN, WB_EN} <= 0;
    else
      {WBDest, memoryData, ALUResult, MEM_R_EN, WB_EN} <= {WBDestIn, memoryDataIn, ALUResultIn, MEM_R_EN_IN, WB_EN_IN};
  end
endmodule
