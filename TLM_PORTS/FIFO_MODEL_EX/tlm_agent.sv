class tlm_agent extends uvm_agent;
	`uvm_component_utils(tlm_agent)

	`COMP_NEW

	tlm_producer tlm_producer_h;
	tlm_consumer tlm_consumer_h;

// declare a tlm_fifo
	uvm_tlm_fifo#(tlm_tx) tlm_fifo;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_AGENT","build pahse of TLM_AGENT",UVM_NONE);
		tlm_producer_h=tlm_producer::type_id::create("tlm_producer_h",this);
		tlm_consumer_h=tlm_consumer::type_id::create("tlm_consumer_h",this);
		tlm_fifo=new("tlm_fifo",this);
// tlm_fifo acts like as a mailbox the default mailbox size as 1
	endfunction

	function void connect_phase(uvm_phase phase);
		`uvm_info("TLM_AGENT","connect pahse of TLM_AGENT",UVM_NONE);
// we have to connect the producer to fifo
		tlm_producer_h.put_port.connect(tlm_fifo.put_export);
		tlm_consumer_h.get_port.connect(tlm_fifo.get_export);
	endfunction
	
endclass
