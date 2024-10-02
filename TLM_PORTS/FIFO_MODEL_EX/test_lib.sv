class tlm_base_test extends uvm_test;
	`uvm_component_utils(tlm_base_test)

	`COMP_NEW

	tlm_agent tlm_agent_h;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TLM_BASE_TEST","build pahse of TLM_BASE_TEST",UVM_NONE);
		tlm_agent_h=tlm_agent::type_id::create("tlm_agent_h",this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info("TLM_BASE_TEST","end of elaboration pahse of TLM_BASE_TEST",UVM_NONE);
		uvm_top.print_topology();
	endfunction
	
endclass
