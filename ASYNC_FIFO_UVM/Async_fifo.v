module async_fifo(wr_clk,rd_clk,rst,wdata,rdata,wr_en,rd_en,full,empty,wr_err,rd_err);
// parameters decleration
	parameter WIDTH=8,DEPTH=16,PTR_WIDTH=$clog2(DEPTH);
// port declerations
// inputs
	input wr_clk,rd_clk,rst,wr_en,rd_en;
	input [WIDTH-1:0]wdata;
// outputs
	output reg [WIDTH-1:0]rdata;
	output reg full,empty,wr_err,rd_err;
// internal registers
	reg [PTR_WIDTH-1:0]wr_ptr,rd_ptr,wr_ptr_rd_clk,rd_ptr_wr_clk;
	reg wr_togg_f,rd_togg_f,wr_togg_f_rd_clk,rd_togg_f_wr_clk;
// fifo modeling 
	reg [WIDTH-1:0]fifo_mem[DEPTH-1:0];
	integer i;
	always @(posedge wr_clk) begin
   		if(rst==1) begin 
   			rdata=0;full=0;empty=0;wr_err=0;rd_err=0;wr_ptr=0;rd_ptr=0;wr_ptr_rd_clk=0;
   			rd_ptr_wr_clk=0;wr_togg_f=0;rd_togg_f=0;wr_togg_f_rd_clk=0;rd_togg_f_wr_clk=0;
     		for(i=0;i<DEPTH;i=i+1) 
				fifo_mem[i]=0; 
   		end
   		else begin 
			wr_err=0; 
      		if(wr_en==1) begin 
	    		if(full) 
					wr_err=1; 
	  			else begin 
	  				fifo_mem[wr_ptr]=wdata; 
	  				wr_ptr=wr_ptr+1; // to write the data into fifo
	     			if(wr_ptr==DEPTH-1) 
		    			wr_togg_f=~wr_togg_f;  
	  			end 
	  		end 
   		end
	end
	always @(posedge rd_clk) begin
     	if(rst!=1) begin 
			rd_err=0;
	  		if(rd_en==1) begin
	    		if (empty==1) begin 
					rd_err=1; 
				end
				else begin 
		   			rdata<=fifo_mem[rd_ptr]; 
		   			rd_ptr=rd_ptr+1; // to read the data from fifo
		  			if(rd_ptr==DEPTH-1) 
						rd_togg_f=~rd_togg_f;
		    	end 
			end 
		end 
	end

// synchronization for wr_clk 
	always @(posedge wr_clk) begin
    	wr_ptr_rd_clk<=wr_ptr;
		wr_togg_f_rd_clk<=wr_togg_f;
	end
// synchronization for rd_clk 
	always @(posedge rd_clk) begin
    	rd_ptr_wr_clk<=rd_ptr;
		rd_togg_f_wr_clk<=rd_togg_f;
	end

// combinational logic to generate the full and empty condition 
	always @(*) begin 
    	if(wr_ptr==rd_ptr_wr_clk&&wr_togg_f!=rd_togg_f_wr_clk) 
			full=1; 
		else 
			full=0; // full condition
    	if(wr_ptr_rd_clk==rd_ptr&&wr_togg_f_rd_clk==rd_togg_f) 
			empty=1; 
		else 
			empty=0; // empty condition
	end
	
endmodule
