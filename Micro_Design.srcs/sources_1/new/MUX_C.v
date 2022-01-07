`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:13:34 AM
// Design Name: 
// Module Name: MUX_C
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


module MUX_C(PC_plusone,BrA,RAA,MC_out,PS,Z,BS);
input PS,Z;
input [7:0] BrA,RAA,PC_plusone;
input [1:0] BS;
output reg [7:0] MC_out;
reg [1:0] MC_select;

always@(BS,PS,Z)begin
MC_select[1] = BS[1];
MC_select[0] = ((PS^Z) | BS[1]) & BS[0];


case(MC_select)
2'b00: MC_out = PC_plusone;
2'b01: MC_out = BrA;
2'b10: MC_out = RAA;
2'b11: MC_out = BrA;
endcase
end
endmodule
