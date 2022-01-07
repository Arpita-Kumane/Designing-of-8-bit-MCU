`timescale 1ns / 1ps


module Data_memory(addr, data_in, data_out, wr_en, clk);
input clk, wr_en;
input[7:0] addr;
input[7:0] data_in;
output[7:0] data_out;

    reg[7:0]mem[255:0];
    reg[7:0]data_out;
    always@(posedge clk)
    begin
     if(wr_en)
        mem[addr] = data_in;
        data_out = mem[addr];
    end
endmodule
