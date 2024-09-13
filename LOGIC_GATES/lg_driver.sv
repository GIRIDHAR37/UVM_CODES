class lg_drv extends uvm_driver#(lg_tx);

	`uvm_component_utils(lg_drv)

	virtual lg_if vif;

	function new(string name = "",uvm_component parent);
		super.new(name,parent);
//		vif=top.pif;
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_resource_db#(virtual lg_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_type_name(),"Virtual interface not set");
		end
		
	endfunction

	task run_phase(uvm_phase phase);
		lg_tx req;
		req=lg_tx::type_id::create("req");
		forever begin
			seq_item_port.get_next_item(req);
			vif.a=req.a;
			vif.b=req.b;
			vif.mode=req.mode;
			`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
			seq_item_port.item_done();
		end
	endtask
	
endclass


