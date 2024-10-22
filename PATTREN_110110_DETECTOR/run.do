#compilation
vlog +incdir+E:/UVM/uvm-1.2/uvm-1.2/src top.sv

#ellaboration + mapping uvm dpi
vsim -novopt -suppress 12110 top -sv_lib E:/Questasim/Q\ inner\ files/uvm-1.2/win64/uvm_dpi +UVM_TESTNAME=pd_base_test

#ADD WAVEFORM
add wave -position insertpoint sim:/top/dut/*

#simulation

run -all
