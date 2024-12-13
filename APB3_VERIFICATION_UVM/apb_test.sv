class apb_base_test extends uvm_test;
	
	`uvm_component_utils(apb_base_test)

	apb_env env;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env=apb_env::type_id::create("env",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	task run_phase(uvm_phase phase);
		apb_base_seq seq;
		`uvm_info(get_full_name(),"run_phase of apb_base_test",UVM_MEDIUM)
		phase.raise_objection(this);
		seq=apb_base_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

endclass

class apb_overflow_test extends apb_base_test;
	
	`uvm_component_utils(apb_overflow_test)

	function new(string name ="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("APB_OVERFLOW_TEST","build_phase of apb_overflow_test is executed",UVM_MEDIUM)
//		uvm_config_db#(uvm_object_wrapper)::set(this,"env.agent.sqr","default_sequence",apb_overflow_seq::get_type());
	endfunction

	task run_phase(uvm_phase phase);
		apb_overflow_seq seq;
		`uvm_info("APB_OVERFLOW_TEST","run_phase of apb_overflow_test is executed",UVM_MEDIUM)
		phase.raise_objection(this);
		seq=apb_overflow_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask
	
endclass

class apb_underflow_test extends apb_base_test;
	
	`uvm_component_utils(apb_underflow_test)

	function new(string name ="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("APB_UNDERFLOW_TEST","build_phase of apb_underflow_test is executed",UVM_MEDIUM)
//		uvm_config_db#(uvm_object_wrapper)::set(this,"env.agent.sqr","default_sequence",apb_underflow_seq::get_type());
	endfunction

	task run_phase(uvm_phase phase);
		apb_underflow_seq seq;
		`uvm_info("APB_UNDERFLOW_TEST","run_phase of apb_underflow_test is executed",UVM_MEDIUM)
		phase.raise_objection(this);
		seq=apb_underflow_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask
	
endclass

class apb_invalid_address_test extends apb_base_test;
	
	`uvm_component_utils(apb_invalid_address_test)

	function new(string name ="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("APB_IINVALID_ADDRESS_TEST","build_phase of apb_invalid_address_test is executed",UVM_MEDIUM)
//		uvm_config_db#(uvm_object_wrapper)::set(this,"env.agent.sqr","default_sequence",apb_invalid_address_seq::get_type());
	endfunction

	task run_phase(uvm_phase phase);
		apb_invalid_address_seq seq;
		`uvm_info("APB_INVALID_ADDRESS_TEST","run_phase of apb_invalid_address_test is executed",UVM_MEDIUM)
		phase.raise_objection(this);
		seq=apb_invalid_address_seq::type_id::create("seq");
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask
	
endclass
