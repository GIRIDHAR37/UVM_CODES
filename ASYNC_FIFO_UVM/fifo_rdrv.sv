class fifo_rdrv extends uvm_driver#(fifo_rtx);
	`uvm_component_utils(fifo_rdrv)

	virtual fifo_rif rvif;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual fifo_rif)::get(this,"*","vif",rvif)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			fifo_rdrive_rtx(req);
			seq_item_port.item_done();
		end
	endtask

	task fifo_rdrive_rtx(fifo_rtx rtx);
		#10;
		`uvm_info("READ_DRIVE_RTX","fifo_rdrive_rtx of fifo_rdrv",UVM_MEDIUM);
		@(posedge rvif.rclk);
		rvif.rrd_en=rtx.rrd_en;
		if(rtx.rrd_en) begin
			rtx.rrdata=rvif.rrdata;
			@(posedge rvif.rclk);
			rvif.rrd_en=0;
			`uvm_info("FIFO_RDRV",$sformatf("READ : Data = 0x%0h",rtx.rrdata),UVM_MEDIUM);
		end
		rtx.rempty=rvif.rempty;
		rtx.rrd_err=rvif.rrd_err;
	endtask

endclass

