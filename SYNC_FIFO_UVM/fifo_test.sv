class fifo_base_test extends uvm_test;

	`uvm_component_utils(fifo_base_test)

	fifo_env env;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=fifo_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		fifo_base_seq seq;
		`uvm_info(get_full_name(),"run_phase of fifo_base_test",UVM_MEDIUM)
		phase.raise_objection(this);
		seq=fifo_base_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass
