`timescale 1ns/1ns

module HazardTB();
  logic [3:0]RnAddress, RmAddress, EXE_Dest, MEM_Dest;
  logic Two_src, EXE_WB_EN, MEM_WB_EN;

  logic hazard;

  HazardDetectionUnit DUT(RnAddress, RmAddress, Two_src, EXE_WB_EN, EXE_Dest, MEM_WB_EN, MEM_Dest, hazard);

  initial begin
    RnAddress = 4'b0;
    RmAddress = 4'b0;
    EXE_Dest = 4'b0;
    MEM_Dest = 4'b0;
    Two_src = 0;
    EXE_WB_EN = 0;
    MEM_WB_EN = 0;
    #100;
    RnAddress = 4'b0001;
    EXE_Dest = 4'b0001;
    MEM_Dest = 4'b0001;
    #100;
    EXE_WB_EN = 1;
    #100;
    EXE_WB_EN = 0;
    #100;
    MEM_WB_EN = 1;
    #100;
    MEM_WB_EN = 0;
    RnAddress = 4'b0000;
    RmAddress = 4'b0001;
    #100;
    EXE_WB_EN = 1;
    #100;
    Two_src = 1;
    #100;
    Two_src = 0;
    EXE_WB_EN = 0;
    #100;
    MEM_WB_EN = 1;
    #100;
    Two_src = 1;
    #100;
    MEM_WB_EN = 0;
    Two_src = 0;
    #500 $stop;
  end
endmodule
