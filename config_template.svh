`ifndef <NAME>_CONFIG_SVH
`define <NAME>_CONFIG_SVH

class <name>_config extends uvm_object;
	
	// UVM Factory Registration
	`uvm_object_utils(<name>_config)

    // Virtual interface
    virtual <name>_if vif;
	
	// Configuration variables
    uvm_active_passive_enum active = UVM_ACTIVE;
	
endclass : <name>_config

// Constructor
function <name>_config::new(string name="<name>_config");
    super.new(name);
endfunction : new
`endif