`timescale 1ns / 1ps

module tb_MCU_Main();
    reg clk;
    reg reset;
    wire[7:0]PCo;
    wire[7:0]PC_1o;
    wire[7:0]PC_2o;
    wire[16:0]IF_DOF_IRo;
    wire DOF_EX_RWo;
    wire[2:0]DOF_EX_RDo;
    wire[1:0]DOF_EX_MDo;
    wire[1:0]DOF_EX_BSo;
    wire DOF_EX_PSo;
    wire DOF_EX_MWo;
    wire [3:0]DOF_EX_FSo;
    wire [2:0]DOF_EX_SHo;
    wire [7:0]DOF_EX_BuAo;
    wire [7:0]DOF_EX_BuBo;
    wire EX_WB_RWo;
    wire [2:0]EX_WB_RDo;
    wire [1:0]EX_WB_MDo;
    wire [7:0]EX_WB_MD0o;
    wire [7:0]EX_WB_MD1o;
    wire EX_WB_MD2o;
    wire [2:0]DOF_RF_RAo;
    wire [2:0]DOF_RF_RBo;
    wire [7:0]DOF_RF_Ao;
    wire [7:0]DOF_RF_Bo;
    
    MCU_MainUnit UUT(.clk(clk),.reset(reset),.PCo(PCo),.PC_1o(PC_1o),.PC_2o(PC_2o),.IF_DOF_IRo(IF_DOF_IRo),.DOF_EX_RWo(DOF_EX_RWo),
            .DOF_EX_RDo(DOF_EX_RDo),.DOF_EX_MDo(DOF_EX_MDo),.DOF_EX_BSo(DOF_EX_BSo),.DOF_EX_PSo(DOF_EX_PSo),.DOF_EX_MWo(DOF_EX_MWo),
            .DOF_EX_FSo(DOF_EX_FSo),.DOF_EX_SHo(DOF_EX_SHo),.DOF_EX_BuAo(DOF_EX_BuAo),.DOF_EX_BuBo(DOF_EX_BuBo),
            .EX_WB_RWo(EX_WB_RWo),.EX_WB_RDo(EX_WB_RDo),.EX_WB_MDo(EX_WB_MDo),.EX_WB_MD0o(EX_WB_MD0o),.EX_WB_MD1o(EX_WB_MD1o),
            .EX_WB_MD2o(EX_WB_MD2o),.DOF_RF_RAo(DOF_RF_RAo),.DOF_RF_RBo(DOF_RF_RBo),.DOF_RF_Ao(DOF_RF_Ao),.DOF_RF_Bo(DOF_RF_Bo)
            ); 
     initial begin
     clk=0;
     reset=1;
     #40
     reset=0;
     end
     
     always begin
     #5
     clk=~clk;
     end
endmodule
