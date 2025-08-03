`ifndef <NAME>_SEQIT_SVH
`define <NAME>_SEQIT_SVH

class <name>_seqit extends uvm_sequence_item;
	
	// UVM Factory Registration
	`uvm_object_utils(<name>_seqit)

	/*
		Declare variables here...
	*/

	// Constructor
	virtual	function new(string name="<name>_sequencer");
		super.new(name);
	endfunction : new
	
	virtual function string convert2string();
		string s;
		
		s = super.convert2string();
		
		/*
			Implement function here...
		*/
		
		return s;
	endfuntion : convert2string
	
	virtual function void do_print(uvm_printer printer);
		/*
			Implement function here...
		*/
	endfunction : do_print

	virtual function do_copy(uvm_object rhs);
		/*
			Implement function here...
		*/
	endfunction : do_copy
	
	virtual function do_compare(uvm_object rhs, uvm_comparer comparer);
		/*
			Implement function here...
		*/
	endfunction : do_compare
endclass : <name>_seqit

`endif