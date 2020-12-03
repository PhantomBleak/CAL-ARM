`timescale 1ns/1ns
module IDStageTestBench();
  logic rst = 0;
  logic clk = 0;
  logic [31:0] instruction = 0;
  logic [31:0] PCIn = 0;
  logic flush = 0;
  logic [3:0]statusRegister = 0;
  logic WB_EN = 1;
  logic [3:0]WBDest = 4'b0010;
  logic [31:0]WBValue = 32'd5;
  logic hazard = 0;

  logic [3:0]RnAddress, RmAddress, dest, EXE_CMD;
  logic Two_src, I, S, B, MEM_W_EN, MEM_R_EN, WB_EN_OUT;
  logic [23:0]branchImm;
  logic [11:0]shiftOperand;
  logic [31:0]RmValue, RnValue, PC;

  IDStage DUT(rst, clk, instruction, PCIn, flush, statusRegister, WB_EN, WBDest, WBValue, hazard,
    RnAddress, RmAddress, Two_src, dest, branchImm, I, shiftOperand, RmValue, RnValue, PC, S, B, EXE_CMD,
    MEM_W_EN, MEM_R_EN, WB_EN_OUT);

  always #20 clk = ~ clk;

  initial begin
    #5 rst = 1;
    #20 rst = 0;
    #100 instruction = 32'b1110_00_1_1101_0_0000_0000_000000010100;
    #100 instruction = 32'b1110_00_0_0100_1_0010_0011_000000000010;
    #100 instruction = 32'b1110_00_0_1000_1_1001_0000_000000001000;
    #100 instruction = 32'b1110_01_0_0100_0_0000_0001_000000000000;
    #100 instruction = 32'b1110_01_0_0100_1_0000_1011_000000000000; 
    #5000 $stop;
  end;
endmodule
