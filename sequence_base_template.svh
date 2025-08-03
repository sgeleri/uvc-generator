`ifndef <NAME>_SEQUENCE_BASE_SVH
`define <NAME>_SEQUENCE_BASE_SVH

class <name>_sequence_base extends uvm_sequence_base #(<name>_seqit);
	
	// UVM Factory Registration
	`uvm_object_utils(<name>_sequence_base)
	
	// Sequence item object
	<name>_seqit req;
	
	// Constructor
	function new(string name="<name>_sequence_base");
		super.new(name);
	endfunction : new
	
	// Body 
	virtual task body();
		/*
			Impelement sequence here...
		*/
	endtask : body
	
endclass : <name>_sequence_base

`endif