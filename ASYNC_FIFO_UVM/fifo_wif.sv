interface fifo_wif(input bit wclk,rst);
	
	parameter WIDTH = 8;

	bit wwr_en;
	bit [WIDTH-1:0]wwdata;
	bit wfull;
	bit wwr_err;

endinterface
