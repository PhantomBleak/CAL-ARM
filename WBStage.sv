module WBStage(WBDestIn, memoryData, ALUResult, MEM_R_EN, WB_EN_IN,
  WBDest, WBValue, WB_EN);
  input [3:0]WBDestIn;
  input [31:0]memoryData, ALUResult;
  input MEM_R_EN, WB_EN_IN;

  output [3:0]WBDest;
  output [31:0]WBValue;
  output WB_EN;

  assign WBDest = WBDestIn;
  muxPrototype #(.WIDTH(32))WBMux(memoryData, ALUResult, MEM_R_EN, WBValue);
  assign WB_EN = WB_EN_IN;
endmodule
