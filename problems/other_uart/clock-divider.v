module clock_divider #(
  parameter NATIVE_CLK_FREQUENCY = 1,
  parameter TARGET_CLK_FREQUENCY = 1
) (input wire clk, input wire reset, output wire target_clk);
   
   generate if (NATIVE_CLK_FREQUENCY % TARGET_CLK_FREQUENCY != 0)
     $error("%m ** Illegal Parameter ** TARGET_CLK_FREQUENCY (%d) should be a multiple of TARGET_CLK_FREQUENC (%d)",
            NATIVE_CLK_FREQUENCY, TARGET_CLK_FREQUENCY);
   endgenerate
   parameter REDUCTION_RATE = NATIVE_CLK_FREQUENCY / TARGET_CLK_FREQUENCY;
   
   reg [$clog2(REDUCTION_RATE):0]counter = 0;
   always @(posedge clk or negedge reset)
       counter <= counter + 1;

   assign target_clk = counter == REDUCTION_RATE;

   always @(negedge clk) // NOTE: Question, is it ok to use negedge clk?
       if (target_clk)
           counter <= 0;
endmodule
