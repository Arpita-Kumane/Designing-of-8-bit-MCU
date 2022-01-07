`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:19:29 AM
// Design Name: 
// Module Name: MUX_D
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_D(F,D_out,MD,bus_D);
input [7:0] F,D_out;
input [1:0] MD;
output reg [7:0] bus_D;
//assign c = 7'b0000000;
always@(MD)
begin
if(MD == 0)
begin
bus_D = F;
end
else
begin
bus_D = D_out;
end
end
endmodule
