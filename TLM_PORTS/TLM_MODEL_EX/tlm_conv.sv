class tlm_conv extends uvm_component;
	
	uvm_blocking_put_port#(tlm_tx) put_port;
	uvm_blocking_get_port#(tlm_tx) get_port;
	
	tlm_tx tx,tx1;

	`uvm_component_utils(tlm_conv)
	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		put_port = new("put_port",this);
		get_port = new("get_port",this);
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			tx = tlm_tx::type_id::create("tx");
			get_port.get(tx);
			tx1 = tlm_tx::type_id::create("tx1");
			tx1.addr = tx.addr;	
			put_port.put(tx1);
		end
	endtask
endclass
