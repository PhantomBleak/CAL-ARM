`timescale 1ns/1ns

module pipeline(clk, rst, start, done);

input clk, rst, start;

output done;

logic [9:0]PCAdderOut;
logic [9:0]PCMuxOut;
muxPrototype #(.WIDTH(10))PCMux(10'b0, PCAdderOut, 1'b0, PCMuxOut);

logic [9:0]PCOut;
PCRegister PC(1'b0, rst, clk, PCMuxOut, PCOut);

logic [31:0]insMemOut;
instructionMem instructionMemory(PCOut, insMemOut);

Adder #(.WIDTH(10))PCAdder(PCOut, 10'd4, PCAdderOut);

logic [31:0]IFOutput;
logic [9:0]IFPCOut;
IFRegister IFReg(1'b0, 1'b0, rst, clk, insMemOut, PCAdderOut, IFOutput, IFPCOut);

assign done = 1;

endmodule