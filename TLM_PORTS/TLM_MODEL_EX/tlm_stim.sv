class tlm_stim extends uvm_component;
	
	`uvm_component_utils(tlm_stim)
	
//	`COMP_NEW

	uvm_blocking_put_port#(tlm_tx) put_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
		put_port = new("put_port",this);
	endfunction
	
	task run_phase(uvm_phase phase);
		tlm_tx tx;
		repeat(5) begin
			tx=tlm_tx::type_id::create("tx");
			tx.randomize();
			put_port.put(tx);
			tx.print();
		end
	endtask

endclass


	
