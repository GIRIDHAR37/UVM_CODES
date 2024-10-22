class pd_cov extends uvm_subscriber#(pd_tx);
	
	`uvm_component_utils(pd_cov)

	pd_tx tx;

	covergroup pd_cg;
		DATA : coverpoint tx.data {
			bins data_bins[]={[0:1]};
		}

	endgroup

	function new(string name="",uvm_component parent=null);
		super.new(name,parent);
		pd_cg=new();
	endfunction

	virtual function void write(T t);
		$cast(tx,t);
		pd_cg.sample();
	endfunction

endclass
