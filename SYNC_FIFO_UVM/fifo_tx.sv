class fifo_tx extends uvm_sequence_item;

	parameter WIDTH=8;

	rand bit wr_en,rd_en;
	rand bit [WIDTH-1:0]wdata;
		 bit [WIDTH-1:0]rdata;
		 bit full,empty,wr_err,rd_err;

	`uvm_object_utils_begin(fifo_tx)
		`uvm_field_int(wr_en,UVM_ALL_ON)
		`uvm_field_int(rd_en,UVM_ALL_ON)
		`uvm_field_int(wdata,UVM_ALL_ON)
		`uvm_field_int(rdata,UVM_ALL_ON)
		`uvm_field_int(full,UVM_ALL_ON)
		`uvm_field_int(empty,UVM_ALL_ON)
		`uvm_field_int(wr_err,UVM_ALL_ON)
		`uvm_field_int(rd_err,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction

endclass
