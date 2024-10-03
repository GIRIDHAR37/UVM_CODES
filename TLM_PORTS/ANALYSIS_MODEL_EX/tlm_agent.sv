class tlm_agent extends uvm_agent;
	`uvm_component_utils(tlm_agent)

	`COMP_NEW

	tlm_producer tlm_producer_h;
	tlm_subscriber_1 tlm_subscriber_1_h;
	tlm_subscriber_2 tlm_subscriber_2_h;
	tlm_subscriber_3 tlm_subscriber_3_h;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_AGENT","build pahse of TLM_AGENT",UVM_NONE);
		tlm_producer_h=tlm_producer::type_id::create("tlm_producer_h",this);
		tlm_subscriber_1_h=tlm_subscriber_1::type_id::create("tlm_subscriber_1_h",this);
		tlm_subscriber_2_h=tlm_subscriber_2::type_id::create("tlm_subscriber_2_h",this);
		tlm_subscriber_3_h=tlm_subscriber_3::type_id::create("tlm_subscriber_3_h",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		`uvm_info("TLM_AGENT","connect pahse of TLM_AGENT",UVM_NONE);
// we have to connect the producer and consumer
		tlm_producer_h.ap_port.connect(tlm_subscriber_1_h.ap_imp);
		tlm_producer_h.ap_port.connect(tlm_subscriber_2_h.ap_imp);
		tlm_producer_h.ap_port.connect(tlm_subscriber_3_h.ap_imp);
	endfunction
	
endclass
