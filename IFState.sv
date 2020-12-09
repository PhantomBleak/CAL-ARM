module IFState(rst, clk, freeze, flush, branchAddress, PC, instruction);

input rst, clk, freeze, flush;
input [31:0]branchAddress;

output [31:0]PC;
output [31:0]instruction;

logic [31:0]adderOut;
logic [31:0]PCMuxOut;
muxPrototype #(.WIDTH(32))PCMux(branchAddress, adderOut, flush, PCMuxOut);

logic [31:0]PCOut;
PCRegister PCRegister(rst, clk, freeze, PCMuxOut, PCOut);

logic [31:0]insOut;
instructionMem instructionMem(PCOut, insOut);

adder #(.WIDTH(32))PCAdder(PCOut, 32'd4, adderOut);

IFRegister IFRegister(rst, clk, freeze, flush, insOut, adderOut, instruction, PC);

endmodule
