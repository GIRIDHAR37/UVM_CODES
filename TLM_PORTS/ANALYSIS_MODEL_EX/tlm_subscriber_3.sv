class tlm_subscriber_3 extends uvm_component;
	
	`uvm_component_utils(tlm_subscriber_3)
	
	`COMP_NEW

	tlm_tx tx;

// -> ANALYSIS MODEL
	uvm_analysis_imp#(tlm_tx,tlm_subscriber_3) ap_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_SUBSCRIBER_3","build pahse of TLM_SUBSCRIBER_3",UVM_NONE);
//  -> ANALYSIS MODEL
		ap_imp=new("ap_imp",this);
	endfunction
//  -> ANALYSIS MODEL
// implement write function
	function void write(tlm_tx tx);
		$display("write function of tlm_subscriber_3");
		tx.print();
	endfunction

endclass
