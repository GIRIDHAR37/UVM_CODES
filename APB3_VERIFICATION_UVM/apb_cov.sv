class apb_cov extends uvm_subscriber#(apb_tx);
	
	`uvm_component_utils(apb_cov);

	apb_tx tx;

	covergroup apb_cg;
		
//		PSEL_I : coverpoint tx.psel_i{
//			bins psel_bins[] = {[0:1]}; // implicit bins 
//			option.auto_bin_max=2;      // explicit bins
//			option.at_least=0;
//		}

//		PENABLE_I : coverpoint tx.penable_i{
//			bins penable_bins[] = {[0:1]}; // implicit bins
//			option.auto_bin_max=2;         // explicit bins
//			option.at_least=0;
//		}

		PWRITE_I : coverpoint tx.pwrite_i{
			bins pwrite0_bins = {1'b0}; // implicit bins 
			bins pwrite1_bins = {1'b1};
//			option.at_least=0;
		}

		PADDR_I : coverpoint tx.paddr_i{
//			bins paddr_bins[] = {[0:31]}; // implicit bins 
			option.auto_bin_max=2;  // explicit bins
//			option.at_least=1;
		}

		PWDATA_I : coverpoint tx.pwdata_i{ 
			option.auto_bin_max=3;  // explicit bins
//			option.at_least=0;
		}

		PRDATA_O : coverpoint tx.prdata_o{ 
			option.auto_bin_max=3;  // explicit bins
//			option.at_least=0;
		}

//		PREADY_O : coverpoint tx.pready_o{
//			bins pready_bins[] = {[0:1]}; // implicit bins 
//			option.at_least=0;
//		}

//		PSLVERR_O : coverpoint tx.pslverr_o{
//			bins pslverr_bins[] = {[0:1]}; // implicit bins
//			option.at_least=0;
//		}

	endgroup

	function new(string name="",uvm_component parent);
		super.new(name,parent);
		apb_cg=new();
	endfunction

	virtual function void write(T t);
		$cast(tx,t);
		apb_cg.sample();
	endfunction

endclass
