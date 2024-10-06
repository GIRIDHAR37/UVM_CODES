`define COMP_NEW\
	function new(string name="",uvm_component parent);\
		super.new(name,parent);\
	endfunction\

`define OBJ_NEW\
	function new(string name="");\
		super.new(name);\
	endfunction\

`define addr_width 16
`define width 32
