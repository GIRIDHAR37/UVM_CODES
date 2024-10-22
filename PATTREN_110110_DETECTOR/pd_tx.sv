class pd_tx extends uvm_sequence_item;
	
	rand logic data;
		 logic valid;
		 logic pd_o;
//	logic data;
//	logic valid;

	`uvm_object_utils_begin(pd_tx)
		`uvm_field_int(data,UVM_ALL_ON);
		`uvm_field_int(valid,UVM_ALL_ON);
		`uvm_field_int(pd_o,UVM_ALL_ON);
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction

endclass


