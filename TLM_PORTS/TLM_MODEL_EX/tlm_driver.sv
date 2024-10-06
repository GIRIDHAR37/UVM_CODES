class tlm_driver extends uvm_component;

	`uvm_component_utils(tlm_driver)
	
	`COMP_NEW 

	uvm_blocking_get_port#(tlm_tx) get_port;

	tlm_tx tx;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		get_port=new("get_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			tx=tlm_tx::type_id::create("tx");
			get_port.get(tx);
			tx.print();
		end
	endtask

endclass

