`timescale 1ns / 1ps

module tb_data_mem();
reg clk;
reg wr_en;
reg [7:0] data_in;
reg [7:0] addr;
wire [7:0] data_out;

Data_memory UUT(.clk(clk), .data_in(data_in), .data_out(data_out), .wr_en(wr_en), .addr(addr));

initial begin
 clk = 1'b1;
 forever #20 clk = ~clk;
 end
 
 initial begin
wr_en =1'b1; addr = 8'haa; data_in = 8'h 6;
#100; wr_en = 1'b1; addr = 8'hcc; data_in = 8'hba;
#100; wr_en = 1'b0; addr = 8'hcc;
#100; wr_en = 1'b0; addr = 8'haa;


end
endmodule


