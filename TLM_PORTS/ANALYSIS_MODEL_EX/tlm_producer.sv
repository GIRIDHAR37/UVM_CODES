class tlm_producer extends uvm_component;
	
	`uvm_component_utils(tlm_producer)
	
	`COMP_NEW
	tlm_tx tx;
	uvm_analysis_port#(tlm_tx) ap_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_PRODUCER","build pahse of TLM_PRODUCER",UVM_NONE);
	ap_port=new("ap_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		tx=tlm_tx::type_id::create("tx");
		phase.raise_objection(this);
		repeat(2) begin
			assert(tx.randomize());

			ap_port.write(tx);
		end
		phase.drop_objection(this);
	endtask

endclass
