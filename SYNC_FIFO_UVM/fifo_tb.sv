`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "fifo_if.sv"
`include "fifo_tx.sv"
`include "fifo_cov.sv"
`include "fifo_mon.sv"
`include "fifo_seq.sv"
`include "fifo_sqr.sv"
`include "fifo_drv.sv"
`include "fifo_agent.sv"
`include "fifo_env.sv"
`include "fifo_test.sv"
`include "fifo.v"

module fifo_tb;

	bit clk,rst;

	fifo_if pif(clk,rst);

	syncfifo dut(.clk(pif.clk),
			 .rst(pif.rst),
			 .wr_en(pif.wr_en),
			 .rd_en(pif.rd_en),
			 .wdata(pif.wdata),
			 .rdata(pif.rdata),
			 .full(pif.full),
			 .empty(pif.empty),
			 .wr_err(pif.wr_err),
			 .rd_err(pif.rd_err)
			);

	initial begin
		uvm_resource_db#(virtual fifo_if)::set("GLOBAL","VIF",pif,null);
		run_test("fifo_base_test");
	end

	initial begin
		clk=0;
		rst=1;
	    repeat(2) @(posedge clk);
		rst=0;
	end

	always #5 clk=~clk;

endmodule

// output :
/*
# UVM_INFO @ 0: reporter [RNTST] Running test fifo_base_test...
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# --------------------------------------------------------------
# Name                       Type                    Size  Value
# --------------------------------------------------------------
# uvm_test_top               fifo_base_test          -     @338 
#   env                      fifo_env                -     @351 
#     agent                  fifo_agent              -     @360 
#       cov                  fifo_cov                -     @545 
#         analysis_imp       uvm_analysis_imp        -     @554 
#       drv                  fifo_drv                -     @370 
#         rsp_port           uvm_analysis_port       -     @389 
#         seq_item_port      uvm_seq_item_pull_port  -     @379 
#       mon                  fifo_mon                -     @536 
#         ap_port            uvm_analysis_port       -     @565 
#       sqr                  uvm_sequencer           -     @399 
#         rsp_export         uvm_analysis_export     -     @408 
#         seq_item_export    uvm_seq_item_pull_imp   -     @526 
#         arbitration_queue  array                   0     -    
#         lock_queue         array                   0     -    
#         num_last_reqs      integral                32    'd1  
#         num_last_rsps      integral                32    'd1  
# --------------------------------------------------------------
# 
# UVM_INFO fifo_test.sv(22) @ 0: uvm_test_top [uvm_test_top] run_phase of fifo_base_test
# UVM_INFO fifo_seq.sv(13) @ 0: uvm_test_top.env.agent.sqr@@seq [uvm_test_top.env.agent.sqr.seq] body of fifo_base_seq
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @611                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hfb                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    0                             
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 10: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 25: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xfb
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @657                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h25                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    25                            
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 35: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 45: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x25
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @673                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h68                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    45                            
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 55: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 65: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x68
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @689                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hf2                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    65                            
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 75: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 85: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xf2
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @705                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hd3                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    85                            
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 95: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 105: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xd3
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @721                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hf6                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    105                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 115: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 125: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xf6
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @737                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h8f                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    125                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 135: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 145: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x8f
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @753                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h93                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    145                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 155: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 165: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x93
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @769                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h8                           
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    165                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 175: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 185: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x8
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @785                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h45                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    185                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 195: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 205: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x45
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @801                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hf5                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    205                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 215: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 225: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xf5
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @817                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hd7                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    225                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 235: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 245: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xd7
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @833                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'haf                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    245                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 255: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 265: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xaf
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @849                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'ha3                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    265                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 275: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 285: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xa3
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @865                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'hf0                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    285                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 295: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 305: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xf0
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @881                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h7d                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    305                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 315: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 325: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x7d
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @897                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h5a                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    325                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 335: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 345: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x5a
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @913                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h38                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    345                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 355: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 365: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x38
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @929                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'he                           
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    365                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 375: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 385: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0xe
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @945                          
#   wr_en                        integral  1     'h1                           
#   rd_en                        integral  1     'h0                           
#   wdata                        integral  8     'h88                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    385                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 395: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(38) @ 405: uvm_test_top.env.agent.drv [FIFO_DRV] WRITE : Data = 0x88
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @961                          
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h59                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    405                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 415: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 425: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x0
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @977                          
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'ha2                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    425                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 435: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 445: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xfb
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @993                          
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h14                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    445                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 455: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 465: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x25
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1009                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h28                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    465                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 475: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 485: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x68
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1025                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h9b                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    485                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 495: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 505: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xf2
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1041                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hcd                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    505                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 515: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 525: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xd3
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1057                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h30                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    525                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 535: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 545: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xf6
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1073                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h93                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    545                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 555: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 565: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x8f
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1089                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hb2                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    565                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 575: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 585: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x93
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1105                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h6b                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    585                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 595: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 605: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x8
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1121                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'he7                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    605                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 615: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 625: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x45
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1137                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'he7                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    625                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 635: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 645: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xf5
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1153                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'ha4                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    645                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 655: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 665: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xd7
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1169                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h24                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    665                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 675: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 685: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xaf
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1185                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hac                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    685                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 695: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 705: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xa3
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1201                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hf3                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    705                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 715: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 725: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0xf0
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1217                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hb5                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    725                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 735: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 745: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x7d
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1233                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'h82                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    745                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 755: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 765: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x7d
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1249                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'heb                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    765                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 775: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 785: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x7d
# -----------------------------------------------------------------------------
# Name                           Type      Size  Value                         
# -----------------------------------------------------------------------------
# req                            fifo_tx   -     @1265                         
#   wr_en                        integral  1     'h0                           
#   rd_en                        integral  1     'h1                           
#   wdata                        integral  8     'hd6                          
#   rdata                        integral  8     'h0                           
#   full                         integral  1     'h0                           
#   empty                        integral  1     'h0                           
#   wr_err                       integral  1     'h0                           
#   rd_err                       integral  1     'h0                           
#   begin_time                   time      64    785                           
#   depth                        int       32    'd2                           
#   parent sequence (name)       string    3     seq                           
#   parent sequence (full name)  string    30    uvm_test_top.env.agent.sqr.seq
#   sequencer                    string    26    uvm_test_top.env.agent.sqr    
# -----------------------------------------------------------------------------
# UVM_INFO fifo_drv.sv(31) @ 795: uvm_test_top.env.agent.drv [DRIVE_TX] fifo_drive_tx of fifo_drv
# UVM_INFO fifo_drv.sv(46) @ 805: uvm_test_top.env.agent.drv [FIFO_DRV] READ : Data = 0x7d
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_objection.svh(1270) @ 805: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_report_server.svh(847) @ 805: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   86
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [DRIVE_TX]    40
# [FIFO_DRV]    40
# [RNTST]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# [uvm_test_top]     1
# [uvm_test_top.env.agent.sqr.seq]     1
# 
# ** Note: $finish    : E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 805 ns  Iteration: 75  Instance: /fifo_tb
# 1
# Break in Task uvm_pkg/uvm_root::run_test at E:/UVM/uvm-1.2/uvm-1.2/src/base/uvm_root.svh line 517
*/
