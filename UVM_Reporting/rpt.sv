`include "uvm_pkg.sv"
import uvm_pkg::*;

class rpt extends uvm_component;
	`uvm_component_utils(rpt)

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	task run();
		uvm_report_info(get_full_name(),"info message : verbo level - UVM_NONE",UVM_NONE,`__FILE__,`__LINE__);

		uvm_report_info(get_full_name(),"info message : verbo level - UVM_LOW",UVM_LOW);

		uvm_report_info(get_full_name(),"info message : verbo level - 150",150);

		uvm_report_info(get_full_name(),"info message : verbo level - UVM_MEDIUM",UVM_MEDIUM);

		uvm_report_info(get_type_name(),"info message : verbo level - UVM_HIGH",UVM_HIGH);

		uvm_report_info(get_type_name(),"info message : verbo level - UVM_FULL",UVM_FULL);

		uvm_report_info(get_type_name(),"info message : verbo level - UVM_DEBUG",UVM_DEBUG);

		uvm_report_warning(get_full_name(),"warning message from rpt",UVM_LOW);

		uvm_report_error(get_full_name(),"error message from rpt",UVM_LOW);
	endtask

endclass

module top;
	rpt rpt1;
	rpt rpt2;
	rpt rpt3;
	rpt rpt4;
	rpt rpt5;
	rpt rpt6;

	initial begin
		rpt1=new("rpt1",null);
		rpt2=new("rpt2",null);
		rpt3=new("rpt3",null);
		rpt4=new("rpt4",null);
		rpt5=new("rpt5",null);
		rpt6=new("rpt6",null);

		rpt1.set_report_verbosity_level(UVM_MEDIUM);
		rpt2.set_report_verbosity_level(UVM_LOW);
		rpt3.set_report_verbosity_level(UVM_NONE);
		rpt4.set_report_verbosity_level(UVM_DEBUG);
		rpt5.set_report_verbosity_level(UVM_FULL);
		rpt6.set_report_verbosity_level(UVM_HIGH);

		run_test();
		
	end
endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test ...
# UVM_INFO rpt.sv(12) @ 0: rpt6 [rpt6] info message : verbo level - UVM_NONE
# UVM_INFO @ 0: rpt6 [rpt6] info message : verbo level - UVM_LOW
# UVM_INFO @ 0: rpt6 [rpt6] info message : verbo level - 150
# UVM_INFO @ 0: rpt6 [rpt6] info message : verbo level - UVM_MEDIUM
# UVM_INFO @ 0: rpt6 [rpt] info message : verbo level - UVM_HIGH
# UVM_WARNING @ 0: rpt6 [rpt6] warning message from rpt
# UVM_ERROR @ 0: rpt6 [rpt6] error message from rpt
# UVM_INFO rpt.sv(12) @ 0: rpt5 [rpt5] info message : verbo level - UVM_NONE
# UVM_INFO @ 0: rpt5 [rpt5] info message : verbo level - UVM_LOW
# UVM_INFO @ 0: rpt5 [rpt5] info message : verbo level - 150
# UVM_INFO @ 0: rpt5 [rpt5] info message : verbo level - UVM_MEDIUM
# UVM_INFO @ 0: rpt5 [rpt] info message : verbo level - UVM_HIGH
# UVM_INFO @ 0: rpt5 [rpt] info message : verbo level - UVM_FULL
# UVM_WARNING @ 0: rpt5 [rpt5] warning message from rpt
# UVM_ERROR @ 0: rpt5 [rpt5] error message from rpt
# UVM_INFO rpt.sv(12) @ 0: rpt4 [rpt4] info message : verbo level - UVM_NONE
# UVM_INFO @ 0: rpt4 [rpt4] info message : verbo level - UVM_LOW
# UVM_INFO @ 0: rpt4 [rpt4] info message : verbo level - 150
# UVM_INFO @ 0: rpt4 [rpt4] info message : verbo level - UVM_MEDIUM
# UVM_INFO @ 0: rpt4 [rpt] info message : verbo level - UVM_HIGH
# UVM_INFO @ 0: rpt4 [rpt] info message : verbo level - UVM_FULL
# UVM_INFO @ 0: rpt4 [rpt] info message : verbo level - UVM_DEBUG
# UVM_WARNING @ 0: rpt4 [rpt4] warning message from rpt
# UVM_ERROR @ 0: rpt4 [rpt4] error message from rpt
# UVM_INFO rpt.sv(12) @ 0: rpt3 [rpt3] info message : verbo level - UVM_NONE
# UVM_INFO rpt.sv(12) @ 0: rpt2 [rpt2] info message : verbo level - UVM_NONE
# UVM_INFO @ 0: rpt2 [rpt2] info message : verbo level - UVM_LOW
# UVM_WARNING @ 0: rpt2 [rpt2] warning message from rpt
# UVM_ERROR @ 0: rpt2 [rpt2] error message from rpt
# UVM_INFO rpt.sv(12) @ 0: rpt1 [rpt1] info message : verbo level - UVM_NONE
# UVM_INFO @ 0: rpt1 [rpt1] info message : verbo level - UVM_LOW
# UVM_INFO @ 0: rpt1 [rpt1] info message : verbo level - 150
# UVM_INFO @ 0: rpt1 [rpt1] info message : verbo level - UVM_MEDIUM
# UVM_WARNING @ 0: rpt1 [rpt1] warning message from rpt
# UVM_ERROR @ 0: rpt1 [rpt1] error message from rpt
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   27
# UVM_WARNING :    5
# UVM_ERROR :    5
# UVM_FATAL :    0
# ** Report counts by id
# [RNTST]     1
# [UVM/RELNOTES]     1
# [rpt]     6
# [rpt1]     6
# [rpt2]     4
# [rpt3]     1
# [rpt4]     6
# [rpt5]     6
# [rpt6]     6
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 0 ns  Iteration: 259  Instance: /top
*/
