`timescale 1ns / 1ps


module Program_memory(addr, instr);
input[7:0] addr;
output[16:0] instr;

reg[16:0]mem[255:0];
reg[16:0] instr;



 integer i;
 initial begin
 for(i=0; i<256; i = i+1) begin
case(i)
    0:mem[i]<=17'b10001001000000001;
    1:mem[i]<=17'b10001010000000100;
    2:mem[i]<=17'b00001011001000010;
    3:mem[i]<=17'b00101100001011000;
    4:mem[i]<=17'b10011101100000011;
    5:mem[i]<=17'b01111001011101000;
    6:mem[i]<=17'b01000010101011000;
    7:mem[i]<=17'b10000111011000000;
    8:mem[i]<=17'b01001110111000000;
    9:mem[i]<=17'b01101000010110000;
    10:mem[i]<=17'b00111001010000000;
    default: mem[i]<=17'b10001001000000001;
 endcase 
 end
 end
 always @(addr)
   begin
  instr = mem[addr];  
  end
endmodule
