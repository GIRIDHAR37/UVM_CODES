class tlm_consumer extends uvm_component;
	
	`uvm_component_utils(tlm_consumer)
	
	`COMP_NEW

	uvm_put_export#(tlm_tx) put_export;
	uvm_tlm_fifo#(tlm_tx) tlm_fifo;

	tlm_tx tx;
	tlm_driver drv;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_CONSUMER","build pahse of TLM_CONSUMER",UVM_NONE);
		put_export=new("put_export",this);
		tlm_fifo=new("tlm_fifo",this);
		drv=tlm_driver::type_id::create("drv",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		drv.get_port.connect(tlm_fifo.get_export);
		put_export.connect(tlm_fifo.put_export);
	endfunction

	task put(tlm_tx tx);
//		tx.print();
	endtask

endclass
