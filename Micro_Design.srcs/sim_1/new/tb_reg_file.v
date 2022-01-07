`timescale 1ns / 1ps


module tb_reg_file();
    reg clk, wr_en;
    reg[2:0] A_addr;
    reg[2:0] B_addr;
    reg[2:0] D_addr;
    reg[7:0] Data_in;
    wire[7:0] A_data;
    wire[7:0] B_data;
    
    always #10 clk =~clk;
    
    Register_file UUT(.clk(clk), .A_addr(A_addr), .wr_en(wr_en), .B_addr(B_addr), .D_addr(D_addr), .Data_in(Data_in), .A_data(A_data), .B_data(B_data));
    initial begin
        clk = 1'b1;
        
        wr_en <= 0;       
       
    #100;
    
    D_addr = 3'd1; Data_in = 8'd6; 
    #100; wr_en <= 1'b1;
    #100;
    D_addr = 3'd2; Data_in = 8'haa; wr_en <= 1'b1; 
    #100; wr_en <= 1'b0; A_addr = 3'd1;
    #100; wr_en <= 1'b0; B_addr = 3'd2;
    end
    endmodule
