`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 04:59:39 PM
// Design Name: 
// Module Name: adder
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


module adder(PC, BusB, BrA);
input [7:0] PC;
input [7:0] BusB;
output reg [7:0] BrA;

always @ (PC or BusB)
begin
BrA = PC + BusB;
end
endmodule
