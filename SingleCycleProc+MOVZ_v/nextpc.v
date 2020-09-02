`timescale 1ns/1ps

module NextPCLogic(
    output reg [63:0] NextPC,
    input      [63:0] CurrentPC,
    input      [63:0] SignExtImm64,
    input             Branch,
    input             ALUZero,
    input             Uncondbranch
);

always @(*)     //combinational logic needs to be sensitive to all inputs
begin
    if (Uncondbranch || (Branch && ALUZero))
        NextPC = CurrentPC + (SignExtImm64 << 2);       //shift sign extender first before addition
    else
        NextPC = CurrentPC + 4;
end

endmodule

