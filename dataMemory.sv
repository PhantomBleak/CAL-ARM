module dataMemory(clk, storeValue, address, MEM_W_EN, MEM_R_EN, memoryData);
  input clk, MEM_W_EN, MEM_R_EN;
  input [31:0]storeValue;
  input [31:0]address;

  output logic [31:0]memoryData;

  logic [7:0] memory[0:255];

  logic [31:0]internalAddress;
  assign internalAddress = address - 1024;

  always@(posedge clk)begin
    if(MEM_W_EN)
      case(internalAddress[1:0])
        2'b00: {memory[internalAddress + 3], memory[internalAddress + 2], memory[internalAddress + 1],
                memory[internalAddress]} <= storeValue;
        2'b01: {memory[internalAddress + 2], memory[internalAddress + 1], memory[internalAddress],
                memory[internalAddress - 1]} <= storeValue;
        2'b10: {memory[internalAddress + 1], memory[internalAddress], memory[internalAddress - 1],
                memory[internalAddress - 2]} <= storeValue;
        2'b11: {memory[internalAddress], memory[internalAddress - 1], memory[internalAddress - 2],
                memory[internalAddress - 3]} <= storeValue;
        endcase
  end

  always@(*)begin
    if(MEM_R_EN)begin
      case(internalAddress[1:0])
        2'b00: memoryData <= {memory[internalAddress + 3], memory[internalAddress + 2], memory[internalAddress + 1],
                             memory[internalAddress]};
        2'b01: memoryData <= {memory[internalAddress + 2], memory[internalAddress + 1], memory[internalAddress],
                             memory[internalAddress - 1]};
        2'b10: memoryData <= {memory[internalAddress + 1], memory[internalAddress], memory[internalAddress - 1],
                             memory[internalAddress - 2]};
        2'b11: memoryData <= {memory[internalAddress], memory[internalAddress - 1], memory[internalAddress - 2],
                             memory[internalAddress - 3]};
        default: memoryData <= 0;
      endcase
    end
    else
      memoryData <= 0;
  end

endmodule
