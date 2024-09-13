//typedef uvm_sequencer#(lg_tx) lg_sqr;

class lg_sqr extends uvm_sequencer#(lg_tx); 
  `uvm_component_utils(lg_sqr) 
   
  function new(string name="", uvm_component parent); 
    super.new(name,parent); 
  endfunction 
   
  function void build_phase(uvm_phase phase); 
    super.build_phase(phase); 
  endfunction 
   
endclass
