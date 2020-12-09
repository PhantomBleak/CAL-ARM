module MEMStage(rst, clk, WBDestIn, storeValue, ALUResultIn, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN,
  WBDest, memoryData, ALUResult, MEM_R_EN, WB_EN, MEM_WBDest, MEM_WB_EN);

  input rst,clk, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN;
  input [3:0]WBDestIn;
  input [31:0]storeValue, ALUResultIn;

  output [3:0]WBDest, MEM_WBDest;
  output [31:0]memoryData, ALUResult;
  output MEM_R_EN, WB_EN, MEM_WB_EN;

  logic [31:0]internalData;
  dataMemory dataMemory(clk, storeValue, ALUResultIn, MEM_W_EN_IN, MEM_R_EN_IN, internalData);

  MEMRegister MEMReg(rst, clk, WBDestIn, internalData, ALUResultIn, MEM_R_EN_IN, WB_EN_IN,
                     WBDest, memoryData, ALUResult, MEM_R_EN, WB_EN);

  assign MEM_WBDest = WBDestIn;
  assign MEM_WB_EN = WB_EN_IN;

endmodule
