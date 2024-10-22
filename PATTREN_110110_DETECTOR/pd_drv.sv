class pd_drv extends uvm_driver#(pd_tx);

	`uvm_component_utils(pd_drv)

	virtual pd_if vif;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual pd_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_type_name(),"Virtual interface not set");
		end
	endfunction

	task run_phase(uvm_phase phase);
		pd_tx req;
		req=pd_tx::type_id::create("req");
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			pd_drive_tx(req);
			seq_item_port.item_done();
		end
	endtask

	task pd_drive_tx(pd_tx tx);
		#10;
		`uvm_info("DRIVE_TX","pd_drive_tx ofpd_drv",UVM_LOW);
		@(posedge vif.clk);
		vif.valid=1'b1;
		vif.data=tx.data;
		tx.pd_o=vif.pd_o;
//		@(posedge vif.clk);
//		vif.valid=1'b0;
	endtask

endclass
