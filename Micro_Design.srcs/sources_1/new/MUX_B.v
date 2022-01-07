`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:09:36 AM
// Design Name: 
// Module Name: MUX_B
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


module MUX_B(B_data,CS_out,bus_B,MB);
input [7:0] B_data;
input [7:0] CS_out;
input MB;
output reg [7:0] bus_B;
always@(MB)
begin
if(MB == 0)
begin
bus_B = B_data;
end
else
begin
bus_B = CS_out;
end
end
endmodule