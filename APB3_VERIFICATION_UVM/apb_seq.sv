class apb_base_seq extends uvm_sequence#(apb_tx);

	`uvm_object_utils(apb_base_seq)

	apb_tx tx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		`uvm_info(get_full_name(),"body of APB_BASE_SEQ",UVM_MEDIUM)
		repeat(10) begin
			`uvm_do_with(req,{req.psel_i==1'b1;req.penable_i==1'b0;req.pwrite_i==1'b1;})
			req.print();
			tx=apb_tx::type_id::create("tx");
			tx=apb_tx'(req.clone());
			`uvm_do_with(tx,{tx.psel_i==1'b1;tx.penable_i==1'b1;tx.pwrite_i==1'b0;tx.paddr_i==req.paddr_i;})
			req.print();
		end
	endtask

endclass

class apb_overflow_seq extends apb_base_seq;

	`uvm_object_utils(apb_overflow_seq)

	apb_tx tx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		repeat(20) begin
			`uvm_info(get_full_name(),"body of APB_OVERFLOW_SEQ",UVM_MEDIUM)
			`uvm_do_with(req,{req.psel_i==1'b1;req.penable_i==1'b0;req.pwrite_i==1'b1;});
			req.print();	
		end
	endtask

endclass

class apb_underflow_seq extends apb_base_seq;

	`uvm_object_utils(apb_underflow_seq)

	apb_tx tx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		repeat(20) begin
			`uvm_info(get_full_name(),"body of APB_UNDERFLOW_SEQ",UVM_MEDIUM)
			`uvm_do_with(req,{req.psel_i==1'b1;req.penable_i==1'b0;req.pwrite_i==1'b0;});
			req.print();	
		end
	endtask

endclass

class apb_invalid_address_seq extends apb_base_seq;

	`uvm_object_utils(apb_invalid_address_seq)

	apb_tx tx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		repeat(20) begin
			`uvm_info(get_full_name(),"body of APB_INVALID_ADDRESS_SEQ",UVM_MEDIUM)
			`uvm_do_with(req,{req.psel_i==1'b1;req.penable_i==1'b0;req.pwrite_i==1'b1;req.paddr_i >= `MEM_DEPTH;});
			req.print();	
		end
	endtask

endclass
