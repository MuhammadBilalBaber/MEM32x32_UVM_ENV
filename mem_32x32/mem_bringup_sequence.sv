`include "uvm_macros.svh"
import uvm_pkg::*;
class mem_bringup_sequence extends uvm_sequence#(mem_seq_item);
  `uvm_object_utils(mem_bringup_sequence)

  function new(string name="mem_bringup_sequence");
    super.new(name);
  endfunction

virtual task body();
  mem_write();
  read_data1();

endtask : body


virtual task mem_write();
repeat(1) begin
  `uvm_info(get_type_name(), "Starting bring-up sequence", UVM_LOW)

  req = mem_seq_item::type_id::create("req");

  start_item(req);
  assert(req.randomize() with {
      req.wr_en   == 1;
      req.rd_en   == 0;
      // req.addr    inside {[0:31]};
      req.addr    == 'h5;
      req.wr_data inside {[0:345264]};
  }) else
    `uvm_error(get_type_name(), "Randomization failed");
  finish_item(req);

  `uvm_info(get_type_name(), "Transaction sent", UVM_LOW)

  get_response(req);
  `uvm_info(get_type_name(),$sformatf("The response get is %p",req), UVM_LOW)
  if(req.wr_data=='h30eec) begin
  `uvm_info(get_type_name(), "Data is from response", UVM_LOW) 
  end
end
endtask 

virtual task read_data1();
repeat(1) begin
  `uvm_info(get_type_name(), "Starting bring-up sequence", UVM_LOW)

  req = mem_seq_item::type_id::create("req");

  start_item(req);
  assert(req.randomize() with {
      req.rd_en   == 1;
      req.wr_en   == 0;
      // req.addr    inside {[0:31]};
      req.addr    == 'h5;
      // req.wr_data inside {[0:345264]};
  }) else
    `uvm_error(get_type_name(), "Randomization failed");
  finish_item(req);

  `uvm_info(get_type_name(), "Transaction sent", UVM_LOW)

  get_response(req);
  `uvm_info(get_type_name(),$sformatf("The response get is %p",req), UVM_LOW)
  if(req.wr_data=='h30eec) begin
  `uvm_info(get_type_name(), "Data is from response", UVM_LOW) 
  end
end
endtask
 

endclass
