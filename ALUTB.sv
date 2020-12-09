`timescale 1ns/1ns

module ALUTB();
  logic [3:0]value1, value2, EXE_CMD;
  logic carryIn;

  logic [3:0]status, ALUResult;

  ALU #(.WIDTH(4))DUT(value1, value2, carryIn, EXE_CMD, status, ALUResult);

  initial begin
    value1 = 0;
    value2 = 0;
    carryIn = 0;
    EXE_CMD = 0;
    #100;
    value1 = 4'b0001;
    #100;
    value2 = 4'b0100;
    #100;
    EXE_CMD = 4'b0001; //move
    #100;
    EXE_CMD = 4'b1001; //movenot
    #100;
    EXE_CMD = 4'b0010; //add
    #100;
    carryIn = 1;
    #100;
    EXE_CMD = 4'b0011; //add with carry
    #100;
    EXE_CMD = 4'b0100; //sub
    #100;
    EXE_CMD = 4'b0101; //sub with carry
    #100;
    EXE_CMD = 4'b0110; //and
    #100;
    EXE_CMD = 4'b0111; //or
    #100;
    EXE_CMD = 4'b1000; //xor
    #100;
    value2 = 4'b0111;
    EXE_CMD = 4'b0010;
    #500 $stop;
  end
endmodule
