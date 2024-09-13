class lg_cov extends uvm_subscriber #(lg_tx);
    `uvm_component_utils(lg_cov)
	lg_tx tx;

    covergroup lg_cg;
        MODE_CP : coverpoint tx.mode {
				  bins specific_modes[] = {[0:3]};  
				  bins other_modes[] = {[4:7]};   
		}

        A_CP : coverpoint tx.a {
			   bins low_range[] = {[0:3]};            // Cover low range 0-3
               bins mid_range[] = {[4:7]};            // Cover mid range 4-7
               bins high_range[] = {[8:15]};          // Cover high range 8-15
		}

        B_CP : coverpoint tx.b {
			   bins edge_values[] = {0, 15};          // Edge cases 0 and 15
        	   bins middle_values[] = {7, 8};         // Middle values
        	   bins other_values[] = {[1:6], [9:14]}; // Remaining values in between
		}

		Y_CP : coverpoint tx.y {
			   bins low_range[] = {[0:7]};            // Lower half
        	   bins high_range[] = {[8:15]};          // Upper half		
		}
		
//        cross MODE_CP,A_CP,B_CP,Y_CP;  // Cross coverage to ensure mode and input combinations
    endgroup

    function new(string name = "", uvm_component parent = null);
        super.new(name, parent);
        lg_cg = new();
    endfunction

    // Trigger the coverage collection when a transaction is observed
    virtual function void write(T t);
//        lg_cg.mode_cp.sample(t.mode);
//        lg_cg.a_cp.sample(t.a);
//      lg_cg.b_cp.sample(t.b);
		$cast(tx,t);
		lg_cg.sample();
    endfunction
endclass

