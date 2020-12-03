module IDRegister(rst, clk, flush, WBDest, branchImm, I_IN, shiftOperand, RmValue, RnValue,
  PCIn, S_IN, B_IN, EXE_CMD_IN, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN,
  WBDestOut, branchImmOut, I, shiftOperandOut, RmValueOut, RnValueOut, PCOut, S, B,
  EXE_CMD, MEM_W_EN, MEM_R_EN, WB_EN);

  input clk, rst, flush, I_IN, S_IN, B_IN, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN;
  input [3:0]WBDest, EXE_CMD_IN;
  input [23:0]branchImm;
  input [11:0]shiftOperand;
  input [31:0]RmValue, RnValue, PCIn;

  output logic [3:0]WBDestOut, EXE_CMD;
  output logic [23:0]branchImmOut;
  output logic I, S, B, MEM_W_EN, MEM_R_EN, WB_EN;
  output logic [11:0]shiftOperandOut;
  output logic [31:0]RmValueOut, RnValueOut, PCOut;

  always@(posedge clk)begin
    if(rst | flush) begin
      {WBDestOut, EXE_CMD, branchImmOut, I, S, B, MEM_W_EN, MEM_R_EN, WB_EN, shiftOperandOut,
      RmValueOut, RnValueOut, PCOut} <= 0;
    end
    else begin
      {WBDestOut, EXE_CMD, branchImmOut, I, S, B, MEM_W_EN, MEM_R_EN, WB_EN, shiftOperandOut,
      RmValueOut, RnValueOut, PCOut} <= {WBDest, EXE_CMD_IN, branchImm, I_IN, S_IN, B_IN, MEM_W_EN_IN,
      MEM_R_EN_IN, WB_EN_IN, shiftOperand, RmValue, RnValue, PCIn};
      end
    end
  endmodule
