class tlm_consumer extends uvm_component;
	
	`uvm_component_utils(tlm_consumer)
	
	`COMP_NEW

	tlm_tx tx;

	uvm_blocking_get_port#(tlm_tx) get_port;

		function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_CONSUMER","build pahse of TLM_CONSUMER",UVM_NONE);
	get_port=new("get_port",this);
	endfunction

	task run_phase(uvm_phase phase);
	int i;
	phase.raise_objection(this);
	tx=tlm_tx::type_id::create("tx");
	repeat(2) begin
		`uvm_info("FIFO TLM_CONSUMER",$sformatf("consumer getting tx num = %0d",i),UVM_NONE)
		get_port.get(tx);
		tx.print();
		#10;
		i++;
	end
	endtask

endclass
