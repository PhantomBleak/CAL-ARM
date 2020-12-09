module controller(mode, opCode, S_IN, S_OUT, B, EXE_CMD, MEM_W_EN, MEM_R_EN, WB_EN);
  input S_IN;
  input [1:0]mode;
  input [3:0]opCode;

  output logic S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN;
  output logic [3:0]EXE_CMD;

  always@(*)begin
    case({mode, opCode})
      6'b001101: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0001};
      6'b001111: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b1001};
      6'b000100: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0010};
      6'b000101: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0011};
      6'b000010: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0100};
      6'b000110: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0101};
      6'b000000: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0110};
      6'b001100: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b0111};
      6'b000001: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {S_IN, 1'b0, 1'b0, 1'b0, 1'b1, 4'b1000};
      6'b001010: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 4'b0100};
      6'b001000: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 4'b0110};
      6'b010100: {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {1'b0, 1'b0, ~S_IN, S_IN, S_IN, 4'b0010};
      default: begin
        if({mode, opCode[3]} == 3'b100)
          {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 4'b0000};
        else
          {S_OUT, B, MEM_W_EN, MEM_R_EN, WB_EN, EXE_CMD} <= {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 4'b0000};
        end
    endcase
  end
endmodule
