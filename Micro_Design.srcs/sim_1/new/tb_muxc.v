`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2021 01:35:32 PM
// Design Name: 
// Module Name: tb_muxc
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


module tb_muxc();

    reg [1:0]BS ;
    reg Z, PS ;
    reg [7:0] PC_plusone, BrA,RAA; 
    wire [7:0] MC_out;
    //wire [16:0] inst;
  
    MUX_C UUT(.BS(BS),.RAA(RAA),.BrA(BrA),.Z(Z),.PS(PS),.PC_plusone(PC_plusone),.MC_out(MC_out));
    
    
    initial begin
         
            PC_plusone=8'b00000000;
            Z=0;
            PS=0;
            BS=2'b00;
            BrA=8'b00000000;
            RAA=8'b00000000;
            #10;
            
            PC_plusone=8'b00000000;
            Z=0;
            PS=0;
            BS=2'b01;
            BrA=8'b00000001;
            RAA=8'b00001000;
            #10;
            
            PC_plusone=8'b00000000;
            Z=0;
            PS=0;
            BS=2'b10;
            BrA=8'b00000010;
            RAA=8'b00000100;
            #10;
            
            PC_plusone=8'b00000000;
            Z=0;
            PS=0;
            BS=2'b11;
            BrA=8'b00000010;
            RAA=8'b00000100;
            #10;
            
            $finish;
            
            
    end
endmodule
