class fifo_wcov extends uvm_subscriber#(fifo_wtx);
	
	`uvm_component_utils(fifo_wcov);

	fifo_wtx wtx;

	covergroup fifo_wcg;

		WWR_EN : coverpoint wtx.wwr_en{
//			option.auto_bin_max=2;                // explicit_bins
			bins write_write_enable_bins[] = {[0:1]};   // implicit_bins
		}

		WWDATA : coverpoint wtx.wwdata{
			option.auto_bin_max=4;				  // explicit_bins
//			bins write_write_data_bins[] = {[0:255]};   // implicit_bins
		}

		WFULL : coverpoint wtx.wfull{
			option.auto_bin_max=2;				  // explicit_bins
//			bins write_full_bins[] = {[0:1]};			  // implicit_bins
		}

		WWR_ERR : coverpoint wtx.wwr_err{
//			option.auto_bin_max=2;				  // explicit_bins
			bins write_write_error_bins[] = {[0:1]};	  // implicit_bins
		}

	endgroup

	function new(string name="",uvm_component parent);
		super.new(name,parent);
		fifo_wcg=new();
	endfunction

	virtual function void write(T t);
		$cast(wtx,t);
		fifo_wcg.sample();
	endfunction

endclass

