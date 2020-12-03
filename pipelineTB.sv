`timescale 1ns/1ns

module pipelineTB();
  logic clk = 0;
  logic rst = 0;
  logic start = 0;
  logic done;

  pipeline DUT(clk, rst, start, done);

  parameter PERIOD = 15;

  always #PERIOD clk = ~clk;

  initial begin
    #5 rst = 1;
    #20 rst = 0;
    #400 $stop;
  end

endmodule
