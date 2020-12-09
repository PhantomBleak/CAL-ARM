module HazardDetectionUnit(RnAddress, RmAddress, Two_src, EXE_WB_EN, EXE_Dest, MEM_WB_EN, MEM_Dest, hazard);
  input [3:0]RnAddress, RmAddress, EXE_Dest, MEM_Dest;
  input Two_src, EXE_WB_EN, MEM_WB_EN;

  output hazard;

  assign hazard = ((EXE_WB_EN && RnAddress == EXE_Dest) || (MEM_WB_EN && RnAddress == MEM_Dest)) ||
                  (Two_src && ((EXE_WB_EN && RmAddress == EXE_Dest) || (MEM_WB_EN && RmAddress == MEM_Dest)));

  endmodule
