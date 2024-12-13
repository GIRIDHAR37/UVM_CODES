interface apb_if(input bit pclk_i,presetn_i);

	bit psel_i;
	bit penable_i;
	bit pwrite_i;
	bit [`ADDR_WIDTH-1:0]paddr_i;
	bit [`WIDTH-1:0]pwdata_i;
	bit [`WIDTH-1:0]prdata_o;
	bit pready_o;
	bit pslverr_o;

// clocking block for the drv 

	clocking cb_drv @(posedge pclk_i);
		
		default input #1 output #0;

		output psel_i;
		output penable_i;
		output pwrite_i;
		output paddr_i;
		output pwdata_i;
		input  prdata_o;
		input  pready_o;
		input  pslverr_o;
	
	endclocking

// clocking block for the mon

	clocking cb_mon @(posedge pclk_i);
	
		default input #1;

		input  psel_i;
		input  penable_i;
		input  pwrite_i;
		input  paddr_i;
		input  pwdata_i;
		input  prdata_o;
		input  pready_o;
		input  pslverr_o;

	endclocking

	modport mp_drv(clocking cb_drv);

	modport mp_mon(clocking cb_mon);

endinterface
