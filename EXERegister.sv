module EXERegister(rst, clk, destIn, RmValueIn, ALUResultIn, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN,
  destOut, RmValueOut, ALUResultOut, MEM_W_EN, MEM_R_EN, WB_EN);

  input rst, clk, MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN;
  input [3:0]destIn;
  input [31:0]RmValueIn, ALUResultIn;

  output logic [3:0]destOut;
  output logic [31:0]RmValueOut, ALUResultOut;
  output logic MEM_W_EN, MEM_R_EN, WB_EN;

  always@(posedge clk)begin
    if(rst)
      {destOut, RmValueOut, ALUResultOut, MEM_W_EN, MEM_R_EN, WB_EN} <= 0;
    else
      {destOut, RmValueOut, ALUResultOut, MEM_W_EN, MEM_R_EN, WB_EN} <= {destIn, RmValueIn, ALUResultIn,
      MEM_W_EN_IN, MEM_R_EN_IN, WB_EN_IN};
  end
endmodule
