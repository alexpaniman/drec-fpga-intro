module uart_transmitter
#(
  parameter NATIVE_CLK_FREQUENCY = 1000000000,
  parameter BAUDRATE = 9600,
  parameter FRAME_DATA_LENGTH = 8,
  // parameter START_SEQUENCE_LENGTH = 2
  // parameter ENABLE_PARITY_BIT = 0
  parameter ENABLE_BIG_ENDIAN = 1
) (input wire clk, input wire data, output wire tx);

   clock_divider #(
       .NATIVE_CLK_FREQUENCY(NATIVE_CLK_FREQUENCY),
       .TARGET_CLK_FREQUENCY(BAUDRATE)
   ) clk_div(.clk(clk), .target_clk());

   // reg state = INITIAL;
 
   
endmodule
