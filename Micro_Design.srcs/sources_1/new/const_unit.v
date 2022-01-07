`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:23:49 AM
// Design Name: 
// Module Name: const_unit
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


module const_unit(CS,CS_in,CS_out);
input CS;
input [5:0] CS_in;
output reg [7:0] CS_out;
always@(CS)
if(CS == 1'b0) begin
    CS_out = 8'b0 + CS_in;
end
else if(CS == 1'b1 && CS_in[5] == 1'b1)begin
    CS_out = 8'b11000000 + CS_in;
end
else if(CS == 1'b1 && CS_in[5] == 1'b0) begin
    CS_out = 8'b0 + CS_in;
end
endmodule
