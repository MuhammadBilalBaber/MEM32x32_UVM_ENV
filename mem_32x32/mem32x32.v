module mem_32x32 (
  input clk,
  input rst_n,
  input wr_en,
  input rd_en,
  input [4:0] addr,
  input [31:0] data_in,
  output reg [31:0] data_out,
  output reg full,
  output reg empty,
  output reg half_full
);

  reg [31:0] mem_32x32 [31:0];
  integer i;
  integer count;

  always @(posedge clk) begin
    if (!rst_n) begin
      for(i = 0; i < 32; i = i + 1) begin
        mem_32x32[i] <= 32'h0;
      end 
        count <= 0;
        data_out <= 32'h0;
        full <= 0;
        empty <= 1;
        half_full <= 0;
    end 
  end 
  always @(posedge clk) begin
      // Write logic
      if (wr_en && !full) begin
        mem_32x32[addr] <= data_in;
        count <= count + 1;
        empty <= 0;
      end
  end 

  always @(posedge clk) begin
      // Read logic
      if (rd_en  && !empty) begin
        data_out <= mem_32x32[addr];
        count <= count - 1;
      end
  end 

  always @(posedge clk) begin
      // empty logic
      if (count == 0) begin
        empty <= 1;
      end
      else 
        empty <=0;
  end

  always @(posedge clk) begin
      // half_full logic
      if (count == 16) begin
        half_full <= 1;
      end
      else 
        half_full <=0;
  end

  always @(posedge clk) begin
     // full logic
     if (count == 32) begin
          full <= 1;
     end
     else 
          full <=0;
  end



endmodule
