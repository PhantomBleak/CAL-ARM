module IDStage(rst, clk, instruction, PCIn, flush, statusRegister, WB_EN, WBDest, WBValue, hazard,
  RnAddress, RmAddress, Two_src, dest, branchImm, I, shiftOperand, RmValue, RnValue, PC, S, B, EXE_CMD,
  MEM_W_EN, MEM_R_EN, WB_EN_OUT);

  input clk, rst, flush, WB_EN, hazard;
  input [31:0]instruction, PCIn, WBValue;
  input [3:0]statusRegister, WBDest;

  output [3:0]RnAddress, RmAddress, dest, EXE_CMD;
  output Two_src, I, S, B, MEM_W_EN, MEM_R_EN, WB_EN_OUT;
  output [23:0]branchImm;
  output [11:0]shiftOperand;
  output [31:0]RmValue, RnValue, PC;

  logic internalS, internalB, internalMEM_W_EN, internalMEM_R_EN, internalWB_EN;
  logic [3:0]internalEXE_CMD;
  controller controller(instruction[27:26], instruction[24:21], instruction[20],
                        internalS, internalB, internalEXE_CMD, internalMEM_W_EN, internalMEM_R_EN, internalWB_EN);

  muxPrototype #(.WIDTH(4))RmMux(instruction[15:12], instruction[3:0], internalMEM_W_EN, RmAddress);
  assign RnAddress = instruction[19:16];
  assign Two_src = (~instruction[25]) | internalMEM_W_EN;

  logic [31:0]internalRnValue, internalRmValue;
  registerFile RegisterFile(rst, clk, WB_EN, RnAddress, RmAddress, WBDest, WBValue,
                            internalRnValue, internalRmValue);

  logic condition;
  ConditionCheck ConditionCheck(statusRegister[2], statusRegister[1], statusRegister[3], statusRegister[0],
                                instruction[31:28], condition);

  logic controlSelector;
  assign controlSelector = (~condition) | hazard;

  logic tempS, tempB, tempMEM_W_EN, tempMEM_R_EN, tempWB_EN;
  logic [3:0]tempEXE_CMD;
  muxPrototype #(.WIDTH(9))controllerMux(9'b0,
                           {internalS, internalB, internalEXE_CMD, internalMEM_W_EN, internalMEM_R_EN, internalWB_EN},
                           controlSelector, {tempS, tempB, tempEXE_CMD, tempMEM_W_EN, tempMEM_R_EN, tempWB_EN});

  IDRegister IDRegister(rst, clk, flush, instruction[15:12], instruction[23:0], instruction[25],
                        instruction[11:0], internalRmValue, internalRnValue, PCIn, tempS, tempB, tempEXE_CMD, tempMEM_W_EN,
                        tempMEM_R_EN, tempWB_EN, dest, branchImm, I, shiftOperand, RmValue, RnValue, PC, S, B, EXE_CMD,
                        MEM_W_EN, MEM_R_EN, WB_EN_OUT);

  endmodule
