`include "uvm_macros.svh"
import uvm_pkg::*;
class mem_agent extends uvm_agent;
  `uvm_component_utils(mem_agent)

  mem_sequencer mem_seqr;
  mem_driver    mem_drvr;
  mem_monitor   mem_montr;

  function new(string name="mem_driver", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   mem_seqr =mem_sequencer::type_id::create("mem_seqr",this);
   mem_drvr =mem_driver::type_id::create("mem_drvr",this);
   mem_montr=mem_monitor::type_id::create("mem_montr",this);
 endfunction

 virtual function void connect_phase(uvm_phase phase);
  mem_drvr.seq_item_port.connect(mem_seqr.seq_item_export);
endfunction

endclass
