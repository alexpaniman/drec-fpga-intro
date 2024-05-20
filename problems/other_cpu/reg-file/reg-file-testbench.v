`timescale 1 ns / 100 ps

module testbench();
    reg clk = 0; always #1 clk = ~clk;

    reg [0:4] read_addr0 = 0;
    reg [0:4] read_addr1 = 1;
    reg_file reg_file(.clk(clk), .read_addr0(read_addr0), .read_addr1(read_addr1))
    
endmodule
