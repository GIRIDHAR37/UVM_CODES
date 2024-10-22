// typedef uvm_sequencer#(pd_tx) pd_sqr;

class pd_sqr extends uvm_sequencer#(pd_tx);
	
	`uvm_component_utils(pd_sqr)

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction

endclass


