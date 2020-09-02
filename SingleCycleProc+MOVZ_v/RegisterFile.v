`timescale 1ns/1ps

module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    //declare I/O for RegisterFile
    output [63:0] BusA;
    output [63:0] BusB;
    input [63:0] BusW;
    input [4:0] RA;
    input [4:0] RB;
    input [4:0] RW;
    input RegWr;
    input Clk;

    //declare 32 registers each of size 64 bits
    reg [63:0] mem [31:0];

    //continually assign read outputs with RA and RB signals
    assign BusA = mem[RA];
    assign BusB = mem[RB];

    //assign register 31 to always be 0
    initial mem[31] = 64'b0;

    //@ negedge of the clk signal, write data from BusW into memory registers
    always@(negedge Clk)
    begin
        if(RegWr)
            if(RW != 5'd31)
                mem[RW] <= BusW;
    end

endmodule