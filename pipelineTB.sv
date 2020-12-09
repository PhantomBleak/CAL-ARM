`timescale 1ns/1ns

module PipelineTB();
  logic clk = 0;
  logic rst = 0;

  pipeline DUT(rst, clk);

  always #50 clk = ~ clk;

  initial begin
    #20 rst = 1;
    #80 rst = 0;
    #50000 $stop;
  end
endmodule
