`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "common.sv"
`include "tlm_tx.sv"
`include "tlm_subscriber_3.sv"
`include "tlm_subscriber_2.sv"
`include "tlm_subscriber_1.sv"
`include "tlm_producer.sv"
`include "tlm_agent.sv"
`include "test_lib.sv"

module top;

	initial begin
		run_test("tlm_base_test");
	end

endmodule

// output : ANALYSIS MODEL
/*
# UVM_INFO @ 0: reporter [RNTST] Running test tlm_base_test...
# UVM_INFO test_lib.sv(10) @ 0: uvm_test_top [TLM_BASE_TEST] build pahse of TLM_BASE_TEST
# UVM_INFO tlm_agent.sv(13) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] build pahse of TLM_AGENT
# UVM_INFO tlm_producer.sv(11) @ 0: uvm_test_top.tlm_agent_h.tlm_producer_h [TLM_PRODUCER] build pahse of TLM_PRODUCER
# UVM_INFO tlm_subscriber_1.sv(14) @ 0: uvm_test_top.tlm_agent_h.tlm_subscriber_1_h [TLM_SUBSCRIBER_1] build pahse of TLM_SUBSCRIBER_1
# UVM_INFO tlm_subscriber_2.sv(14) @ 0: uvm_test_top.tlm_agent_h.tlm_subscriber_2_h [TLM_SUBSCRIBER_2] build pahse of TLM_SUBSCRIBER_2
# UVM_INFO tlm_subscriber_3.sv(14) @ 0: uvm_test_top.tlm_agent_h.tlm_subscriber_3_h [TLM_SUBSCRIBER_3] build pahse of TLM_SUBSCRIBER_3
# UVM_INFO tlm_agent.sv(21) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] connect pahse of TLM_AGENT
# UVM_INFO test_lib.sv(15) @ 0: uvm_test_top [TLM_BASE_TEST] end of elaboration pahse of TLM_BASE_TEST
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# ------------------------------------------------------
# Name                    Type               Size  Value
# ------------------------------------------------------
# uvm_test_top            tlm_base_test      -     @334 
#   tlm_agent_h           tlm_agent          -     @349 
#     tlm_producer_h      tlm_producer       -     @361 
#       ap_port           uvm_analysis_port  -     @399 
#     tlm_subscriber_1_h  tlm_subscriber_1   -     @370 
#       ap_imp            uvm_analysis_imp   -     @411 
#     tlm_subscriber_2_h  tlm_subscriber_2   -     @379 
#       ap_imp            uvm_analysis_imp   -     @423 
#     tlm_subscriber_3_h  tlm_subscriber_3   -     @388 
#       ap_imp            uvm_analysis_imp   -     @435 
# ------------------------------------------------------
# 
# write function of tlm_subscriber_1
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @459      
#   data   integral  32    'ha5a02f12
#   addr   integral  16    'h274c    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# write function of tlm_subscriber_2
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @459      
#   data   integral  32    'ha5a02f12
#   addr   integral  16    'h274c    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# write function of tlm_subscriber_3
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @459      
#   data   integral  32    'ha5a02f12
#   addr   integral  16    'h274c    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# write function of tlm_subscriber_1
# ----------------------------------
# Name     Type      Size  Value    
# ----------------------------------
# tx       tlm_tx    -     @459     
#   data   integral  32    'h7450b21
#   addr   integral  16    'hd231   
#   wr_rd  integral  1     'h1      
# ----------------------------------
# write function of tlm_subscriber_2
# ----------------------------------
# Name     Type      Size  Value    
# ----------------------------------
# tx       tlm_tx    -     @459     
#   data   integral  32    'h7450b21
#   addr   integral  16    'hd231   
#   wr_rd  integral  1     'h1      
# ----------------------------------
# write function of tlm_subscriber_3
# ----------------------------------
# Name     Type      Size  Value    
# ----------------------------------
# tx       tlm_tx    -     @459     
#   data   integral  32    'h7450b21
#   addr   integral  16    'hd231   
#   wr_rd  integral  1     'h1      
# ----------------------------------
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_objection.svh(1270) @ 0: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   12
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [RNTST]     1
# [TEST_DONE]     1
# [TLM_AGENT]     2
# [TLM_BASE_TEST]     2
# [TLM_PRODUCER]     1
# [TLM_SUBSCRIBER_1]     1
# [TLM_SUBSCRIBER_2]     1
# [TLM_SUBSCRIBER_3]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 0 ns  Iteration: 262  Instance: /top
# 1
# Break in Task uvm_pkg/uvm_root::run_test at E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh line 517
*/
