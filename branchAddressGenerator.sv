module shiftAndSignExtend(signedImmediate, extendedImmediate);
  input [23:0]signedImmediate;

  output [31:0]extendedImmediate;

  logic [31:0]temp;

  assign temp = (signedImmediate[23]) ? {8'b11111111, signedImmediate} : {8'b00000000, signedImmediate};
  assign extendedImmediate = temp << 2;

endmodule

module branchAddressGenerator(signedImmediate, PC, branchAddress);
  input [23:0]signedImmediate;
  input [31:0]PC;

  output [31:0]branchAddress;

  logic [31:0]extendedImmediate;
  shiftAndSignExtend shiftAndSignExtend(signedImmediate, extendedImmediate);

  assign branchAddress = PC + extendedImmediate + 4;

endmodule
