module top_tb;
  import uvm_pkg::*;


bit clk;
bit rst_n;
always #5 clk = ~clk;

mem_if mem_if(clk,rst_n);

mem_32x32 mem_dut(
                   .clk(mem_if.clk),
                   .rst_n(mem_if.rst_n),
                   .wr_en(mem_if.wr_en),
                   .rd_en(mem_if.rd_en),
                   .addr(mem_if.addr),
                   .data_in(mem_if.wr_data),
                   .data_out(mem_if.data_out),
                   .full(mem_if.full),
                   .empty(mem_if.empty),
                   .half_full(mem_if.half_full)
                   );

initial begin
  rst_n = 0;
  @(posedge clk);
  @(posedge clk);
  rst_n =1;
end

initial begin
  uvm_config_db#(virtual mem_if)::set(null, "uvm_test_top.*", "mem_if",mem_if );
  run_test("mem_test");
end


  // End simulation after some time
  // initial begin
  //   #2000;
  //   $finish();
  // end

endmodule : top_tb
