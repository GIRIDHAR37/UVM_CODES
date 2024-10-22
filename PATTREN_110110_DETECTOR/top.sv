`include "uvm_pkg.sv"
import uvm_pkg::*;

`include "pd_if.sv"
`include "pd_tx.sv"
`include "pd_cov.sv"
`include "pd_mon.sv"
`include "pd_seq.sv"
`include "pd_sqr.sv"
`include "pd_drv.sv"
`include "pd_agent.sv"
`include "pd_env.sv"
`include "pd_test.sv"
`include "pdm.v"

module top;

	bit clk,rst;
	
	pd_if pif(clk,rst);

	pdm dut(.clk_i(pif.clk),
			.rst_i(pif.rst),
		    .data_i(pif.data),
			.valid_i(pif.valid),
			.pd_o(pif.pd_o)
		   );

	initial begin
		uvm_resource_db#(virtual pd_if)::set("GLOBAL","VIF",pif,null);
		run_test("pd_base_test");
	end

	initial begin
		clk=0;
		rst=1;
		repeat(2) @(posedge clk);
		rst=0;
	end

	always #5 clk=~clk;

endmodule
