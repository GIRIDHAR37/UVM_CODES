class fifo_cov extends uvm_subscriber#(fifo_tx);
	
	`uvm_component_utils(fifo_cov);

	fifo_tx tx;

	covergroup fifo_cg;
		WR_EN : coverpoint tx.wr_en{
//			option.auto_bin_max=2;                // explicit_bins
			bins write_enable_bins[] = {[0:1]};   // implicit_bins
		}

		RD_EN : coverpoint tx.rd_en{
//			option.auto_bin_max=2;				  // explicit_bins
			bins read_enable_bins[] = {[0:1]};    // implicit_bins
		}

		WDATA : coverpoint tx.wdata{
			option.auto_bin_max=5;				  // explicit_bins
//			bins write_data_bins[] = {[0:255]};   // implicit_bins
		}

		RDATA : coverpoint tx.wdata{
			option.auto_bin_max=5;				  // explicit_bins
//			bins read_data_bins[] = {[0:255]};    // implicit_bins
		}

		FULL : coverpoint tx.full{
			option.auto_bin_max=2;				  // explicit_bins
//			bins full_bins[] = {[0:1]};			  // implicit_bins
		}

		EMPTY : coverpoint tx.empty{
			option.auto_bin_max=2;				  // explicit_bins
//			bins empty_bins[] = {[0:1]};		  // implicit_bins
		}

		WR_ERR : coverpoint tx.full{
//			option.auto_bin_max=2;				  // explicit_bins
			bins write_error_bins[] = {[0:1]};	  // implicit_bins
		}

		RD_ERR : coverpoint tx.full{
//			option.auto_bin_max=2;				  // explicit_bins
			bins read_error_bins[] = {[0:1]};	  // implicit_bins
		}


	endgroup

	function new(string name="",uvm_component parent);
		super.new(name,parent);
		fifo_cg=new();
	endfunction

	virtual function void write(T t);
//		`uvm_info(get_full_name(),$sformatf("Recieved transaction : %s",tx.sprint()),UVM_MEDIUM)
		$cast(tx,t);
		fifo_cg.sample();
	endfunction
	
endclass
