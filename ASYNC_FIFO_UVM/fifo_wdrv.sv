class fifo_wdrv extends uvm_driver#(fifo_wtx);
	`uvm_component_utils(fifo_wdrv)

	virtual fifo_wif wvif;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual fifo_wif)::read_by_name("GLOBAL","VIF",wvif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			fifo_wdrive_wtx(req);
			seq_item_port.item_done();
		end
	endtask

	task fifo_wdrive_wtx(fifo_wtx wtx);
		#10;
		`uvm_info("WRITE_DRIVE_WTX","fifo_wdrive_wtx of fifo_wdrv",UVM_MEDIUM);
		@(posedge wvif.wclk);
		wvif.wwr_en=wtx.wwr_en;
		if(wtx.wwr_en) begin
			wvif.wwdata=wtx.wwdata;
			@(posedge wvif.wclk);
			wvif.wwr_en=0;
			`uvm_info("FIFO_WDRV",$sformatf("WRITE : Data = 0x%0h",wtx.wwdata),UVM_MEDIUM);
		end
		wtx.wfull=wvif.wfull;
		wtx.wwr_err=wvif.wwr_err;
	endtask

endclass
