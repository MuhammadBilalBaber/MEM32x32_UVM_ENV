interface mem_if (input logic clk, input logic rst_n);
  logic wr_en;
  logic rd_en;
  logic [5-1:0] addr;
  logic [32-1:0] wr_data;
  logic [32-1:0] data_out;
  logic full;
  logic empty;
  logic half_full;

  // Assertion to check the propert for memory empty
// when reset is active then in the next cycle the empty signal should be high

  property mem_empty;
    @(posedge clk)
      disable iff(rst_n)
      !rst_n |=> empty;
  endproperty

  assert_mem_empty: assert property(mem_empty)
    else $error("Memory is not empty");

  // This assertion will check the behavior if the 
  // memory is empty and still the user try to read something 
  // then the data return to the user should be 0.

  property read_if_mem_empty;
     @(posedge clk)
       disable iff(!rst_n)
       (empty && rd_en ) |-> !data_out;
  endproperty

   assert_read_if_empty: assert property(read_if_mem_empty)
    else $error("WHen mem is empty data_out is not zero");

// This assertion will check if the user write something to memory
// then empty should be deasserted. 

  property if_wr_en;
     @(posedge clk)
     disable iff(!rst_n)
     // wr_en |-> ##1 !empty;
     wr_en |=>  !empty;
  endproperty

  assert_if_wr_en: assert property(if_wr_en)
    else $error("After write to mem empty is still high!");

// This is to check when there is a read rqeuest then the  dataout
// should never be "x" or "z"
  property if_rd_en;
    @(posedge clk)
    disable iff(!rst_n)
    rd_en |=> !$isunknown(data_out); 
  endproperty

  assert_if_rd_en: assert property(if_rd_en)
    else $error("The data_out is unknown after rd_en");

  //   property mem_data_out;
  //   @(posedge clk) empty -> data_out;
  // endproperty

  //   assert property(mem_data_out);
  
endinterface : mem_if
