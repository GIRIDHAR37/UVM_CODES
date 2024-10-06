class tlm_producer extends uvm_component;
	
	`uvm_component_utils(tlm_producer)
	
	`COMP_NEW

	tlm_stim stim;
	tlm_conv conv;

	tlm_tx tx;

	uvm_blocking_put_port#(tlm_tx) put_port;
	uvm_tlm_fifo#(tlm_tx) tlm_fifo;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_PRODUCER","build pahse of TLM_PRODUCER",UVM_NONE);
		stim=tlm_stim::type_id::create("stim",this);
		conv=tlm_conv::type_id::create("conv",this);
		put_port=new("put_port",this);
		tlm_fifo = new("tlm_fifo",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		`uvm_info("TLM_PRODUCER","connect pahse of TLM_PRODUCER",UVM_NONE);
		stim.put_port.connect(tlm_fifo.put_export);
		conv.get_port.connect(tlm_fifo.get_export);
		conv.put_port.connect(put_port);
	endfunction

endclass
