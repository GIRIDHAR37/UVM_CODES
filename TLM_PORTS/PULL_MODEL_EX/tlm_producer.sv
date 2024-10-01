class tlm_producer extends uvm_component;
	
	`uvm_component_utils(tlm_producer)
	
	`COMP_NEW

	int i;

	uvm_blocking_get_imp#(tlm_tx,tlm_producer) get_imp;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_PRODUCER","build pahse of TLM_PRODUCER",UVM_NONE);
	    get_imp=new("get_imp",this);
	endfunction

	task get(tlm_tx tx);
		tx=tlm_tx::type_id::create("tx");
		#10; // generate tx for every 10 timestep
		`uvm_info("PULL_MODEL",$sformatf("TLM_PRODUCER tx id = %0d",i),UVM_NONE)
		assert(tx.randomize());
		tx.print();
		i++;
	endtask

endclass
