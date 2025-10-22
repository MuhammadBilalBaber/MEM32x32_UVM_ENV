`include "uvm_macros.svh"
import uvm_pkg::*;
class mem_monitor extends uvm_monitor;
  `uvm_component_utils(mem_monitor);


  function new(string name = "mem_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual mem_if mem_if;
  mem_seq_item item;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item = mem_seq_item::type_id::create("item");
    if(!uvm_config_db#(virtual mem_if)::get(this, "", "mem_if", mem_if))
      `uvm_fatal(get_type_name(),"didn't get interface instance")

  endfunction

  virtual task run_phase(uvm_phase phase);
  // Wait for reset deassertion
  wait (mem_if.rst_n === 1);
   @(posedge mem_if.clk);

  forever begin
    @(posedge mem_if.clk);
    @(posedge mem_if.clk);
    compare_data();
    @(posedge mem_if.clk);
  end
endtask : run_phase

  task compare_data();
         item.wr_en     =mem_if.wr_en     ;
         item.rd_en     =mem_if.rd_en     ;
         item.addr      =mem_if.addr      ;
         item.wr_data   =mem_if.wr_data   ;
         item.data_out  =mem_if.data_out;
         item.full      =mem_if.full      ;
         item.empty     =mem_if.empty     ;
         item.half_full =mem_if.half_full ;

    `uvm_info(get_type_name(), $sformatf("The wr_en is %0h", mem_if.wr_en), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The rd_en is %0h", mem_if.rd_en), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The addr is %0h", mem_if.addr), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The wr_data is %0h", mem_if.wr_data), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The data_out is %0h", mem_if.data_out), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The full is %0h", mem_if.full), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The empty is %0h", mem_if.empty), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("The half_full is %0h", mem_if.half_full), UVM_LOW)
endtask

endclass
