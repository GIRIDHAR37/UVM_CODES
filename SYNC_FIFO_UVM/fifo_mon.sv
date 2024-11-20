class fifo_mon extends uvm_monitor;
	
	`uvm_component_utils(fifo_mon)

	virtual fifo_if vif;
	fifo_tx tx;

	uvm_analysis_port#(fifo_tx) ap_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap_port=new("ap_port",this);
		if(!uvm_resource_db#(virtual fifo_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			@(posedge vif.clk);
			tx=new();
			tx.wr_en=vif.wr_en;
			tx.rd_en=vif.rd_en;
			tx.wdata=vif.wdata;
			tx.rdata=vif.rdata;
			tx.full=vif.full;
			tx.empty=vif.empty;
			tx.wr_err=vif.wr_err;
			tx.rd_err=vif.rd_err;
			ap_port.write(tx);
//			`uvm_info(get_full_name(),$sformatf("Monitered transaction : %s",tx.sprint()),UVM_MEDIUM)
		end
	endtask
	
endclass
