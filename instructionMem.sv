`timescale 1ns/1ns

module instructionMem(address, instruction);

input [31:0]address;

output [31:0]instruction;

logic [7:0] ROM[0:1023];

assign instruction = {ROM[address + 3], ROM[address + 2], ROM[address + 1], ROM[address]};

integer j;
initial begin
	for(j = 0; j < 1024; j = j + 1)
		ROM[j] = j % 256;
end

endmodule
