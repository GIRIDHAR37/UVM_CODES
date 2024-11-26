interface fifo_rif(input bit rclk,rst);

	parameter WIDTH = 8;

	bit rrd_en;
	bit [WIDTH-1:0]rrdata;
	bit rempty;
	bit rrd_err;
	
endinterface
