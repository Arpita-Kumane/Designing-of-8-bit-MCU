`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 06:45:27 PM
// Design Name: 
// Module Name: MCU_main
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


module MCU_main(clk);
input wire clk;
reg [7:0] address;
reg [7:0] PC,PC_1,PC_2, PC_3;
reg [16:0] IR;
reg RW,PS,MW,MA,MB,CS,SH;
reg [1:0] MD,BS;
reg [2:0] DA,AA,BA;
reg [3:0] FS;
reg [7:0] A_Data,B_Data;
reg [7:0] Bus_A, Bus_B;
reg [7:0] ALU_F, RAA, BrA;
reg [7:0] Data_Mem_Out;
reg Comp_A, Comp_B;
reg [5:0] IM;

wire [16:0] Instr;
wire [7:0] MC_out;//MUX C wire output
wire RW_w,PS_w,MW_w,MA_w,MB_w,CS_w;
wire [1:0] MD_w,BS_w;
wire [2:0] DA_w,AA_w,BA_w;
wire [7:0] Data_In_w;
wire [3:0] FS_w;
wire [7:0] A_Data_w,B_Data_w;
wire [2:0] SH_w;
wire [7:0] CS_Out_w;
wire [7:0] BrA_w, RAA_w;
wire Zero_w, Negative_w, Carry_w, Overflow_w;
wire [7:0] BusA_w, BusB_w;
wire [7:0] F_ALUOut_w;
wire [7:0] Data_Mem_Out_w;
wire [7:0] BusD_w;
wire DHS_w;

//Stage 1 (Fetch cycle)
Program_memory P_mem(.addr(address),.instr(Instr));


//Stage 2 (Decode Cycle)
Instr_Dec InstrDec(.instr(IR),.RW(RW_w),.DA(DA_w),.MD(MD_w),.BS(BS_w),.PS(PS_w),.MW(MW_w),.FS(FS_w),.MA(MA_w),.MB(MB_w),.AA(AA_w),.BA(BA_w),.CS(CS_w));
MUX_C MuxC(.PC_plusone(PC),.BrA(BrA),.RAA(RAA),.MC_out(MC_out),.PS(PS),.Z(Zero_w),.BS(BS));
const_unit constU(.CS(CS_w),.CS_in(IM),.CS_out(CS_Out_w));
Register_file RegFile(.clk(clk), .wr_en(RW), .A_addr(AA_w),.B_addr(BA_w),.D_addr(DA),.Data_in(MD_w), .A_data(A_Data_w), .B_data(B_Data_w));
MUX_A MuxA(.A_data(A_Data_w),.pc_1(PC_1),.bus_A(BusA_w),.MA(MA_w));
MUX_B MuxB(.B_data(B_Data_w),.CS_out(CS_Out_w),.bus_B(BusB_w),.MB(MB_w));

//stage 3 (Execute Cycle)
alu alu(.FS(FS_w), .A(Bus_A), .B(Bus_B), .F(F_ALUOut_w), .flagZ(Zero_w), .flagN(Negative_w), .flagC(Carry_w), .flagV(Overflow_w), .SH(SH));
Data_memory Data_mem(.addr(Bus_A), .data_in(Bus_B), .data_out(Data_Mem_Out_w), .wr_en(MW_w), .clk(clk));

//stage 4 (write back cycle)
MUX_D MuxD(.F(F_ALUOut_w),.D_out(Data_Mem_Out_w),.MD(MD_w),.bus_D(BusD_w));
//Register_file RegFile1(.clk(clk), .wr_en(RW), .A_addr(AA_w),.B_addr(BA_w),.D_addr(DA),.Data_in(MD_w), .A_data(A_Data_w), .B_data(B_Data_w));

//Data Hazard
Branch_Detect BrDetect(.BS_O(BS), .RW_b(RW_w), .BS_b(BS_w), .MW_b(MW_w));
DHS DataHazard(.DA_O(DA), .MA(MA_w), .RW(RW), .Comp_A(Comp_A), .Comp_B(Comp_B), .MB(MB_w), .DHS(DHS_w));

 
    initial begin
        
        PC <= 8'b00000000;
        
        PC_1 <= 8'b00000000;
        PC_2 <= 8'b00000000;
        PC_3 <= 8'b00000000;
        IR = 17'd0;
        
        #10;
        //repeat(5) @ (posedge clk);
        
        
    end
    
    always@(posedge clk)begin
        
        PC = MC_out;
        PC_1 = (PC - 1'b1);
        PC_2 = (PC_1 - 1'b1);
        //PC_3 = (PC_2 - 1'b1);
        
        if(DHS_w)begin
            PC = PC;
            PC_1 = PC_1;
            PC_2 = PC_2;
            //DHS = 0;
        end
        
        
        
    end 
    
    always@(PC)begin
        
        address = PC;
        //BSM = BS;
    end
    
    always@(PC_1)begin
        IR = Instr ;
        SH = IR [2:0];
        IM = IR [5:0];
        //PC = MC_out;
        
        Comp_A = (DA == AA) ? 1 : 0;
        Comp_B = (DA == BA) ? 1 : 0;
        
    end
    
    always@(PC_2)begin
        Bus_A = BusA_w;
        Bus_B = BusB_w;
        RAA = Bus_A;
        
        BS = BS && (DHS_w || BS_w);
        PS = PS_w; 
        MW = MW_w && (DHS_w || MW_w);
        FS = FS_w; 
        //SH = SH_w;
         
        
        
        
        RW = RW_w && (DHS_w || RW_w);
        DA = DA_w && DHS_w;
        MD = MD_w;
        
        BrA = PC_2 + Bus_B;
        
        ALU_F = F_ALUOut_w;
        Data_Mem_Out = Data_Mem_Out_w;
    end
    
    always@(PC_3)begin
        
    end    
endmodule
