class fifo_base_seq extends uvm_sequence#(fifo_tx);

	`uvm_object_utils(fifo_base_seq)

	fifo_tx tx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
//		fifo_tx req;
		`uvm_info(get_full_name(),"body of fifo_base_seq",UVM_MEDIUM)
		repeat(20) begin
			`uvm_do_with(req,{req.wr_en==1;req.rd_en==0;}) // write operation
		end
		repeat(20) begin
			tx=new req;
			`uvm_do_with(req,{req.wr_en==0;req.rd_en==1;}) // read operation
		end
	endtask

endclass
