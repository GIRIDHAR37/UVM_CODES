class fifo_rcov extends uvm_subscriber#(fifo_rtx);

		`uvm_component_utils(fifo_rcov);

	fifo_rtx rtx;

	covergroup fifo_rcg;

		RRD_EN : coverpoint rtx.rrd_en{
//			option.auto_bin_max=2;                // explicit_bins
			bins read_read_enable_bins[] = {[0:1]};   // implicit_bins
		}

		RRDATA : coverpoint rtx.rrdata{
			option.auto_bin_max=4;				  // explicit_bins
//			bins read_read_data_bins[] = {[0:255]};   // implicit_bins
		}

		REMPTY : coverpoint rtx.rempty{
			option.auto_bin_max=2;				  // explicit_bins
//			bins read_empty_bins[] = {[0:1]};			  // implicit_bins
		}

		RRD_ERR : coverpoint rtx.rrd_err{
//			option.auto_bin_max=2;				  // explicit_bins
			bins read_read_error_bins[] = {[0:1]};	  // implicit_bins
		}

	endgroup

	function new(string name="",uvm_component parent);
		super.new(name,parent);
		fifo_rcg=new();
	endfunction

	virtual function void write(T t);
		$cast(rtx,t);
		fifo_rcg.sample();
	endfunction	

endclass
