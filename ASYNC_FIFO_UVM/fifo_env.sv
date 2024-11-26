class fifo_env extends uvm_env;

	`uvm_component_utils(fifo_env)

	fifo_wagent wagent;
	fifo_ragent ragent;	

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wagent=fifo_wagent::type_id::create("wagent",this);
		ragent=fifo_ragent::type_id::create("ragent",this);
	endfunction

endclass
