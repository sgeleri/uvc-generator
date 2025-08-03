`ifndef <NAME>_DRIVER_SVH
`define <NAME>_DRIVER_SVH

class <name>_driver extends uvm_driver #(<name>_seqit);
	
	// UVM Factory Registration
	`uvm_component_utils(<name>_driver)
	
	// Virtual interface
	virtual <name>_if vif;

	// Configuration object
	<name>_config h_cfg;
	
	// Functions & Tasks
	extern function new(string name="<name>_driver", uvm_component parent=null);
	extern function void build_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task drive_data(<name>_seqit req);
endclass : <name>_driver

// Constructor
function <name>_driver::new(string name="<name>_driver", uvm_component parent=null);
	super.new(name, parent);
endfunction : new

// Build phase
function void <name>_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction : build_phase

// Start of simulation phase
function void <name>_driver::start_of_simulation_phase(uvm_phase phase);
	vif = h_cfg.vif;
endfunction : start_of_simulation_phase

// Run phase
task <name>_driver::run_phase(uvm_phase phase);
	// Get item from sequencer and driver
	forever begin
		seq_item_port.get_next_item(req);
		drive_data(req);
		seq_item_port.item_done(req);
	end
endtask : run_phase

// Driving task
task <name>_driver::drive_data(<name>_seqit req);
	/*
		Implement here...
	*/
endtask : drive_data

`endif