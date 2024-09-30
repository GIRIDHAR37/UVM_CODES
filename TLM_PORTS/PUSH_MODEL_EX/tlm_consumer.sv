class tlm_consumer extends uvm_component;
	
	`uvm_component_utils(tlm_consumer)
	
	`COMP_NEW

	uvm_blocking_put_imp#(tlm_tx,tlm_consumer) put_imp;
// here
// tlm_consumer -> refers to type of the component who is implementing the connection
// tlm_tx -> the type of transaction to be communicated by the imp
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_CONSUMER","build pahse of TLM_CONSUMER",UVM_NONE);
	put_imp=new("put_imp",this);
	endfunction

// consumer is slave so no runphase
// have put method to be implemented
	task put(tlm_tx tx);// input
		tx.print();//put method is only doing print
	endtask

endclass
