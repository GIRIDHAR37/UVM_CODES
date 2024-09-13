class lg_agent extends uvm_agent;

	`uvm_component_utils(lg_agent)

	lg_drv drv;
	lg_sqr sqr;
	lg_mon mon;
	lg_cov cov;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drv=lg_drv::type_id::create("drv",this);
		sqr=lg_sqr::type_id::create("sqr",this);
		mon=lg_mon::type_id::create("mon",this);
		cov=lg_cov::type_id::create("cov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.ap_port.connect(cov.analysis_export);
	endfunction

endclass
