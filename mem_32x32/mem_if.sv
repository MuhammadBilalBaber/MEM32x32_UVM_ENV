interface mem_if (input logic clk, input logic rst_n);
  logic wr_en;
  logic rd_en;
  logic [5-1:0] addr;
  logic [32-1:0] wr_data;
  logic [32-1:0] data_out;
  logic full;
  logic empty;
  logic half_full;
  
endinterface : mem_if
