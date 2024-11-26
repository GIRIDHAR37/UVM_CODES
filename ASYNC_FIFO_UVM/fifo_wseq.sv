class fifo_wbase_wseq extends uvm_sequence#(fifo_wtx);

	`uvm_object_utils(fifo_wbase_wseq)

	fifo_wtx wtx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		`uvm_info(get_full_name(),"body of fifo_wbase_wseq",UVM_MEDIUM)
		repeat(20) begin
			`uvm_do_with(req,{req.wwr_en==1;}) // write operation
		end
	endtask

endclass
