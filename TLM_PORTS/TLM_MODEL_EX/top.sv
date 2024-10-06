`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "common.sv"
`include "tlm_tx.sv"
`include "tlm_stim.sv"
`include "tlm_conv.sv"
`include "tlm_driver.sv"
`include "tlm_consumer.sv"
`include "tlm_producer.sv"
`include "test_lib.sv"

module top;

	initial begin
		run_test("tlm_base_test");
	end

endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test tlm_base_test...
# UVM_INFO test_lib.sv(11) @ 0: uvm_test_top [TLM_BASE_TEST] build pahse of TLM_BASE_TEST
# UVM_INFO tlm_consumer.sv(15) @ 0: uvm_test_top.tlm_consumer_h [TLM_CONSUMER] build pahse of TLM_CONSUMER
# UVM_INFO tlm_producer.sv(17) @ 0: uvm_test_top.tlm_producer_h [TLM_PRODUCER] build pahse of TLM_PRODUCER
# UVM_INFO tlm_producer.sv(25) @ 0: uvm_test_top.tlm_producer_h [TLM_PRODUCER] connect pahse of TLM_PRODUCER
# UVM_INFO test_lib.sv(17) @ 0: uvm_test_top [TLM_BASE_TEST] connect pahse of TLM_BASE_AGENT
# UVM_INFO test_lib.sv(23) @ 0: uvm_test_top [TLM_BASE_TEST] end of elaboration pahse of TLM_BASE_TEST
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# ---------------------------------------------------------
# Name                   Type                   Size  Value
# ---------------------------------------------------------
# uvm_test_top           tlm_base_test          -     @334 
#   tlm_consumer_h       tlm_consumer           -     @358 
#     drv                tlm_driver             -     @428 
#       get_port         uvm_blocking_get_port  -     @437 
#     put_export         uvm_put_export         -     @369 
#     tlm_fifo           uvm_tlm_fifo #(T)      -     @379 
#       get_ap           uvm_analysis_port      -     @418 
#       get_peek_export  uvm_get_peek_imp       -     @398 
#       put_ap           uvm_analysis_port      -     @408 
#       put_export       uvm_put_imp            -     @388 
#   tlm_producer_h       tlm_producer           -     @349 
#     conv               tlm_conv               -     @468 
#       get_port         uvm_blocking_get_port  -     @546 
#       put_port         uvm_blocking_put_port  -     @536 
#     put_port           uvm_blocking_put_port  -     @477 
#     stim               tlm_stim               -     @449 
#       put_port         uvm_blocking_put_port  -     @458 
#     tlm_fifo           uvm_tlm_fifo #(T)      -     @487 
#       get_ap           uvm_analysis_port      -     @526 
#       get_peek_export  uvm_get_peek_imp       -     @506 
#       put_ap           uvm_analysis_port      -     @516 
#       put_export       uvm_put_imp            -     @496 
# ---------------------------------------------------------
# 
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @572      
#   data   integral  32    'h5cc04217
#   addr   integral  16    'h75da    
#   wr_rd  integral  1     'h0       
# -----------------------------------
# -------------------------------
# Name     Type      Size  Value 
# -------------------------------
# tx1      tlm_tx    -     @584  
#   data   integral  32    'h0   
#   addr   integral  16    'h75da
#   wr_rd  integral  1     'h0   
# -------------------------------
# ------------------------------
# Name     Type      Size  Value
# ------------------------------
# tx1      tlm_tx    -     @592 
#   data   integral  32    'h0  
#   addr   integral  16    'h426
#   wr_rd  integral  1     'h0  
# ------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @576      
#   data   integral  32    'h43657cb8
#   addr   integral  16    'h426     
#   wr_rd  integral  1     'h1       
# -----------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @608      
#   data   integral  32    'he0d91a23
#   addr   integral  16    'h3dcd    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @612      
#   data   integral  32    'hb85775ab
#   addr   integral  16    'hb9b6    
#   wr_rd  integral  1     'h0       
# -----------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       tlm_tx    -     @636      
#   data   integral  32    'hdc5ba4d0
#   addr   integral  16    'h88cd    
#   wr_rd  integral  1     'h1       
# -----------------------------------
# -------------------------------
# Name     Type      Size  Value 
# -------------------------------
# tx1      tlm_tx    -     @620  
#   data   integral  32    'h0   
#   addr   integral  16    'h3dcd
#   wr_rd  integral  1     'h0   
# -------------------------------
# -------------------------------
# Name     Type      Size  Value 
# -------------------------------
# tx1      tlm_tx    -     @628  
#   data   integral  32    'h0   
#   addr   integral  16    'hb9b6
#   wr_rd  integral  1     'h0   
# -------------------------------
# -------------------------------
# Name     Type      Size  Value 
# -------------------------------
# tx1      tlm_tx    -     @648  
#   data   integral  32    'h0   
#   addr   integral  16    'h88cd
#   wr_rd  integral  1     'h0   
# -------------------------------
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 0: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :    9
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [RNTST]     1
# [TLM_BASE_TEST]     3
# [TLM_CONSUMER]     1
# [TLM_PRODUCER]     2
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 0 ns  Iteration: 262  Instance: /top
*/
