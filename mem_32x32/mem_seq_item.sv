`include "uvm_macros.svh"
import uvm_pkg::*;

class mem_seq_item extends uvm_sequence_item;

  rand logic wr_en;
  rand logic rd_en;
  rand logic [5-1:0] addr;
  rand logic [32-1:0] wr_data;
  rand logic [32-1:0] data_out;
  rand logic full;
  rand logic empty;
  rand logic half_full;

  `uvm_object_utils_begin(mem_seq_item)
     `uvm_field_int(wr_en, UVM_ALL_ON)
     `uvm_field_int(rd_en, UVM_ALL_ON)
     `uvm_field_int(addr, UVM_ALL_ON)
     `uvm_field_int(wr_data, UVM_ALL_ON)
     `uvm_field_int(data_out, UVM_ALL_ON)
     `uvm_field_int(full, UVM_ALL_ON)
     `uvm_field_int(empty, UVM_ALL_ON)
     `uvm_field_int(half_full, UVM_ALL_ON)
  `uvm_object_utils_end 

  //****************************************
  //             CONSTRUCTOR
  //****************************************
   
  function new(string name= "mem_seq_item");
    super.new(name);
  endfunction : new

endclass : mem_seq_item
