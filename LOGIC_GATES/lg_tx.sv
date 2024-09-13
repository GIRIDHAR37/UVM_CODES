class lg_tx extends uvm_sequence_item;
	
	rand logic [3:0]a;
	rand logic [3:0]b;
	rand logic [2:0]mode;
	logic [3:0]y;

	function new(string name="");
		super.new(name);
	endfunction

	`uvm_object_utils_begin(lg_tx)
		`uvm_field_int(a,UVM_ALL_ON)
		`uvm_field_int(b,UVM_ALL_ON)
		`uvm_field_int(mode,UVM_ALL_ON)
		`uvm_field_int(y,UVM_ALL_ON)
	`uvm_object_utils_end

	constraint a_notequal_b {a!=b;}

endclass
