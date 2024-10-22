class pd_mon extends uvm_monitor;
	
	`uvm_component_utils(pd_mon)
	virtual pd_if vif;
	pd_tx tx;

	uvm_analysis_port#(pd_tx) ap_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap_port=new("ap_port",this);
		if(!uvm_resource_db#(virtual pd_if)::read_by_name("GLOBAL","VIF",vif,this))
			`uvm_fatal(get_type_name(),"Virtual interface not set")
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			tx=new();
			@(posedge vif.clk);
			if(vif.valid==1)
				tx.data=vif.data;
			tx.pd_o=vif.pd_o;
			ap_port.write(tx);
		end
	endtask

endclass
