`timescale 1ns / 1ps

module tb_alu();

reg[3:0] FS;
reg[7:0] A;
reg[7:0] B;
reg[3:0] SH;
wire[7:0] F;
wire flagZ, flagC, flagV, flagN;

 integer i;
 
alu UUT(.FS(FS), .SH(SH), .A(A), .B(B), .F(F), .flagZ(flagZ), .flagN(flagN), .flagC(flagC), .flagV(flagV));
initial begin
  FS = 4'b0;
  A = 8'd0;
  B = 8'd0;
  SH = 3'd1;


  #100   
 
  A = 8'hFF;
  B = 8'hFF;  

  for (i = 0; i < 16; i = i + 1) 
  begin

   FS = i;

   #20;
   end
   $finish;
 end

endmodule
