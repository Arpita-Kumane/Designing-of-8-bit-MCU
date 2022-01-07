`timescale 1ns / 1ps

module MCU_MainUnit(
input clk,
input reset,
output [7:0]PCo,
output [7:0]PC_1o,
output [7:0]PC_2o,
output [16:0]IF_DOF_IRo,
output DOF_EX_RWo,
output [2:0]DOF_EX_RDo,
output [1:0]DOF_EX_MDo,
output[1:0]DOF_EX_BSo,
output DOF_EX_PSo,
output DOF_EX_MWo,
output [3:0]DOF_EX_FSo,
output [2:0]DOF_EX_SHo,
output [7:0]DOF_EX_BuAo,
output [7:0]DOF_EX_BuBo,
output EX_WB_RWo,
output [2:0]EX_WB_RDo,
output [1:0]EX_WB_MDo,
output [7:0]EX_WB_MD0o,
output [7:0]EX_WB_MD1o,
output EX_WB_MD2o,
output [2:0]DOF_RF_RAo,
output [2:0]DOF_RF_RBo,
output [7:0]DOF_RF_Ao,
output [7:0]DOF_RF_Bo
);

//Registers
reg [7:0]PC;
reg [7:0]PC_1;
reg [7:0]PC_2;
reg [16:0]IF_DOF_IR;
reg DOF_EX_RW;
reg [2:0]DOF_EX_RD;
reg [1:0]DOF_EX_MD;
reg [1:0]DOF_EX_BS;
reg DOF_EX_PS;
reg DOF_EX_MW;
reg [3:0]DOF_EX_FS;
reg [2:0]DOF_EX_SH;
reg [7:0]DOF_EX_BuA;
reg [7:0]DOF_EX_BuB;
reg EX_WB_RW;
reg [2:0]EX_WB_RD;
reg [1:0]EX_WB_MD;
reg [7:0]EX_WB_MD0;
reg [7:0]EX_WB_MD1;
reg EX_WB_MD2;

//wires
wire [7:0]IF_IM_PC;
wire [16:0]IF_IM_IR;
//decode stage wires
wire [16:0]DOF_ID_IR;
wire DOF_ID_RW;
wire [2:0]DOF_ID_RD;
wire [1:0]DOF_ID_MD;
wire [1:0]DOF_ID_BS;
wire DOF_ID_PS;
wire DOF_ID_MW;
wire [3:0]DOF_ID_FS;
wire [2:0]DOF_ID_SH;
wire DOF_ID_MA;
wire DOF_ID_MB;
wire [2:0]DOF_ID_RA;
wire [2:0]DOF_ID_RB;
wire DOF_ID_CS;
wire [2:0]DOF_RF_AA;
wire [2:0]DOF_RF_BA;
wire [7:0]DOF_RF_PoA;
wire [7:0]DOF_RF_PoB;
//execute stage wires
wire [7:0]EX_ALU_A;
wire [7:0]EX_ALU_B;
wire [3:0]EX_ALU_FS;
wire [2:0]EX_ALU_SH;
wire EX_ALU_Z;
wire EX_ALU_V;
wire EX_ALU_N;
wire EX_ALU_C;
wire [7:0]EX_ALU_F;
wire EX_DM_MW;
wire [7:0]EX_DM_MEA;
wire [7:0]EX_DM_MWD;
wire [7:0]EX_DM_MRD;
//write back stage wires 
wire WB_RF_RW;
wire [2:0]WB_RF_DA;
wire [7:0]WB_RF_Din;
wire comp_1;
wire comp_2;
wire HA;
wire HB;
wire DHS;
wire BHS;


Register_file RegFile(
.clk(clk),
.A_addr(DOF_RF_AA),
.B_addr(DOF_RF_BA),
.A_data(DOF_RF_PoA),
.B_data(DOF_RF_PoB),
.wr_en(WB_RF_RW),
.D_addr(WB_RF_DA),
.Data_in(WB_RF_Din)
);

Program_memory P_mem(
.addr(IF_IM_PC),
.instr(IF_IM_IR)
);


Instr_Dec InstrDec(
.instr(DOF_ID_IR),
.RW(DOF_ID_RW),
.MW(DOF_ID_MW),
.MA(DOF_ID_MA),
.MB(DOF_ID_MB),
.MD(DOF_ID_MD),
.AA(DOF_ID_RA),
.BA(DOF_ID_RB),
.DA(DOF_ID_RD),
.BS(DOF_ID_BS),
.PS(DOF_ID_PS),
.FS(DOF_ID_FS),
.CS(DOF_ID_CS)
);


alu alu(
.A(EX_ALU_A),
.B(EX_ALU_B),
.FS(EX_ALU_FS),
.SH(EX_ALU_SH),
.flagZ(EX_ALU_Z),
.flagV(EX_ALU_V),
.flagN(EX_ALU_N),
.flagC(EX_ALU_C),
.F(EX_ALU_F)
);


Data_memory dataMem(
.clk(clk),
.wr_en(EX_DM_MW),
.addr(EX_DM_MEA),
.data_in(EX_DM_MWD),
.data_out(EX_DM_MRD)
);


always @ (posedge clk)
begin
if(reset)
  PC<=8'b0;
//else if (DHS); 
else
begin
  PC_2<=PC_1;
  PC_1<=PC+1;
case(DOF_EX_BS)
  2'b00:PC<=PC+1;
  2'b01:begin
    if(DOF_EX_PS^EX_ALU_Z)
      PC<=DOF_EX_BuB+PC_2;
    else
      PC<=PC+1;
   end
   2'b10:PC<=DOF_EX_BuA;
   2'b11:PC<=DOF_EX_BuB+PC_2;
   default:PC<=PC+1;
   endcase
  end
 end
 
 always @(posedge clk)//zxm reset 
 begin
 //If
 //if(DHS);
 //else 
 if(BHS)
 IF_DOF_IR<=0;
 else
 IF_DOF_IR<=IF_IM_IR;
 //DOF
 if(DHS|BHS)
 DOF_EX_RW<=0;
 else
 DOF_EX_RW<=DOF_ID_RW;
 if(DHS)
 DOF_EX_RD<=0;
 else
 DOF_EX_RD<=DOF_ID_RD;
 DOF_EX_MD<=DOF_ID_MD;
 if(DHS|BHS)
 DOF_EX_BS<=0;
 else
 DOF_EX_BS<=DOF_ID_BS;
 DOF_EX_PS<=DOF_ID_PS;
 if(DHS|BHS)
 DOF_EX_MW<=0;
 else
 DOF_EX_MW<=DOF_ID_MW;
 DOF_EX_FS<=DOF_ID_FS;
 DOF_EX_SH<=DOF_ID_SH;
 
 if (DOF_ID_MA)
 begin
 DOF_EX_BuA<=PC_1;
 end
 else
 begin
 DOF_EX_BuA<=DOF_RF_PoA;
 end
 
 if (DOF_ID_MB)
 begin
 DOF_EX_BuB[5:0]<=IF_DOF_IR[5:0];
  if(DOF_ID_CS)
  DOF_EX_BuB[7:6]=2'b11;
  else
  DOF_EX_BuB[7:6]=2'b00;
 end
 else
 DOF_EX_BuB<=DOF_RF_PoB;
 
 //EX
 EX_WB_RW<=DOF_EX_RW;
 EX_WB_RD<=DOF_EX_RD;
 EX_WB_MD<=DOF_EX_MD;
 EX_WB_MD0<=EX_ALU_F;
 EX_WB_MD2<=EX_ALU_N^EX_ALU_V;
 
 end
 
 //IF
 assign IF_IM_PC=PC;
 
 //DOF
 assign DOF_ID_IR=IF_DOF_IR;
 assign DOF_ID_SH =  DOF_ID_IR [2:0];
 assign DOF_RF_AA=IF_DOF_IR[8:6];
 assign DOF_RF_BA=IF_DOF_IR[5:3];
 
 //EX
 assign EX_ALU_A=DOF_EX_BuA;
 assign EX_ALU_B=DOF_EX_BuB;
 assign EX_ALU_FS=DOF_EX_FS;

 assign EX_ALU_SH=DOF_EX_SH;
 assign EX_DM_MW=DOF_EX_MW;
 assign EX_ALU_A=DOF_EX_BuB;
 assign EX_ALU_B=DOF_EX_BuA;
 
 //WB
 assign WB_RF_DA=EX_WB_RD;
 assign WB_RF_RW=EX_WB_RW;
 assign WB_RF_Din=(EX_WB_MD==2)?{7'b0,EX_WB_MD2}:((EX_WB_MD==1)?EX_WB_MD1:(EX_WB_MD0));
 
 //OUTPUT
 assign PCo=PC;
 assign PC_1o=PC_1;
 assign PC_2o=PC_2;
 assign IF_DOF_IRo=IF_DOF_IR;
 assign DOF_EX_RWo=DOF_EX_RW;
 assign DOF_EX_RDo=DOF_EX_RD;
 assign DOF_EX_MDo=DOF_EX_MD;
 assign DOF_EX_BSo=DOF_EX_BS;
 assign DOF_EX_PSo=DOF_EX_PS;
 assign DOF_EX_MWo=DOF_EX_MW;
 assign DOF_EX_FSo=DOF_EX_FS;
 assign DOF_EX_SHo=DOF_EX_SH;
 assign DOF_EX_BuAo=DOF_EX_BuA;
 assign DOF_EX_BuBo=DOF_EX_BuB;
 assign EX_WB_RWo=EX_WB_RW;
 assign EX_WB_RDo=EX_WB_RD;
 assign EX_WB_MDo=EX_WB_MD;
 assign EX_WB_MD0o=EX_WB_MD0;
 assign EX_WB_MD1o=EX_WB_MD1;
 assign EX_WB_MD2o=EX_WB_MD2;
 
 assign DOF_RF_RAo=DOF_RF_AA;
 assign DOF_RF_RBo=DOF_RF_BA;
 assign DOF_RF_Ao=DOF_RF_PoA;
 assign DOF_RF_Bo=DOF_RF_PoB;
 
 assign WB_RF_DA=DOF_RF_AA;
 assign comp_1 = WB_RF_DA;
 assign WB_RF_DA=DOF_RF_BA;
 assign comp_2= WB_RF_DA;
 assign HA= {(WB_RF_DA[2] | WB_RF_DA[1] | WB_RF_DA[0])& DOF_ID_RW &~DOF_ID_MA&comp_1};
 assign HB= {(WB_RF_DA[2] | WB_RF_DA[1] | WB_RF_DA[0])& DOF_ID_RW &~DOF_ID_MB&comp_2};
 assign DHS = (HA|HB);
 assign BHS = |DOF_EX_BS;
endmodule
