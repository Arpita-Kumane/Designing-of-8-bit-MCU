`timescale 1ns / 1ps

module tb_Instr_Dec();
reg [16:0]instr;
wire RW, PS, MW, MA, MB, CS;
wire [1:0] MD;
wire [1:0] BS;
wire [2:0] DA;
wire [2:0] AA;
wire [2:0] BA;
wire [3:0] FS;


Instr_Dec UUT(.instr(instr),.RW(RW),.PS(PS),.MW(MW),.MA(MA),.MB(MB),.CS(CS),.MD(MD),.BS(BS),.DA(DA),.AA(AA),.BA(BA),.FS(FS));
initial begin
instr = 17'd0;
#10;
instr = 17'b10001001000000001;
#10;
instr = 17'b10001010000000100;
#10;
instr = 17'b00001011001000010;
#10;
instr = 17'b00101100001011000;
#10;
instr = 17'b10011101100000011;
#10;
instr = 17'b01111001011101000;
#10;
instr = 17'b01000010101011000;
#10;
instr = 17'b10000111011000000;
#10;
instr = 17'b01001110111000000;
#10;
instr = 17'b01101000010110000;
#10;
instr = 17'b00111001010000000;
#10;
instr = 17'b10001001000000001;
#10;
end
endmodule
