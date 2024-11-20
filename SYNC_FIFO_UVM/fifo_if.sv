interface fifo_if(input bit clk,rst);

	parameter WIDTH=8;

	bit wr_en,rd_en;
	bit [WIDTH-1:0]wdata;
	bit [WIDTH-1:0]rdata;
	bit full,empty,wr_err,rd_err;

endinterface
