`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2021 10:24:35 PM
// Design Name: 
// Module Name: Branch_Detect
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


module Branch_Detect(BS_O, RW_b, BS_b, MW_b);
    input BS_O;
    output RW_b,BS_b,MW_b;
    reg RW_b, MW_b, BS_b;
    wire [1:0] BS_O;
    

    always@(*)begin
        RW_b = !(BS_O[0] || BS_O[1]);
        BS_b= !(BS_O[0] || BS_O[1]);
        MW_b = !(BS_O[0] || BS_O[1]);
    end
    
endmodule