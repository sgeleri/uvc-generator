`ifndef <NAME>_MONITOR_SVH
`define <NAME>_MONITOR_SVH

class <name>_monitor extends uvm_monitor #(<name>_seqit);
	
	// UVM Factory Registration
	`uvm_component_utils(<name>_monitor)
	
	// Virtual interface
	virtual <name>_if vif;

	// Configuration object
	<name>_config h_cfg;
	
	// Analysis port
	uvm_analysis_port #(<name>_seqit) mon_ap;
	
	// Functions & Tasks
	extern function new(string name="<name>_monitor", uvm_component parent=null);
	extern function void build_phase(uvm_phase phase);
	extern function void start_of_simulation_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task monitor_data();
endclass : <name>_monitor

// Constructor
function <name>_monitor::new(string name="<name>_monitor", uvm_component parent=null);
	super.new(name, parent);
endfunction : new

// Build phase
function void <name>_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	
	// Create analysis port
	mon_ap = new("mon_ap", this);
endfunction : build_phase

// Start of simulation phase
function void <name>_monitor::start_of_simulation_phase(uvm_phase phase);
	vif = h_cfg.vif;
endfunction : start_of_simulation_phase

// Run phase
task <name>_monitor::run_phase(uvm_phase phase);
	// Sequence item object
	<name>_seqit mon_seqit;
	
	// Monitor data
	forever begin
		monitor_data();
	end
endtask : run_phase

// Monitoring task
task <name>_monitor::monitor_data();
	// Create sequence item object
	mon_seqit = <name>_seqit::type_id::create("mon_seqit");
	
	/*
		Implement here...
	*/
	
	// Write the monitored data to analysis port
	mon_ap.write(mon_seqit);
endtask : monitor_data

`endif