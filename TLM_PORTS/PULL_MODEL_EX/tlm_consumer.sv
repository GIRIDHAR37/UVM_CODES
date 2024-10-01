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
		tx=tlm_tx::type_id::create("tx");
		phase.raise_objection(this);
// since consumer is a master it has to decide how may tx it wants - 2 times
		repeat(2) begin
		    #1; // delay - consumer consuming the data for every 1 timestep delay
			`uvm_info("PULL_MODEL",$sformatf("TLM_CONSUMER tx id = %0d",i),UVM_NONE)
			get_port.get(tx); // get is a task  implemented at producer
			i++;
		end
		phase.drop_objection(this);
	endtask

endclass
