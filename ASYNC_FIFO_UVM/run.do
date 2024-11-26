#compilation
vlog +incdir+E:/UVM/uvm-1.2/uvm-1.2/src fifo_tb.sv

#ellaboration + mapping uvm dpi
vopt fifo_tb +cover=fcbest -o fifo_base_test
vsim -coverage fifo_base_test -novopt -suppress 12110 -sv_lib E:/Questasim/Q\ inner\ files/uvm-1.2/win64/uvm_dpi +UVM_TESTNAME=fifo_base_test

coverage save -onexit fifo_base_test.ucdb

#ADD WAVEFORM
add wave -position insertpoint sim:/fifo_tb/dut/*

#simulation

run -all
