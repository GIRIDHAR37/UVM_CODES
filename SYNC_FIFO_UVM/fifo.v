// SYNC_FIFO
module syncfifo(clk,rst,wdata,rdata,wr_en,rd_en,full,empty,wr_err,rd_err);
// parameter decleration
	parameter WIDTH=8,DEPTH=16,PTR_WIDTH=$clog2(DEPTH);
// INPUTS
	input clk,rst,wr_en,rd_en;
	input [WIDTH-1:0]wdata;
//outputs
	output reg [WIDTH-1:0]rdata;
	output reg full,empty,wr_err,rd_err;
//internal registers
	reg [PTR_WIDTH-1:0]wr_ptr,rd_ptr;
	reg wr_togg_f,rd_togg_f;
// fifo memory creation 
	reg [WIDTH-1:0] fifo_mem [DEPTH-1:0];
	integer i;
//fifo mmodeling
	always @(posedge clk) begin
    	if(rst) begin
	  		rdata=0;full=0;empty=0;wr_err=0;rd_err=0;
	  		wr_ptr=0;rd_ptr=0;wr_togg_f=0;rd_togg_f=0;
	  		for(i=0;i<DEPTH;i=i+1)
	      		fifo_mem[i]=0;
		end
		else begin
	    	wr_err=0;rd_err=0;
		// write operation
	    	if(wr_en==1) begin
		   		if(full==1) begin
		     		wr_err=1;
		   		end
		   		else begin
		     		fifo_mem[wr_ptr]=wdata;
			 		wr_ptr=wr_ptr+1;
			 		if(wr_ptr==DEPTH-1) begin
			    		wr_togg_f=~wr_togg_f;
			 		end
		   		end
			end
		end
	  // read operation
    		if(rd_en==1) begin
				if(empty==1) begin
		   			rd_err=1;
        		end		   
				else begin
		     		rdata=fifo_mem[rd_ptr];
			 		rd_ptr=rd_ptr+1;
			 		if(rd_ptr==DEPTH-1) begin
			    		rd_togg_f=~rd_togg_f;
			 		end
				end
			end
	end
//logic to generate full and empty falg indication
	always @(posedge clk) begin
     	if(wr_ptr==rd_ptr && wr_togg_f!=rd_togg_f)
	    	full=1;
	 	else
	    	full=0;
     	if(wr_ptr==rd_ptr && wr_togg_f==rd_togg_f)
	    	empty=1;
	 	else
	    	empty=0;
	end
	
endmodule
		    
