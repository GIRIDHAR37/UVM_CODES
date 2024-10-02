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
# UVM_INFO tlm_agent.sv(14) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] build pahse of TLM_AGENT
# UVM_INFO tlm_consumer.sv(13) @ 0: uvm_test_top.tlm_agent_h.tlm_consumer_h [TLM_CONSUMER] build pahse of TLM_CONSUMER
# UVM_INFO tlm_producer.sv(11) @ 0: uvm_test_top.tlm_agent_h.tlm_producer_h [TLM_PRODUCER] build pahse of TLM_PRODUCER
# UVM_INFO tlm_agent.sv(22) @ 0: uvm_test_top.tlm_agent_h [TLM_AGENT] connect pahse of TLM_AGENT
# UVM_INFO test_lib.sv(15) @ 0: uvm_test_top [TLM_BASE_TEST] end of elaboration pahse of TLM_BASE_TEST
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# ---------------------------------------------------------
# Name                   Type                   Size  Value
# ---------------------------------------------------------
# uvm_test_top           tlm_base_test          -     @334 
#   tlm_agent_h          tlm_agent              -     @349 
#     tlm_consumer_h     tlm_consumer           -     @370 
#       get_port         uvm_blocking_get_port  -     @430 
#     tlm_fifo           uvm_tlm_fifo #(T)      -     @379 
#       get_ap           uvm_analysis_port      -     @418 
#       get_peek_export  uvm_get_peek_imp       -     @398 
#       put_ap           uvm_analysis_port      -     @408 
#       put_export       uvm_put_imp            -     @388 
#     tlm_producer_h     tlm_producer           -     @361 
#       put_port         uvm_blocking_put_port  -     @442 
# ---------------------------------------------------------
# 
# UVM_INFO tlm_producer.sv(20) @ 0: uvm_test_top.tlm_agent_h.tlm_producer_h [FIFO TLM_PRODUCER] producer generating tx num = 0
# UVM_INFO tlm_consumer.sv(22) @ 0: uvm_test_top.tlm_agent_h.tlm_consumer_h [FIFO TLM_CONSUMER] consumer getting tx num = 0
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @466      
#   data   integral  32    'ha5a02f12
#   addr   integral  16    'h274c    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# UVM_INFO tlm_producer.sv(20) @ 1: uvm_test_top.tlm_agent_h.tlm_producer_h [FIFO TLM_PRODUCER] producer generating tx num = 1
# UVM_INFO tlm_consumer.sv(22) @ 10: uvm_test_top.tlm_agent_h.tlm_consumer_h [FIFO TLM_CONSUMER] consumer getting tx num = 1
# ----------------------------------
# Name     Type      Size  Value    
# ----------------------------------
# tx       tlm_tx    -     @466     
#   data   integral  32    'h7450b21
#   addr   integral  16    'hd231   
#   wr_rd  integral  1     'h1      
# ----------------------------------
# UVM_FATAL E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_phase.svh(1489) @ 9200000000000: reporter [PH_TIMEOUT] Default timeout of 9200000000000 hit, indicating a probable testbench issue
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 9200000000000: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   13
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    1
# ** Report counts by id
# [FIFO TLM_CONSUMER]     2
# [FIFO TLM_PRODUCER]     2
# [PH_TIMEOUT]     1
# [RNTST]     1
# [TLM_AGENT]     2
# [TLM_BASE_TEST]     2
# [TLM_CONSUMER]     1
# [TLM_PRODUCER]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(135)
#    Time: 9200 sec  Iteration: 0  Region: /uvm_pkg::uvm_phase::execute_phase
# 1
# Break in Function uvm_pkg/uvm_root::die at E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh line 135
*/
