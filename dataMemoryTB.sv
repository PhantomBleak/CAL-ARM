`timescale 1ns/1ns

module dataMemoryTB();
  logic clk, MEM_W_EN, MEM_R_EN;
  logic [31:0]storeValue;
  logic [31:0]address;
  logic [31:0]loadValue;

  dataMemory DUT(clk, storeValue, address, MEM_W_EN, MEM_R_EN, loadValue);

  always #10 clk = ~ clk;

  initial begin
    clk = 0;
    MEM_W_EN = 0;
    MEM_R_EN = 0;
    storeValue = 32'd10;
    address = 32'd1024;
    #40 MEM_W_EN = 1;
    #40 address = 32'd1029;
    #40 MEM_W_EN = 0;
    #40 address = 32'd1025;
    #40 MEM_R_EN = 1;
    #100 $stop;
  end
endmodule
