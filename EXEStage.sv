module EXEStage(rst, clk, carryIn, destIn, signedImmediate, I, shiftOperand, RmValue, RnValue, PC,
  S, B_IN, EXE_CMD, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN,
  statusBits, branchAddress, destOut, EXE_dest, storeValue, ALUResult, B_OUT, MEM_W_EN, MEM_R_EN, WB_EN, EXE_WB_EN);

  input rst, clk, carryIn, I, S, B_IN, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN;
  input [3:0]destIn, EXE_CMD;
  input [23:0]signedImmediate;
  input [11:0]shiftOperand;
  input [31:0]RmValue, RnValue, PC;

  output [3:0]statusBits, destOut, EXE_dest;
  output [31:0]branchAddress, storeValue, ALUResult;
  output B_OUT, MEM_W_EN, MEM_R_EN, WB_EN, EXE_WB_EN;

  assign EXE_dest = destIn;
  assign B_OUT = B_IN;
  assign EXE_WB_EN = WB_EN_IN;

  logic loadOrStore;
  assign loadOrStore = MEM_R_EN_IN || MEM_W_EN_IN;
  logic [31:0]secondValue;
  secondValueGenerator value2Generator(loadOrStore, I, shiftOperand, RmValue, secondValue);

  branchAddressGenerator branchAddressGenerator(signedImmediate, PC, branchAddress);

  logic [3:0]internalStatusBits;
  logic [31:0]internalALUResult;
  ALU #(.WIDTH(32))ALU(RnValue, secondValue, carryIn, EXE_CMD, internalStatusBits, internalALUResult);

  statusRegister statusRegister(rst, clk, S, internalStatusBits, statusBits);

  EXERegister EXERegister(rst, clk, destIn, RmValue, internalALUResult, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN,
                          destOut, storeValue, ALUResult, MEM_W_EN, MEM_R_EN, WB_EN);

endmodule
