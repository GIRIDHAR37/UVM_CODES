class fifo_rmon extends uvm_monitor;

	`uvm_component_utils(fifo_rmon)

	virtual fifo_rif rvif;
	fifo_rtx rtx;

	uvm_analysis_port#(fifo_rtx) rap_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		rap_port=new("rap_port",this);
		if(!uvm_config_db#(virtual fifo_rif)::get(this,"*","vif",rvif)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

		task run_phase(uvm_phase phase);
			forever begin
				@(posedge rvif.rclk);
				rtx=new();
				rtx.rrd_en=rvif.rrd_en;
				if(rtx.rrd_en==1)
					rtx.rrdata=rvif.rrdata;
				rtx.rempty=rvif.rempty;
				rtx.rrd_err=rvif.rrd_err;
				rap_port.write(rtx);
			end
		endtask

endclass

