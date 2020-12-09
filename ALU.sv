module ALU(value1, value2, carryIn, EXE_CMD, status, ALUResult);
  parameter WIDTH = 32;

  input [WIDTH - 1:0]value1, value2;
  input carryIn;
  input [3:0]EXE_CMD;

  output logic [WIDTH - 1:0]ALUResult;
  output [3:0]status;

  logic Z, N, tempC, C, V;
  always@(*)begin
    case(EXE_CMD)
      4'b0001: ALUResult = value2;
      4'b1001: ALUResult = ~value2;
      4'b0010: {tempC, ALUResult} = value1 + value2;
      4'b0011: {tempC, ALUResult} = value1 + value2 + carryIn;
      4'b0100: {tempC, ALUResult} = value1 + (~value2) + 1;
      4'b0101: {tempC, ALUResult} = value1 + (~value2) + 1 - carryIn;
      4'b0110: ALUResult = value1 & value2;
      4'b0111: ALUResult = value1 | value2;
      4'b1000: ALUResult = value1 ^ value2;
      default: {C, ALUResult} = 0;
    endcase
    Z = (ALUResult == 0);
    N = ALUResult[WIDTH - 1];
    V = ((EXE_CMD == 4'b0010 || EXE_CMD == 4'b0011) && (value1[WIDTH - 1] == value2[WIDTH - 1] &&
        value1[WIDTH - 1] != ALUResult[WIDTH - 1])) ||
        ((EXE_CMD == 4'b0100 || EXE_CMD == 4'b0101) && (value1[WIDTH - 1] != value2[WIDTH - 1] &&
        value2[WIDTH - 1] == ALUResult[WIDTH - 1]));
    C = ((EXE_CMD == 4'b0010 || EXE_CMD == 4'b0011) || (EXE_CMD == 4'b0100 || EXE_CMD == 4'b0101)) ? tempC : 0;
  end

  assign status = {N, Z, C, V};
endmodule
