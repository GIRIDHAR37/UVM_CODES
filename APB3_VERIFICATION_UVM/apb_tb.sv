`define WIDTH 8
`define ADDR_WIDTH $clog2(MEM_DEPTH)
`define MEM_DEPTH 16

`include "uvm_pkg.sv"

import uvm_pkg::*;

typedef class apb_base_test;
typedef class apb_env;
typedef class apb_agent;
typedef class apb_drv;
typedef class apb_sqr;
typedef class apb_base_seq;
typedef class apb_tx;
typedef class apb_mon;
typedef class apb_cov;

`include "apb_if.sv"
`include "apb_tx.sv"
`include "apb_cov.sv"
`include "apb_mon.sv"
`include "apb_seq.sv"
`include "apb_sqr.sv"
`include "apb_drv.sv"
`include "apb_agent.sv"
`include "apb_env.sv"
`include "apb_test.sv"
`include "apb.v"

module apb_tb;
	
	bit pclk_i,presetn_i;

	apb_if pif(pclk_i,presetn_i);

	apb dut(.pclk_i(pif.pclk_i),
		   	.presetn_i(pif.presetn_i),
			.psel_i(pif.psel_i),
			.penable_i(pif.penable_i),
			.pwrite_i(pif.pwrite_i),
			.paddr_i(pif.paddr_i),
			.pwdata_i(pif.pwdata_i),
			.prdata_o(pif.prdata_o),
			.pready_o(pif.pready_o),
			.pslverr_o(pif.pslverr_o)
		   );

	initial begin
		uvm_resource_db#(virtual apb_if)::set("GLOBAL","VIF",pif,null);
		run_test("apb_base_test");
	end

	initial begin
		pclk_i=0;
		presetn_i=0;
		repeat(2) @(posedge pclk_i);
		presetn_i=1;
	end

	always #5 pclk_i=~pclk_i;
	
endmodule
