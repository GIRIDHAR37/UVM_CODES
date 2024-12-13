class apb_tx extends uvm_sequence_item;
	
	rand bit psel_i;
	rand bit penable_i;
	rand bit pwrite_i;
	rand bit [`ADDR_WIDTH-1:0]paddr_i;
	rand bit [`WIDTH-1:0]pwdata_i;
		 bit [`WIDTH-1:0]prdata_o;
		 bit pready_o;
		 bit pslverr_o;

//	static bit [`ADDR_WIDTH-1:0] prev_addr = 4'bx;

	constraint paddr_i_c{
//		paddr_i dist {[0:7]:/3,[8:15]:/5};
		paddr_i inside {[0:15]};
//		paddr_i != prev_addr;
	}

	constraint pwdata_i_c {
    	pwdata_i dist {[0:84]:=2,[85:169]:=5,[170:255]:=9};
	}

//	function void post_randomize();
//		prev_addr = paddr_i;
//	endfunction

	`uvm_object_utils_begin(apb_tx)
		`uvm_field_int(psel_i,UVM_ALL_ON)
		`uvm_field_int(penable_i,UVM_ALL_ON)
		`uvm_field_int(pwrite_i,UVM_ALL_ON)
		`uvm_field_int(paddr_i,UVM_ALL_ON)
		`uvm_field_int(pwdata_i,UVM_ALL_ON)
		`uvm_field_int(prdata_o,UVM_ALL_ON)
		`uvm_field_int(pready_o,UVM_ALL_ON)
		`uvm_field_int(pslverr_o,UVM_ALL_ON)
	`uvm_object_utils_end

	function new(string name="");
		super.new(name);
	endfunction

endclass

