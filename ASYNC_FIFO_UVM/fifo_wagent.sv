class fifo_wagent extends uvm_agent;

	`uvm_component_utils(fifo_wagent)

	fifo_wdrv wdrv;
	fifo_wsqr wsqr;
	fifo_wmon wmon;
	fifo_wcov wcov;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wdrv=fifo_wdrv::type_id::create("wdrv",this);
		wsqr=fifo_wsqr::type_id::create("wsqr",this);
		wmon=fifo_wmon::type_id::create("wmon",this);
		wcov=fifo_wcov::type_id::create("wcov",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		wdrv.seq_item_port.connect(wsqr.seq_item_export);
		wmon.wap_port.connect(wcov.analysis_export);
	endfunction

endclass
