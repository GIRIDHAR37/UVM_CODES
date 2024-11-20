class fifo_drv extends uvm_driver#(fifo_tx);

	`uvm_component_utils(fifo_drv)

	virtual fifo_if vif;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual fifo_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
		fifo_tx req;
		req=fifo_tx::type_id::create("req");
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			fifo_drive_tx(req);
			seq_item_port.item_done();
		end
	endtask

	task fifo_drive_tx(fifo_tx tx);
		#10;
		`uvm_info("DRIVE_TX","fifo_drive_tx of fifo_drv",UVM_MEDIUM);
		@(posedge vif.clk);
		if(tx.wr_en) begin
			vif.wr_en=1;
			vif.wdata=tx.wdata;
			@(posedge vif.clk);
			vif.wr_en=0;
			`uvm_info("FIFO_DRV",$sformatf("WRITE : Data = 0x%0h",tx.wdata),UVM_MEDIUM);
		end

		if(tx.rd_en) begin
			vif.rd_en=1;
			@(posedge vif.clk);
			vif.rd_en=0;
			tx.rdata=vif.rdata;
			`uvm_info("FIFO_DRV",$sformatf("READ : Data = 0x%0h",tx.rdata),UVM_MEDIUM);
		end

		tx.full   = vif.full;
		tx.empty  = vif.empty;
		tx.wr_err = vif.wr_err;
		tx.rd_err = vif.rd_err;
			
	endtask

endclass
