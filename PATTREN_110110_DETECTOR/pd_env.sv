class pd_env extends uvm_env;

	`uvm_component_utils(pd_env)

	pd_agent agent;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent=pd_agent::type_id::create("agent",this);
	endfunction

endclass
