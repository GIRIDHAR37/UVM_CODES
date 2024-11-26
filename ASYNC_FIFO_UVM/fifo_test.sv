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
		fifo_wbase_wseq wseq;
		fifo_rbase_rseq rseq;
		`uvm_info(get_full_name(),"run_phase of fifo_base_test",UVM_MEDIUM)
		phase.raise_objection(this);
		wseq=fifo_wbase_wseq::type_id::create("wseq");
		wseq.start(env.wagent.wsqr);
		rseq=fifo_rbase_rseq::type_id::create("rseq");
		rseq.start(env.ragent.rsqr);
		phase.drop_objection(this);
	endtask

endclass

