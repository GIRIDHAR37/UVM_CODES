class tlm_agent extends uvm_agent;
	`uvm_component_utils(tlm_agent)

	`COMP_NEW

	tlm_producer tlm_producer_h;
	tlm_consumer tlm_consumer_h;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_AGENT","build pahse of TLM_AGENT",UVM_NONE);
		tlm_producer_h=tlm_producer::type_id::create("tlm_producer_h",this);
		tlm_consumer_h=tlm_consumer::type_id::create("tlm_consumer_h",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		`uvm_info("TLM_AGENT","connect pahse of TLM_AGENT",UVM_NONE);
// we have to connect the consumer and producer
		tlm_consumer_h.get_port.connect(tlm_producer_h.get_imp);
	endfunction
	
endclass
