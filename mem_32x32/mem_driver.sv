
`include "uvm_macros.svh"
import uvm_pkg::*;
class mem_driver extends uvm_driver #(mem_seq_item);
  `uvm_component_utils(mem_driver)

  function new(string name="mem_driver",uvm_component parent);
     super.new(name,parent);
  endfunction

  virtual mem_if mem_if;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    req = mem_seq_item::type_id::create("req");

    if (!uvm_config_db#(virtual mem_if)::get(this, "", "mem_if", mem_if))
        `uvm_fatal(get_type_name(), "NOT get the interface instance")
  endfunction


  virtual task run_phase(uvm_phase phase);
    wait (mem_if.rst_n === 1);
    @(posedge mem_if.clk);
    forever begin
     /* seq_item_port.get_next_item(req);
        mem_write();
      req.set_id_info(req);
      seq_item_port.put(req);
      seq_item_port.item_done(); 
      */
      seq_item_port.get(req);
        mem_write();
      req.set_id_info(req);
      seq_item_port.put(req);
      // seq_item_port.item_done(); 
    end
  endtask : run_phase

  task mem_write();
    mem_if.wr_en   = req.wr_en;
    mem_if.rd_en   = req.rd_en;
    mem_if.addr    = req.addr;
    mem_if.wr_data = req.wr_data;
    @(posedge mem_if.clk);
    @(posedge mem_if.clk);
    mem_if.wr_en   = 0;
    @(posedge mem_if.clk);
  endtask 


endclass
