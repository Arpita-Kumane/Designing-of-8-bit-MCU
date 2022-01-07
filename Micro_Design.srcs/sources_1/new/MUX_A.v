`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:01:06 AM
// Design Name: 
// Module Name: MUX_A
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


module MUX_A(A_data,pc_1,bus_A,MA);
input [7:0] A_data;
input [7:0] pc_1;
input MA;
output reg [7:0] bus_A;
always@(MA)
begin
if(MA == 0)
begin
bus_A = A_data;
end
else
begin
bus_A = pc_1;
end
end
endmodule

    


