`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2021 09:59:36 AM
// Design Name: 
// Module Name: tb_data_memory
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


module tb_data_memory();
reg clk;
reg[7:0] data_in;
reg[7:0] addr;
reg wr;
reg rd;
wire[7:0] data_out;
reg[7:0]mem[0:255];

data_memory uut(.clk(clk), .data_in(data_in), .addr(addr), .wr(wr), .rd(rd), .data_out(data_out));
always
begin
    clk=1;
    #10;
    clk=0;
    #10;
 end 
 initial begin
    $readmemb("memfile.dat",mem);
        data_in= 8'b0000000; addr= 8'b0010010; wr=1; rd=0; #20;
        data_in= 8'b0000000; addr= 8'b0010010; wr=0; rd=1; #20;
 end
endmodule
