class apb_drv extends uvm_driver#(apb_tx);

	`uvm_component_utils(apb_drv)

	virtual apb_if vif;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual apb_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
//		apb_tx req;
//		req=apb_tx::type_id::create("req");
		forever begin
			seq_item_port.get_next_item(req);
			req.print();
			apb_drive_tx(req);
			seq_item_port.item_done();
		end
	endtask

	task apb_drive_tx(apb_tx tx);
		#10;
		`uvm_info("DRIVE_TX","apb_drive_tx of fifo_drv",UVM_MEDIUM);
// Setup phase
    	@(vif.cb_drv);
    	vif.cb_drv.psel_i    <= 1'b1;       
    	vif.cb_drv.penable_i <= 1'b0;       
    	vif.cb_drv.paddr_i   <= tx.paddr_i; 
    	vif.cb_drv.pwrite_i  <= tx.pwrite_i;
    	if (tx.pwrite_i) begin
// Write operation
        	vif.cb_drv.pwdata_i <= tx.pwdata_i;  
		end
		else begin
// read operation
			tx.prdata_o <= vif.cb_drv.prdata_o;
		end
// Enable phase
    	@(vif.cb_drv);
    	vif.cb_drv.penable_i <= 1'b1;  
		wait(vif.cb_drv.pready_o == 1'b1); 
// Return to idle
    	@(vif.cb_drv);
    	vif.cb_drv.psel_i    <= 1'b0;  
    	vif.cb_drv.penable_i <= 1'b0;
	endtask

endclass
