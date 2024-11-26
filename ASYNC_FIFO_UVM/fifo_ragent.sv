class fifo_ragent extends uvm_agent;

	`uvm_component_utils(fifo_ragent)

	fifo_rdrv rdrv;
	fifo_rsqr rsqr;
	fifo_rmon rmon;
	fifo_rcov rcov;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rdrv=fifo_rdrv::type_id::create("rdrv",this);
		rsqr=fifo_rsqr::type_id::create("rsqr",this);
		rmon=fifo_rmon::type_id::create("rmon",this);
		rcov=fifo_rcov::type_id::create("rcov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		rdrv.seq_item_port.connect(rsqr.seq_item_export);
		rmon.rap_port.connect(rcov.analysis_export);
	endfunction

endclass

