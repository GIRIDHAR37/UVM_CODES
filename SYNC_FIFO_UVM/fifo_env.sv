class fifo_env extends uvm_env;

	`uvm_component_utils(fifo_env)

	fifo_agent agent;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent=fifo_agent::type_id::create("agent",this);
	endfunction

endclass
