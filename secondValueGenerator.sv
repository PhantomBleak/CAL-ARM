module immediateGenerator(shiftOperand, immediate);
  input [11:0]shiftOperand;

  output [31:0]immediate;

  logic [63:0]temp;

  assign temp = ({24'b0, shiftOperand[7:0], 24'b0, shiftOperand[7:0]} >> shiftOperand[11:8]) >> shiftOperand[11:8];
  assign immediate = temp[31:0];

endmodule

module registerShifter(shift, shiftImmediate, registerValue, shiftOutput);
  input [1:0]shift;
  input [4:0]shiftImmediate;
  input [31:0]registerValue;

  output logic [31:0]shiftOutput;
  logic [63:0]temp;

  always@(*)begin
    case(shift)
      2'b00: shiftOutput = registerValue << shiftImmediate;
      2'b01: shiftOutput = registerValue >> shiftImmediate;
      2'b10: shiftOutput = registerValue >>> shiftImmediate;
      2'b11: begin temp = {registerValue, registerValue} >> shiftImmediate; shiftOutput = temp[31:0]; end
      default: shiftOutput = 32'b0;
    endcase
  end
endmodule

module secondValueGenerator(loadOrStore, I, shiftOperand, RmValue, secondValue);
  input loadOrStore, I;
  input [11:0]shiftOperand;
  input [31:0]RmValue;

  output [31:0]secondValue;

  logic [31:0]immediate, shiftedRegister;
  immediateGenerator immGenerator(shiftOperand, immediate);
  registerShifter regShifter(shiftOperand[6:5], shiftOperand[11:7], RmValue, shiftedRegister);

  assign secondValue = (loadOrStore) ? {20'b0, shiftOperand} : (I) ? immediate : shiftedRegister;
endmodule
