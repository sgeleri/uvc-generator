`ifndef <NAME>_AGENT_SVH
`define <NAME>_AGENT_SVH

class <name>_agent extends uvm_agent #(<name>_seqit);
	
	// UVM Factory Registration
	`uvm_component_utils(<name>_agent)
	
	// Object handles
	<name>_driver h_driver;
	<name>_sequencer h_sequencer;
	<name>_monitor h_monitor;

	// Configuration object
	<name>_config h_cfg;
	
	// Functions & Tasks
	extern function new(string name="<name>_agent", uvm_component parent=null);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
endclass : <name>_agent

// Constructor
function <name>_agent::new(string name="<name>_agent", uvm_component parent=null);
	super.new(name, parent);
endfunction : new

// Build phase
function void <name>_agent::build_phase(uvm_phase phase);
	super.build_phase(phase);

	// Get config object
	if(!uvm_config_db#(<name>_config)::get(this, "", "<name>_config", h_cfg)) begin
		AGENT_CFG_FATAL : `uvm_fatal("AGENT", "Could not get the configuration from config_db. Have you set it?")		
	end
	if(h_cfg.vif == null) begin
		AGENT_VIF_FATAL : `uvm_fatal("AGENT", "Could not get the interface from config_db. Have you set it?")
	end
	
	// Create object
	if(h_cfg.active == UVM_ACTIVE) begin
		h_driver = <name>_driver::type_id::create("h_driver", this);
		h_sequencer = <name>_sequencer::type_id::create("h_sequencer", this);
	end
	h_monitor = <name>_monitor::type_id::create("h_monitor", this);
endfunction : build_phase

// Connect phase
function void <name>_agent::connect_phase(uvm_phase phase);
	super.connect_phase(phase);

	// Connect driver to sequencer
	if(h_cfg.active == UVM_ACTIVE) begin
		h_driver.seq_item_port.connect(h_sequencer.seq_item_export);
	end
endfunction : connect_phase

`endif