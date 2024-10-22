class pd_base_seq extends uvm_sequence #(pd_tx);

	`uvm_object_utils(pd_base_seq)

	function new(string name = "");
		super.new(name);
	endfunction

	task body();
		pd_tx req;
		`uvm_info(get_full_name(),"body of pd_base_seq",UVM_LOW)
		repeat(100) begin
		req=pd_tx::type_id::create("req");
		start_item(req);
		assert(req.randomize());
//		req.data=$urandom_range(0,1);
		`uvm_info(get_type_name(),$sformatf("data : %b | valid : %b",req.data,req.valid),UVM_LOW)
		finish_item(req);
		end
	endtask

endclass
