class tlm_base_test extends uvm_test;
	`uvm_component_utils(tlm_base_test)

	`COMP_NEW

	tlm_producer tlm_producer_h;
	tlm_consumer tlm_consumer_h;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_BASE_TEST","build pahse of TLM_BASE_TEST",UVM_NONE);
		tlm_producer_h=tlm_producer::type_id::create("tlm_producer_h",this);
		tlm_consumer_h=tlm_consumer::type_id::create("tlm_consumer_h",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		`uvm_info("TLM_BASE_TEST","connect pahse of TLM_BASE_AGENT",UVM_NONE);
// we have to connect the producer and consumer
		tlm_producer_h.put_port.connect(tlm_consumer_h.put_export);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info("TLM_BASE_TEST","end of elaboration pahse of TLM_BASE_TEST",UVM_NONE);
		uvm_top.print_topology();
	endfunction
	
endclass
