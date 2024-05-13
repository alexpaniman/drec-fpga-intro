module uart_transmitter
#(
  parameter NATIVE_CLK_FREQUENCY = 1000000000,
  parameter BAUDRATE = 9600,
  parameter FRAME_DATA_LENGTH = 8,
  // parameter START_SEQUENCE_LENGTH = 2
  // parameter ENABLE_PARITY_BIT = 0
  parameter ENABLE_BIG_ENDIAN = 1
) (input clk, input sending, input [0:FRAME_DATA_LENGTH - 1]data, output busy, output reg tx = 1);

    reg reset = 0;
    clock_divider #(
        .NATIVE_CLK_FREQUENCY(NATIVE_CLK_FREQUENCY),
        .TARGET_CLK_FREQUENCY(BAUDRATE)
    ) clk_div(.clk(clk), .reset(reset), .target_clk(target_clk));

    reg [0:4]transmitted_bit = 0;
    assign busy = transmitted_bit != 0;
    assign got_new_data = sending && !busy;

    reg [0:FRAME_DATA_LENGTH + 1]saved_data = { 1'b0, {FRAME_DATA_LENGTH{1'b0}}, 1'b1 };
    always @(posedge clk) begin
        if (got_new_data) begin
            saved_data[1:FRAME_DATA_LENGTH] <= data;
            transmitted_bit <= 1;

            tx <= 1; // Send transmission start signal
        end

        reset <= got_new_data;
    end

    always @(negedge target_clk)
        if (busy) begin
            tx <= saved_data[transmitted_bit];
            transmitted_bit <= (transmitted_bit == FRAME_DATA_LENGTH + 1) ? 0 : transmitted_bit + 1;
        end else
            tx <= 1'b1;
endmodule
