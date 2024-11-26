class fifo_rbase_rseq extends uvm_sequence#(fifo_rtx);

	`uvm_object_utils(fifo_rbase_rseq)

	fifo_rtx rtx;

	function new(string name="");
		super.new(name);
	endfunction

	task body();
		`uvm_info(get_full_name(),"body of fifo_rbase_rseq",UVM_MEDIUM)
		repeat(20) begin
			`uvm_do_with(req,{req.rrd_en==1;}) // write operation
		end
	endtask

endclass

