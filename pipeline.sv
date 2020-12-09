module pipeline(rst, clk);
  input rst, clk;

  logic hazard, branchTaken;
  logic [31:0]branchAddress, IF_PC, instruction;
  IFState IFStage(rst, clk, hazard, branchTaken, branchAddress, IF_PC, instruction);

  logic [3:0]statusRegister, WB_WBDest, RnAddress, RmAddress, ID_WBDest, EXE_CMD;
  logic WB_WB_EN, Two_src, I, S, B, ID_MEM_W_EN, ID_MEM_R_EN, ID_WB_EN, carry;
  logic [31:0]WB_WBValue, RmValue, RnValue, ID_PC;
  logic [23:0]branchImm;
  logic [11:0]shiftOperand;
  IDStage IDStage(rst, clk, instruction, IF_PC, branchTaken, statusRegister, WB_WB_EN, WB_WBDest, WB_WBValue, hazard,
    RnAddress, RmAddress, Two_src, ID_WBDest, branchImm, I, shiftOperand, RmValue, RnValue, ID_PC, S, B, EXE_CMD,
    ID_MEM_W_EN, ID_MEM_R_EN, ID_WB_EN, carry);

  logic [3:0]EXE_WBDest, EXE_dest_hazard;
  logic [31:0]storeValue, EXE_ALUResult;
  logic EXE_MEM_W_EN, EXE_MEM_R_EN, EXE_WB_EN, EXE_WB_EN_hazard;
  EXEStage EXEStage(rst, clk, carry, ID_WBDest, branchImm, I, shiftOperand, RmValue, RnValue, ID_PC,
      S, B, EXE_CMD, ID_MEM_W_EN, ID_MEM_R_EN, ID_WB_EN,
      statusRegister, branchAddress, EXE_WBDest, EXE_dest_hazard, storeValue, EXE_ALUResult, branchTaken,
      EXE_MEM_W_EN, EXE_MEM_R_EN, EXE_WB_EN, EXE_WB_EN_hazard);

  logic [3:0]MEM_WBDest, MEM_dest_hazard;
  logic [31:0]memoryData, MEM_ALUResult;
  logic MEM_R_EN, MEM_WB_EN, MEM_WB_EN_hazard;
  MEMStage MEMStage(rst, clk, EXE_WBDest, storeValue, EXE_ALUResult, EXE_MEM_W_EN, EXE_MEM_R_EN, EXE_WB_EN,
        MEM_WBDest, memoryData, MEM_ALUResult, MEM_R_EN, MEM_WB_EN, MEM_dest_hazard, MEM_WB_EN_hazard);


  WBStage WBStage(MEM_WBDest, memoryData, MEM_ALUResult, MEM_R_EN, MEM_WB_EN,
          WB_WBDest, WB_WBValue, WB_WB_EN);

  HazardDetectionUnit HazardDetectionUnit(RnAddress, RmAddress, Two_src,
                                          EXE_WB_EN_hazard, EXE_dest_hazard,
                                          MEM_WB_EN_hazard, MEM_dest_hazard, hazard);

endmodule
