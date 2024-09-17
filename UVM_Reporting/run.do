#compilation
vlog +incdir+E:/UVM/uvm-1.2/uvm-1.2/src rpt.sv

#ellaboration + mapping uvm dpi
vsim -novopt -suppress 12110 top -sv_lib E:/Questasim/Q\ inner\ files/uvm-1.2/win64/uvm_dpi 

#simulation
run -all
