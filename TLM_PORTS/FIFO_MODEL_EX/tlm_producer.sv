class tlm_producer extends uvm_component;
	
	`uvm_component_utils(tlm_producer)
	
	`COMP_NEW
	tlm_tx tx;
	uvm_blocking_put_port#(tlm_tx) put_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_PRODUCER","build pahse of TLM_PRODUCER",UVM_NONE);
	put_port=new("put_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		int i;
		phase.raise_objection(this);
		tx=tlm_tx::type_id::create("tx");
		repeat(2) begin
			`uvm_info("FIFO TLM_PRODUCER",$sformatf("producer generating tx num = %0d",i),UVM_NONE);
			assert(tx.randomize());
			put_port.put(tx);
			#1;
			i++;
		end
		phase.drop_objection(this);
	endtask

endclass
