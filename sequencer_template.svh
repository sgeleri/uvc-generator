`ifndef <NAME>_SEQUENCER_SVH
`define <NAME>_SEQUENCER_SVH

class <name>_sequencer extends uvm_sequencer #(<name>_seqit);
	
	// UVM Factory Registration
	`uvm_component_utils(<name>_sequencer)
	
	// Constructor function
	extern function new(string name="<name>_sequencer", uvm_component parent=null);
endclass : <name>_sequencer

// Constructor
function <name>_sequencer::new(string name="<name>_sequencer", uvm_component parent=null);
	super.new(name, parent);
endfunction : new

`endif