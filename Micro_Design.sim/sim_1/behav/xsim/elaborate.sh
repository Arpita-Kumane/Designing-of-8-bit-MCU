#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2017.4 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon Nov 15 22:30:33 CST 2021
# SW Build 2086221 on Fri Dec 15 20:54:30 MST 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xelab -wto acd5335ed4f44d7b83c4b48785c0f766 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_MCU_Main_behav xil_defaultlib.tb_MCU_Main xil_defaultlib.glbl -log elaborate.log
