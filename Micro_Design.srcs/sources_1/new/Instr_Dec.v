`timescale 1ns / 1ps

module Instr_Dec(instr,RW,DA,MD,BS,PS,MW,FS,MA,MB,AA,BA,CS);
input wire [16:0] instr;
output reg RW, PS, MW, MA, MB, CS;
output reg [1:0] MD;
output reg [1:0] BS;
output reg [2:0] DA;
output reg [2:0] AA;
output reg [2:0] BA;
output reg [3:0] FS;
reg [4:0] OP;

always @(*) begin
OP <= instr[16:12];
case(OP)

    5'b00000: begin RW = 1'b0;PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = 0; AA = 0; BA = 0; FS = 4'b0; end //NOP
    5'b00001: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b1; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b0101;end//XOR-immediate
    5'b00010: begin RW = 1'b0; PS = 1'b0; MW = 1'b0; MA = 1'b1; MB = 1'b1; CS = 1'b1; MD = 2'b0; BS = 2'b01; DA = 0; AA = instr[8:6]; BA = 0; FS = 4'b0;end//BZ
    5'b00011: begin RW = 1'b0; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 1'b0; BS = 2'b10; DA = 0; AA = instr[8:6]; BA = 0; FS = 4'b0;end//JR
    5'b00100: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = instr[5:3]; FS = 4'b1111;end//Add
    5'b00101: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = instr[5:3]; FS = 4'b11;end//AND
   // 5'b00110:input 
    5'b00111: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b1; CS = 1'b0; MD = 2'b01; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b0;end//LD
    5'b01000: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = instr[5:3]; FS = 4'b1;end//SUB
    5'b01001: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b1000;end//CMP
    5'b01010: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b1; MB = 1'b1; CS = 1'b1; MD = 2'b0; BS = 2'b11; DA = instr[11:9]; AA = 0; BA = 0; FS = 4'b0;end//JL
    5'b01011: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b1; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b1111;end//ADD imm unsigned
    5'b01100: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b1; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA =  instr[5:3]; FS = 4'b100;end//OR Imm
    5'b01101: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 1'b0; BS = 2'b0; DA = instr[11:9]; AA = 0; BA = 0; FS = 4'b0;end//ST
   // 5'b01110:output 
    5'b01111: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = instr[5:3]; FS = 4'b111;end//Set if less than
    5'b10000: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b1; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b0;end//Move
    5'b10001: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b1; CS = 1'b1; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b1111;end//ADD Imm
    5'b10010: begin RW = 1'b0; PS = 1'b1; MW = 1'b0; MA = 1'b1; MB = 1'b1; CS = 1'b1; MD = 2'b0; BS = 2'b01; DA = instr[11:9]; AA = 0; BA = 0; FS = 4'b0;end//BNZ
    5'b10011: begin RW = 1'b1; PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = instr[11:9]; AA = instr[8:6]; BA = 0; FS = 4'b110;end//Logical Shift left
    5'b10100: begin RW = 1'b0; PS = 1'b0; MW = 1'b0; MA = 1'b1; MB = 1'b1; CS = 1'b1; MD = 2'b0; BS = 2'b11; DA = 0; AA = 0; BA = 0; FS = 4'b0;end//Jump
    default: begin RW = 1'b0;PS = 1'b0; MW = 1'b0; MA = 1'b0; MB = 1'b0; CS = 1'b0; MD = 2'b0; BS = 2'b0; DA = 0; AA = 0; BA = 0; FS = 4'b0;end
endcase
end
endmodule

    
    
 
    


