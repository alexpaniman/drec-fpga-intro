`timescale 1 ns / 100 ps

module testbench();
   reg clk = 1'b0; always #1 clk = ~clk;

   clock_divider #(
       .NATIVE_CLK_FREQUENCY(100000),
       .TARGET_CLK_FREQUENCY(10000)
   ) clk_div(.clk(clk), .target_clk());

   initial begin
      $dumpvars;
      $display("Test started...");
      #1000 $finish;
   end

endmodule
