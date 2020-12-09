`timescale 1ns/1ns

module instructionMem(address, instruction);

input [31:0]address;

output [31:0]instruction;

logic [7:0] ROM[0:1023];

assign instruction = {ROM[address + 3], ROM[address + 2], ROM[address + 1], ROM[address]};

integer fileDescriptor;
integer i;
logic [31:0]tempValue;
initial begin
	i = 0;
	fileDescriptor = $fopen("instructions.txt", "r");

	while(!$feof(fileDescriptor)) begin
		$fscanf(fileDescriptor, "%b\n", tempValue);
		{ROM[i + 3], ROM[i + 2], ROM[i + 1], ROM[i]} = tempValue;
		i = i + 4;
	end
	$fclose(fileDescriptor);
end

endmodule
