class apb_mon extends uvm_monitor;
	
	`uvm_component_utils(apb_mon)
	
	virtual apb_if vif;
	apb_tx tx;

	uvm_analysis_port#(apb_tx) ap_port;

	function new(string name="",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap_port=new("ap_port",this);
		if(!uvm_resource_db#(virtual apb_if)::read_by_name("GLOBAL","VIF",vif,this)) begin
			`uvm_fatal(get_full_name(),"virtual interface not set")
		end
	endfunction

	task run_phase(uvm_phase phase);
		forever begin
			@(vif.cb_mon);
			tx=new();
			if(/*vif.cb_mon.psel_i==1'b1 &&*/ vif.cb_mon.pready_o==1'b1 && vif.cb_mon.penable_i==1'b1) begin
//				tx=new();
				tx.pwrite_i=vif.cb_mon.pwrite_i;
				tx.paddr_i=vif.cb_mon.paddr_i;
				if(tx.pwrite_i) begin
					$display("true");
					tx.pwdata_i=vif.cb_mon.pwdata_i;
					tx.pready_o=vif.cb_mon.pready_o;
					tx.pslverr_o=vif.cb_mon.pslverr_o;
				end
				else begin
					$display("false");
					tx.prdata_o=vif.cb_mon.prdata_o;
					tx.pready_o=vif.cb_mon.pready_o;
					tx.pslverr_o=vif.cb_mon.pslverr_o;
				end
			ap_port.write(tx);
			tx.print();
			end
//			ap_port.write(tx);
//			tx.print();
		end
	endtask

endclass
