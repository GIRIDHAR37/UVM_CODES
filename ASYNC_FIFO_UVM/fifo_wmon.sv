class fifo_wmon extends uvm_monitor;

	`uvm_component_utils(fifo_wmon)

	virtual fifo_wif wvif;
	fifo_wtx wtx;

	uvm_analysis_port#(fifo_wtx) wap_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wap_port=new("wap_port",this);
		if(!uvm_resource_db#(virtual fifo_wif)::read_by_name("GLOBAL","VIF",wvif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

		task run_phase(uvm_phase phase);
			forever begin
				@(posedge wvif.wclk);
				wtx=new();
				wtx.wwr_en=wvif.wwr_en;
				if(wtx.wwr_en==1)
					wtx.wwdata=wvif.wwdata;
				wtx.wfull=wvif.wfull;
				wtx.wwr_err=wvif.wwr_err;
				wap_port.write(wtx);
			end
		endtask

endclass
