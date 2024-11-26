class fifo_wtx extends uvm_sequence_item;
	
	parameter WIDTH = 8;

	rand bit wwr_en;
	rand bit [WIDTH-1:0]wwdata;
	bit wfull;
	bit wwr_err;
	
	`uvm_object_utils_begin(fifo_wtx)
		`uvm_field_int(wwr_en,UVM_ALL_ON)
		`uvm_field_int(wwdata,UVM_ALL_ON)
		`uvm_field_int(wfull,UVM_ALL_ON)
		`uvm_field_int(wwr_err,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction
	
endclass
