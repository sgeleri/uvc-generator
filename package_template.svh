`ifndef <NAME>_PKG_SVH
`define <NAME>_PKG_SVH

package <name>_pkg;

	`include "uvm_macros.svh"
	
	import uvm_pkg::*;
	
	`include "<name>_seqit.svh"
	
	`include "<name>_config.svh"
	`include "<name>_driver.svh"
	`include "<name>_monitor.svh"
	`include "<name>_sequencer.svh"
	`include "<name>_agent.svh"
	
	`include "<name>_sequence_base.svh"

endpackage : <name>_pkg

`endif