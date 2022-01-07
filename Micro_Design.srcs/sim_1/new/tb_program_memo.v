`timescale 1ns / 1ps

module tb_program_memo();
reg[7:0] addr;
wire[16:0] instr;



Program_memory UUT(.addr(addr), .instr(instr));

initial
begin
addr <= 0;

#10;

addr <= 8'b10000010;

#10

 $finish;
end
endmodule






