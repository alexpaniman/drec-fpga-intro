`timescale 1 ns / 100 ps

module testbench();
   reg clk = 1'b0; always #1 clk = ~clk;

   reg reset = 1'b0;
   clock_divider #(
       .NATIVE_CLK_FREQUENCY(15),
       .TARGET_CLK_FREQUENCY(5)
   ) clk_div(.clk(clk), .reset(reset));

   initial begin
      $dumpvars;
      $display("Test started...");
      #7  reset = 1;
      #1  reset = 0;
      #15 reset = 1;
      #1  reset = 0;
      #31 reset = 1;
      #1  reset = 0;
      #128 $finish;
   end

endmodule
