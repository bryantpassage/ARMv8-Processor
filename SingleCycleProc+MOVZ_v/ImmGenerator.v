`timescale 1 ns/1 ps

module ImmGenerator(Imm64, Imm26, Ctrl); 
  output reg [63:0] Imm64; 
  input [25:0] Imm26; 
  input [2:0] Ctrl; 

  always@(*) begin
    if(Ctrl == 2'b000) //I-type instruction
    	Imm64 = {52'b0, Imm26[21:10]};
    else if(Ctrl == 2'b001) //D-type instruction
    	Imm64 = {{55{Imm26[20]}}, Imm26[20:12]};
    else if(Ctrl == 2'b010) //B instruction
    	Imm64 = {{38{Imm26[25]}}, Imm26[25:0]};
    else if(Ctrl == 2'b011)	//CBZ instruction
    	Imm64 = {{45{Imm26[23]}}, Imm26[23:5]};
    else
      Imm64 = {48'b0, Imm26[20:5]} << (Imm26[22:21] * 16); //MOVZ instruction
      
  end

endmodule
