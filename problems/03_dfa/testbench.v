`timescale 1 ns / 100 ps

module testbench();
   reg clk = 1'b0; always #1 clk = ~clk;

   reg input_sequence = 0, reset = 1;
   wire condition_met;

   dfa_two_last_bits_are_01 dfa(
    .clk(clk), .reset(reset),
    .input_sequence(input_sequence),
    .condition_met(condition_met)
   );

   initial begin
      $dumpvars;
      $display("Test started...");
      #2 reset = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #2 input_sequence = 1;
      #2 input_sequence = 0;
      #2 input_sequence = 0;
      #2 input_sequence = 1;
      #64 $finish;
   end
endmodule
