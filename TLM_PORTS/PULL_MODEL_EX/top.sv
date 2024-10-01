`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "common.sv"
`include "tlm_tx.sv"
`include "tlm_consumer.sv"
`include "tlm_producer.sv"
`include "tlm_agent.sv"
`include "test_lib.sv"

module top;

	initial begin
		run_test("tlm_base_test");
	end

endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test tlm_base_test...
# UVM_INFO test_lib.sv(10) @ 0: uvm_test_top [TLM_BASE_TEST] build pahse of TLM_BASE_TEST
# UVM_INFO tlm_agent.sv(11) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] build pahse of TLM_AGENT
# UVM_INFO tlm_consumer.sv(13) @ 0: uvm_test_top.tlm_agent_h.tlm_consumer_h [TLM_CONSUMER] build pahse of TLM_CONSUMER
# UVM_INFO tlm_producer.sv(13) @ 0: uvm_test_top.tlm_agent_h.tlm_producer_h [TLM_PRODUCER] build pahse of TLM_PRODUCER
# UVM_INFO tlm_agent.sv(17) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] connect pahse of TLM_AGENT
# UVM_INFO test_lib.sv(15) @ 0: uvm_test_top [TLM_BASE_TEST] end of elaboration pahse of TLM_BASE_TEST
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# ------------------------------------------------------
# Name                Type                   Size  Value
# ------------------------------------------------------
# uvm_test_top        tlm_base_test          -     @334 
#   tlm_agent_h       tlm_agent              -     @349 
#     tlm_consumer_h  tlm_consumer           -     @370 
#       get_port      uvm_blocking_get_port  -     @381 
#     tlm_producer_h  tlm_producer           -     @361 
#       get_imp       uvm_blocking_get_imp   -     @393 
# ------------------------------------------------------
# 
# UVM_INFO tlm_consumer.sv(24) @ 1: uvm_test_top.tlm_agent_h.tlm_consumer_h [PULL_MODEL] TLM_CONSUMER tx id = 0
# UVM_INFO tlm_producer.sv(20) @ 11: uvm_test_top.tlm_agent_h.tlm_producer_h [PULL_MODEL] TLM_PRODUCER tx id = 0
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @436      
#   data   integral  32    'h22014ebe
#   addr   integral  16    'h7abf    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# UVM_INFO tlm_consumer.sv(24) @ 12: uvm_test_top.tlm_agent_h.tlm_consumer_h [PULL_MODEL] TLM_CONSUMER tx id = 1
# UVM_INFO tlm_producer.sv(20) @ 22: uvm_test_top.tlm_agent_h.tlm_producer_h [PULL_MODEL] TLM_PRODUCER tx id = 1
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @444      
#   data   integral  32    'h92095645
#   addr   integral  16    'hae3     
#   wr_rd  integral  1     'h0       
# -----------------------------------
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_objection.svh(1270) @ 22: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 22: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   14
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [PULL_MODEL]     4
# [RNTST]     1
# [TEST_DONE]     1
# [TLM_AGENT]     2
# [TLM_BASE_TEST]     2
# [TLM_CONSUMER]     1
# [TLM_PRODUCER]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 22 ns  Iteration: 70  Instance: /top
# 1
# Break in Task uvm_pkg/uvm_root::run_test at E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh line 517
*/
