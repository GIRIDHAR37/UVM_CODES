module logic_gates(input [2:0]mode,
				   input [3:0]a,b,
				   output reg [3:0]y
				  );

	   parameter AND  = 3'b000,
	   			 OR   = 3'b001,
				 NOT  = 3'b010,
				 NAND = 3'b011,
				 NOR  = 3'b100,
				 XOR  = 3'b101,
				 XNOR = 3'b110,
				 BUF  = 3'b111;

	   always @(*) begin
	   	case(mode)
			AND  : y = a&b;
			OR   : y = a|b;
			NOT  : y = ~a;
			NAND : y = ~(a&b);
			NOR  : y = ~(a|b);
			XOR  : y = a^b;
			XNOR : y = ~(a^b);
			BUF  : y = b;
			default  : y = 4'b0000;
		endcase
	   end
endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test lg_base_test...
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# --------------------------------------------------------------
# Name                       Type                    Size  Value
# --------------------------------------------------------------
# uvm_test_top               lg_base_test            -     @338 
#   env                      lg_env                  -     @351 
#     agent                  lg_agent                -     @360 
#       cov                  lg_cov                  -     @555 
#         analysis_imp       uvm_analysis_imp        -     @564 
#       drv                  lg_drv                  -     @370 
#         rsp_port           uvm_analysis_port       -     @389 
#         seq_item_port      uvm_seq_item_pull_port  -     @379 
#       mon                  lg_mon                  -     @536 
#         ap_port            uvm_analysis_port       -     @545 
#       sqr                  lg_sqr                  -     @399 
#         rsp_export         uvm_analysis_export     -     @408 
#         seq_item_export    uvm_seq_item_pull_imp   -     @526 
#         arbitration_queue  array                   0     -    
#         lock_queue         array                   0     -    
#         num_last_reqs      integral                32    'd1  
#         num_last_rsps      integral                32    'd1  
# --------------------------------------------------------------
# 
# UVM_INFO lg_test.sv(17) @ 0: uvm_test_top [uvm_test_top] Run Phase of lg_base_test
# UVM_INFO lg_mon.sv(28) @ 0: uvm_test_top.env.agent.mon [lg_mon] a=x , b=x , mode : x , y=x
# UVM_INFO lg_seq.sv(15) @ 0: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=9 , b=8 , mode : 0
# UVM_INFO lg_driver.sv(28) @ 0: uvm_test_top.env.agent.drv [lg_drv] a=9 , b=8 , mode : 0
# UVM_INFO lg_mon.sv(28) @ 10: uvm_test_top.env.agent.mon [lg_mon] a=9 , b=8 , mode : 0 , y=8
# UVM_INFO lg_seq.sv(22) @ 10: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=11 , b=2 , mode : 1
# UVM_INFO lg_driver.sv(28) @ 10: uvm_test_top.env.agent.drv [lg_drv] a=11 , b=2 , mode : 1
# UVM_INFO lg_mon.sv(28) @ 20: uvm_test_top.env.agent.mon [lg_mon] a=11 , b=2 , mode : 1 , y=11
# UVM_INFO lg_seq.sv(29) @ 20: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=9 , b=12 , mode : 2
# UVM_INFO lg_driver.sv(28) @ 20: uvm_test_top.env.agent.drv [lg_drv] a=9 , b=12 , mode : 2
# UVM_INFO lg_mon.sv(28) @ 30: uvm_test_top.env.agent.mon [lg_mon] a=9 , b=12 , mode : 2 , y=6
# UVM_INFO lg_seq.sv(36) @ 30: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=12 , b=2 , mode : 3
# UVM_INFO lg_driver.sv(28) @ 30: uvm_test_top.env.agent.drv [lg_drv] a=12 , b=2 , mode : 3
# UVM_INFO lg_mon.sv(28) @ 40: uvm_test_top.env.agent.mon [lg_mon] a=12 , b=2 , mode : 3 , y=15
# UVM_INFO lg_seq.sv(43) @ 40: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=11 , b=0 , mode : 4
# UVM_INFO lg_driver.sv(28) @ 40: uvm_test_top.env.agent.drv [lg_drv] a=11 , b=0 , mode : 4
# UVM_INFO lg_mon.sv(28) @ 50: uvm_test_top.env.agent.mon [lg_mon] a=11 , b=0 , mode : 4 , y=4
# UVM_INFO lg_seq.sv(50) @ 50: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=1 , b=11 , mode : 5
# UVM_INFO lg_driver.sv(28) @ 50: uvm_test_top.env.agent.drv [lg_drv] a=1 , b=11 , mode : 5
# UVM_INFO lg_mon.sv(28) @ 60: uvm_test_top.env.agent.mon [lg_mon] a=1 , b=11 , mode : 5 , y=10
# UVM_INFO lg_seq.sv(57) @ 60: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=2 , b=10 , mode : 6
# UVM_INFO lg_driver.sv(28) @ 60: uvm_test_top.env.agent.drv [lg_drv] a=2 , b=10 , mode : 6
# UVM_INFO lg_mon.sv(28) @ 70: uvm_test_top.env.agent.mon [lg_mon] a=2 , b=10 , mode : 6 , y=7
# UVM_INFO lg_seq.sv(64) @ 70: uvm_test_top.env.agent.sqr@@seq [lg_base_seq] a=9 , b=8 , mode : 7
# UVM_INFO lg_driver.sv(28) @ 70: uvm_test_top.env.agent.drv [lg_drv] a=9 , b=8 , mode : 7
# UVM_INFO lg_mon.sv(28) @ 80: uvm_test_top.env.agent.mon [lg_mon] a=9 , b=8 , mode : 7 , y=8
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_objection.svh(1270) @ 80: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 80: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   30
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [RNTST]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# [lg_base_seq]     8
# [lg_drv]     8
# [lg_mon]     9
# [uvm_test_top]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 80 ns  Iteration: 73  Instance: /lg_tb
# 1
# Break in Task uvm_pkg/uvm_root::run_test at E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh line 517
*/
