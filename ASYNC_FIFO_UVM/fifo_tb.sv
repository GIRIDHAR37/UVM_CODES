`include "uvm_pkg.sv"

import uvm_pkg::*;

typedef class fifo_env;
typedef class fifo_wagent;
typedef class fifo_ragent;
typedef class fifo_wdrv;
typedef class fifo_rdrv;
typedef class fifo_wsqr;
typedef class fifo_rsqr;
typedef class fifo_wbase_wseq;
typedef class fifo_rbase_rseq;
typedef class fifo_wmon;
typedef class fifo_rmon;
typedef class fifo_wcov;
typedef class fifo_rcov;
typedef class fifo_wtx;
typedef class fifo_rtx;

`include "fifo_wif.sv"
`include "fifo_rif.sv"
`include "fifo_wtx.sv"
`include "fifo_rtx.sv"
`include "fifo_wcov.sv"
`include "fifo_rcov.sv"
`include "fifo_wmon.sv"
`include "fifo_rmon.sv"
`include "fifo_wseq.sv"
`include "fifo_rseq.sv"
`include "fifo_wsqr.sv"
`include "fifo_rsqr.sv"
`include "fifo_wdrv.sv"
`include "fifo_rdrv.sv"
`include "fifo_wagent.sv"
`include "fifo_ragent.sv"
`include "fifo_env.sv"
`include "fifo_test.sv"
`include "Async_fifo.v"

module fifo_tb;
	
	bit wclk,rclk,rst;

	fifo_wif wpif(wclk,rst);
	fifo_rif rpif(rclk,rst);

	async_fifo dut(.wr_clk(wpif.wclk),
				   .rd_clk(rpif.rclk),
				   .rst(wpif.rst),
				   .wr_en(wpif.wwr_en),
				   .rd_en(rpif.rrd_en),
				   .wdata(wpif.wwdata),
				   .rdata(rpif.rrdata),
				   .full(wpif.wfull),
				   .empty(rpif.rempty),
				   .wr_err(wpif.wwr_err),
				   .rd_err(rpif.rrd_err)
				  );

	initial begin
		uvm_resource_db#(virtual fifo_wif)::set("GLOBAL","VIF",wpif,null);
		uvm_config_db#(virtual fifo_rif)::set(null,"*","vif",rpif);
				run_test("fifo_base_test");
	end

	initial begin
		wclk=0;
		rclk=0;
		rst=1;
		repeat(2) @(posedge wclk or posedge rclk);
		rst=0;
	end

	always #5 wclk=~wclk;

	always #10 rclk=~rclk;

endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test fifo_base_test...
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# --------------------------------------------------------------
# Name                       Type                    Size  Value
# --------------------------------------------------------------
# uvm_test_top               fifo_base_test          -     @343 
#   env                      fifo_env                -     @356 
#     ragent                 fifo_ragent             -     @374 
#       rcov                 fifo_rcov               -     @559 
#         analysis_imp       uvm_analysis_imp        -     @568 
#       rdrv                 fifo_rdrv               -     @384 
#         rsp_port           uvm_analysis_port       -     @403 
#         seq_item_port      uvm_seq_item_pull_port  -     @393 
#       rmon                 fifo_rmon               -     @550 
#         rap_port           uvm_analysis_port       -     @579 
#       rsqr                 uvm_sequencer           -     @413 
#         rsp_export         uvm_analysis_export     -     @422 
#         seq_item_export    uvm_seq_item_pull_imp   -     @540 
#         arbitration_queue  array                   0     -    
#         lock_queue         array                   0     -    
#         num_last_reqs      integral                32    'd1  
#         num_last_rsps      integral                32    'd1  
#     wagent                 fifo_wagent             -     @365 
#       wcov                 fifo_wcov               -     @771 
#         analysis_imp       uvm_analysis_imp        -     @780 
#       wdrv                 fifo_wdrv               -     @596 
#         rsp_port           uvm_analysis_port       -     @615 
#         seq_item_port      uvm_seq_item_pull_port  -     @605 
#       wmon                 fifo_wmon               -     @762 
#         wap_port           uvm_analysis_port       -     @791 
#       wsqr                 uvm_sequencer           -     @625 
#         rsp_export         uvm_analysis_export     -     @634 
#         seq_item_export    uvm_seq_item_pull_imp   -     @752 
#         arbitration_queue  array                   0     -    
#         lock_queue         array                   0     -    
#         num_last_reqs      integral                32    'd1  
#         num_last_rsps      integral                32    'd1  
# --------------------------------------------------------------
# 
# UVM_INFO fifo_test.sv(23) @ 0: uvm_test_top [uvm_test_top] run_phase of fifo_base_test
# UVM_INFO fifo_wseq.sv(12) @ 0: uvm_test_top.env.wagent.wsqr@@wseq [uvm_test_top.env.wagent.wsqr.wseq] body of fifo_wbase_wseq
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @834                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'hca                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    0                                
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 10: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 25: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xca
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @896                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h14                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    25                               
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 35: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 45: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x14
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @916                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'hd3                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    45                               
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 55: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 65: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xd3
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @936                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h38                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    65                               
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 75: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 85: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x38
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @956                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h1                              
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    85                               
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 95: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 105: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x1
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @976                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h21                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    105                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 115: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 125: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x21
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @996                             
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h9                              
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    125                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 135: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 145: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x9
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1016                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'he1                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    145                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 155: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 165: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xe1
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1036                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h5d                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    165                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 175: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 185: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x5d
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1056                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h1f                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    185                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 195: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 205: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x1f
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1076                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h41                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    205                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 215: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 225: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x41
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1096                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'haf                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    225                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 235: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 245: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xaf
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1116                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h2a                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    245                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 255: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 265: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x2a
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1136                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h22                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    265                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 275: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 285: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x22
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1156                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'hb7                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    285                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 295: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 305: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xb7
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1176                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h13                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    305                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 315: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 325: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x13
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1196                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h9e                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    325                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 335: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 345: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x9e
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1216                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'h26                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    345                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 355: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 365: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0x26
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1236                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'hc4                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    365                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 375: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 385: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xc4
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_wtx  -     @1256                            
#   wwr_en                       integral  1     'h1                              
#   wwdata                       integral  8     'hea                             
#   wfull                        integral  1     'h0                              
#   wwr_err                      integral  1     'h0                              
#   begin_time                   time      64    385                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     wseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.wagent.wsqr.wseq
#   sequencer                    string    28    uvm_test_top.env.wagent.wsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_wdrv.sv(28) @ 395: uvm_test_top.env.wagent.wdrv [WRITE_DRIVE_WTX] fifo_wdrive_wtx of fifo_wdrv
# UVM_INFO fifo_wdrv.sv(35) @ 405: uvm_test_top.env.wagent.wdrv [FIFO_WDRV] WRITE : Data = 0xea
# UVM_INFO fifo_rseq.sv(12) @ 405: uvm_test_top.env.ragent.rsqr@@rseq [uvm_test_top.env.ragent.rsqr.rseq] body of fifo_rbase_rseq
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1289                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    405                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 415: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 450: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x0
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1326                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    450                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 460: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 490: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0xca
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1358                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    490                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 500: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 530: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x14
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1390                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    530                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 540: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 570: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0xd3
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1422                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    570                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 580: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 610: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x38
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1454                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    610                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 620: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 650: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x1
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1486                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    650                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 660: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 690: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x21
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1518                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    690                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 700: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 730: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x9
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1550                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    730                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 740: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 770: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0xe1
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1582                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    770                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 780: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 810: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x5d
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1614                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    810                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 820: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 850: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x1f
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1646                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    850                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 860: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 890: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x41
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1678                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    890                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 900: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 930: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0xaf
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1710                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    930                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 940: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 970: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x2a
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1742                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    970                              
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 980: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1010: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x22
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1774                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    1010                             
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 1020: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1050: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0xb7
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1806                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    1050                             
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 1060: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1090: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x13
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1838                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    1090                             
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 1100: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1130: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x13
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1870                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    1130                             
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 1140: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1170: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x13
# --------------------------------------------------------------------------------
# Name                           Type      Size  Value                            
# --------------------------------------------------------------------------------
# req                            fifo_rtx  -     @1902                            
#   rrd_en                       integral  1     'h1                              
#   rrdata                       integral  8     'h0                              
#   rempty                       integral  1     'h0                              
#   rrd_err                      integral  1     'h0                              
#   begin_time                   time      64    1170                             
#   depth                        int       32    'd2                              
#   parent sequence (name)       string    4     rseq                             
#   parent sequence (full name)  string    33    uvm_test_top.env.ragent.rsqr.rseq
#   sequencer                    string    28    uvm_test_top.env.ragent.rsqr     
# --------------------------------------------------------------------------------
# UVM_INFO fifo_rdrv.sv(28) @ 1180: uvm_test_top.env.ragent.rdrv [READ_DRIVE_RTX] fifo_rdrive_rtx of fifo_rdrv
# UVM_INFO fifo_rdrv.sv(35) @ 1210: uvm_test_top.env.ragent.rdrv [FIFO_RDRV] READ : Data = 0x13
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_objection.svh(1270) @ 1210: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 1210: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   87
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [FIFO_RDRV]    20
# [FIFO_WDRV]    20
# [READ_DRIVE_RTX]    20
# [RNTST]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# [WRITE_DRIVE_WTX]    20
# [uvm_test_top]     1
# [uvm_test_top.env.ragent.rsqr.rseq]     1
# [uvm_test_top.env.wagent.wsqr.wseq]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 1210 ns  Iteration: 75  Instance: /fifo_tb
*/
