############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project KF_kernel
set_top KalmanFilterKernel
add_files ../hls_src/matrix_ops.h
add_files ../hls_src/KF_kernel.h
add_files ../hls_src/KF_kernel.cpp
add_files -tb ../hls_src/kf_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu3eg-sbva484-1-i}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/erik/Documents/SDU/Courses/EmbSys/MPSoC4Drones/hls/KF_kernel/KalmanFilterKernel.zip -rtl vhdl
source "./KF_kernel/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog -output /home/erik/Documents/SDU/Courses/EmbSys/MPSoC4Drones/hls/KF_kernel/KalmanFilterKernel.zip
