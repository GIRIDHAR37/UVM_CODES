class lg_base_seq extends uvm_sequence#(lg_tx);
	`uvm_object_utils(lg_base_seq)

	function new(string name = "");
		super.new(name);
	endfunction
	
	task body();
		lg_tx req;
		req=lg_tx::type_id::create("req");
		
// MODE = 0 for AND Operation
		start_item(req);
		assert(req.randomize() with {req.mode==0;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;
		
// MODE = 1 for OR Operation
		start_item(req);
		assert(req.randomize() with {req.mode==1;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 2 for NOT Operation
		start_item(req);
		assert(req.randomize() with {req.mode==2;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 3 for NAND Operation
		start_item(req);
		assert(req.randomize() with {req.mode==3;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 4 for NOR Operation
		start_item(req);
		assert(req.randomize() with {req.mode==4;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 5 for XOR Operation
		start_item(req);
		assert(req.randomize() with {req.mode==5;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 6 for XNOR Operation
		start_item(req);
		assert(req.randomize() with {req.mode==6;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

// MODE = 7 for BUFF Operation
		start_item(req);
		assert(req.randomize() with {req.mode==7;});
		`uvm_info(get_type_name(),$sformatf("a=%0d , b=%0d , mode : %0d",req.a,req.b,req.mode),UVM_LOW)
		finish_item(req);
		#10;

	endtask
endclass
