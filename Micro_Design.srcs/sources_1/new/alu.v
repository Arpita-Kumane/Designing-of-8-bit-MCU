`timescale 1ns / 1ps

module alu(FS, A, B, F, flagZ, flagN, flagC, flagV, SH);
input[3:0] FS;
input[7:0] A;
input[7:0] B;
input[2:0] SH;
output reg[7:0] F;
output reg flagZ, flagC, flagV, flagN;
reg [7:0]x;
wire[8:0] count;
assign count = {1'b0, A} + {1'b0, B};

always @(FS)
begin
    case(FS)
        4'b1111: F = A + B;
        4'b0001: F = A + (~B) + 1;
        4'b0011: F = A & B;
        4'b0100: F = A | B;
        4'b0101: F = A ^ B;
        4'b0110: F = A << SH;
        4'b0111: F = (A < B) ? 1:0;
        4'b1000: F = ~A;
        default: F = 0;
     endcase
end
always @ (F) begin

   flagC  = count[8];
   flagZ  = (F == 8'b0); 
   flagN = (F[7]) ? 1:0;
   if(FS == 4'b1111)begin
   flagV = ((A[7]==B[7]) && (A[7] != F[7])) ? 0:1;
   end
   if(FS == 4'b0001) begin
   x = ~B + 1'b1;
   flagV = ((A[7]== x[7]) && (x[7] != F[7])) ? 0:1;
   end
   
   
end
endmodule
