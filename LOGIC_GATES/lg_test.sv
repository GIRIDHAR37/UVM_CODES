class lg_base_test extends uvm_test;
	`uvm_component_utils(lg_base_test)
	
	lg_env env;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=lg_env::type_id::create("env",this);
	endfunction

	task run_phase(uvm_phase phase);
		lg_base_seq seq;
	    `uvm_info(get_full_name(),"Run Phase of lg_base_test",UVM_NONE)
		phase.raise_objection(this);
		seq=lg_base_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
//		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction
	
endclass
