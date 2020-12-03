module statusRegister(rst, clk, S, statusBits, statusOutput);
  input rst, clk, S;
  input [3:0]statusBits;

  output logic [3:0]statusOutput;

  always@(posedge clk)begin
    if(rst)
      statusOutput <= 0;
  end

  always@(negedge clk)begin
    if(S)
      statusOutput <= statusBits;
  end

endmodule
