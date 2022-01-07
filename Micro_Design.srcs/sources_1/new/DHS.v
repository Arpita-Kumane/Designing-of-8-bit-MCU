`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2021 10:22:38 PM
// Design Name: 
// Module Name: DHS
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


module DHS(DA_O, MA, RW, Comp_A, Comp_B, MB, DHS);
    
    input DA_O, MA, RW, Comp_A, Comp_B, MB;
    output DHS;
    reg DHS;
    wire [2:0] DA_O;
    wire MA, MB, Comp_A, Comp_B, RW;
    
    always@(*)begin
        DHS = ((DA_O[2]||DA_O[1]||DA_O[0]) && RW && Comp_A && !MA) || ((DA_O[2]||DA_O[1]||DA_O[0]) && RW && Comp_B && !MB);    
    end
    
    
endmodule

