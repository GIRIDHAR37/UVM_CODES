class fifo_rtx extends uvm_sequence_item;
	
	parameter WIDTH = 8;

	rand bit rrd_en;
         bit [WIDTH-1:0]rrdata;
	     bit rempty;
		 bit rrd_err;
	
	`uvm_object_utils_begin(fifo_rtx)
		`uvm_field_int(rrd_en,UVM_ALL_ON)
		`uvm_field_int(rrdata,UVM_ALL_ON)
		`uvm_field_int(rempty,UVM_ALL_ON)
		`uvm_field_int(rrd_err,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction
	
endclass

