import uvm_pkg::*;
`include "uvm_pkg.sv"

`include "lg_if.sv"
`include "lg_tx.sv"
`include "lg_seq.sv"
`include "lg_cov.sv"
`include "lg_mon.sv"
`include "lg_sqr.sv"
`include "lg_driver.sv"
`include "lg_agent.sv"
`include "lg_env.sv"
`include "lg_test.sv"
`include "lg.v"

module lg_tb;
	 
	lg_if pif();

	logic_gates dut(.mode(pif.mode),
				    .a(pif.a),
				    .b(pif.b),
					.y(pif.y)
				   );

	initial begin
		uvm_resource_db#(virtual lg_if)::set("GLOBAL","VIF",pif,null);
		#1000;
		$finish();
	end

	initial begin
		run_test("lg_base_test");
	end

endmodule
