class lg_mon extends uvm_monitor;

	`uvm_component_utils(lg_mon)

	virtual lg_if vif;
	lg_tx tx;
	uvm_analysis_port #(lg_tx) ap_port;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
		ap_port=new("ap_port",this);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual lg_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_type_name(),"Virtual interface not set");
		end
		tx=lg_tx::type_id::create("tx",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			tx.a=vif.a;
			tx.b=vif.b;
			tx.mode=vif.mode;
			tx.y=vif.y;
			`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d , y=%0d",tx.a,tx.b,tx.mode,tx.y),UVM_LOW)
			ap_port.write(tx);
			#10;
		end
	endtask

endclass

