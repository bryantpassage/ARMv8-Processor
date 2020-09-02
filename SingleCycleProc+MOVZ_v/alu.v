`timescale 1 ns/1 ps

`define ALUOP_AND    4'b0000
`define ALUOP_ORR    4'b0001
`define ALUOP_ADD    4'b0010
`define ALUOP_SUB    4'b0110
`define ALUOP_PASSB  4'b0111

module alu(
    //output reg [63:0] busW,
    output     [63:0] busW,
    output            zero,
    input      [63:0] busA,
    input      [63:0] busB,
    input      [3:0]  ctrl
);

wire [63:0] subresults [15:0];

assign busW = subresults[ctrl];			//assigning the result bus

// Assign subresults
assign subresults[`ALUOP_AND   ] = busA & busB;	//and operation
assign subresults[`ALUOP_ORR   ] = busA | busB;	//or operation
assign subresults[`ALUOP_ADD   ] = busA + busB;	//add operation
assign subresults[`ALUOP_SUB   ] = busA - busB;	//sub operation
assign subresults[`ALUOP_PASSB ] = busB;	//pass operation

assign zero = subresults[ctrl] == 0 ? 1'b1:1'b0; //check whether the resulting operation equals 0

endmodule

