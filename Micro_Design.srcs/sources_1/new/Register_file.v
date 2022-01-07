`timescale 1ns / 1ps


module Register_file(clk, wr_en, A_addr,B_addr, D_addr, Data_in, A_data, B_data);
input clk, wr_en;
input[2:0] A_addr;
input[2:0] B_addr;
input[2:0] D_addr;
input[7:0] Data_in;
output reg[7:0] A_data;
output reg [7:0] B_data;
    
reg[7:0]array_reg[7:0];

always @(negedge clk) begin
 if(D_addr != 0) begin
 if(wr_en) begin
array_reg[D_addr] <= Data_in;
end
end
assign A_data = array_reg[A_addr];
assign B_data = array_reg[B_addr];
end
endmodule
