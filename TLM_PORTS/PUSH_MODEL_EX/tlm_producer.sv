class tlm_producer extends uvm_component;
	
	`uvm_component_utils(tlm_producer)
	
	`COMP_NEW
	tlm_tx tx;
// producer has a additional square and we need to implement that square also in the producer
// this square is of type uvm_blocking_putport
// since transaction going through them is tlm_tx so uvm_blocking_put_port is parameterized to mem_tx type
// put method is a blocking in nature
// since producer is a port we have to uvm_*_port tlm class
// since we are doing push model - where we use put method
// and i need a blocking nature between producer and customer
// so we are using uvm_blocking_put_port
	uvm_blocking_put_port#(tlm_tx) put_port;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_PRODUCER","build pahse of TLM_PRODUCER",UVM_NONE);
		put_port=new("put_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		tx=tlm_tx::type_id::create("tx");
		phase.raise_objection(this);
		repeat(2) begin
			assert(tx.randomize());
// can we do `uvm_do macros here ? -> we cant use `uvm_do_macros because, `uvm_do macrosand its variations are having internal method call thats waits for sqr synchronization
// once the tx is generated we have to put these tx into put_port of producer this is by calling put method
			put_port.put(tx);
// this put method is implemented in comsumer
		end
		phase.drop_objection(this);
	endtask

endclass
