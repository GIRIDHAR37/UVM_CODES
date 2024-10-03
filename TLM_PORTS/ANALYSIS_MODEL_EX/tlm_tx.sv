class tlm_tx extends uvm_sequence_item;
 
	rand bit [`width-1:0]data;
	rand bit [`addr_width-1:0]addr;
	rand bit wr_rd;

  `uvm_object_utils_begin(tlm_tx)
	`uvm_field_int(data,UVM_ALL_ON)
	`uvm_field_int(addr,UVM_ALL_ON)
	`uvm_field_int(wr_rd,UVM_ALL_ON)
  `uvm_object_utils_end

  `OBJ_NEW 

endclass
