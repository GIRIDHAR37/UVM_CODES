#compilation
vlog +incdir+E:/UVM/uvm-1.2/uvm-1.2/src apb_tb.sv

#ellaboration + mapping uvm dpi
vopt apb_tb +cover=fcbest -o apb_base_tes
vsim -coverage apb_base_test -novopt -suppress 12110 -sv_lib E:/Questasim/Q\ inner\ files/uvm-1.2/win64/uvm_dpi +UVM_TESTNAME=apb_base_test

coverage save -onexit apb_base_test.ucdb

#ADD WAVEFORM
add wave -position insertpoint sim:/apb_tb/dut/*

#simulation

run -all

