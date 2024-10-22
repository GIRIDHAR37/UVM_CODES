class pd_base_test extends uvm_test;
	
	`uvm_component_utils(pd_base_test)

	pd_env env;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=pd_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		pd_base_seq seq;
		`uvm_info(get_full_name(),"run phase of pd_base_test",UVM_LOW);
		phase.raise_objection(this);
		seq=pd_base_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
//		phase.phase_done.set_drain_time(this,1000);
		phase.drop_objection(this);
	endtask

endclass


