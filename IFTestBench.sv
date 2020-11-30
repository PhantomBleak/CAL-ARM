`timescale 1ns/1ns

module TB();
logic clk, rst;

logic done;

pipeline DUT(clk, rst, 1'b0, done);


always
begin
clk <= 0; #10;
clk <= 1; #10;
end

initial begin
rst <= 1; #15
rst <= 0;
#500 $stop;
end

endmodule
