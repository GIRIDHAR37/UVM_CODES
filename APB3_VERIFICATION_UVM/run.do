#compilation
vlog +incdir+E:/UVM/uvm-1.2/uvm-1.2/src apb_tb.sv

#ellaboration + mapping uvm dpi
vopt apb_tb +cover=fcbest -o apb_invalid_address_test
vsim -coverage apb_invalid_address_test -novopt -suppress 12110 -sv_lib E:/Questasim/Q\ inner\ files/uvm-1.2/win64/uvm_dpi +UVM_TESTNAME=apb_invalid_address_test

coverage save -onexit apb_invalid_address_test.ucdb

#ADD WAVEFORM
add wave -position insertpoint sim:/apb_tb/dut/*

#simulation

run -all

