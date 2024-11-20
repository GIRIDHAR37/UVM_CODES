class fifo_agent extends uvm_agent;

	`uvm_component_utils(fifo_agent)

	fifo_drv drv;
	fifo_sqr sqr;
	fifo_mon mon;
	fifo_cov cov;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		drv=fifo_drv::type_id::create("drv",this);
		sqr=fifo_sqr::type_id::create("sqr",this);
		mon=fifo_mon::type_id::create("mon",this);
		cov=fifo_cov::type_id::create("cov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.ap_port.connect(cov.analysis_export);
	endfunction

endclass
