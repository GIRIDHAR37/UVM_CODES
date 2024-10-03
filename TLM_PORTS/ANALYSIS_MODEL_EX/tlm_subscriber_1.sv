class tlm_subscriber_1 extends uvm_component;
	
	`uvm_component_utils(tlm_subscriber_1)
	
	`COMP_NEW

	tlm_tx tx;

// -> ANALYSIS MODEL
	uvm_analysis_imp#(tlm_tx,tlm_subscriber_1) ap_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_SUBSCRIBER_1","build pahse of TLM_SUBSCRIBER_1",UVM_NONE);
//  -> ANALYSIS MODEL
		ap_imp=new("ap_imp",this);
	endfunction
//  -> ANALYSIS MODEL
// implement write function
	function void write(tlm_tx tx);
		$display("write function of tlm_subscriber_1");
		tx.print();
	endfunction

endclass
