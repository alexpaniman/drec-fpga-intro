module reg_file(
    input clk,

    input [4:0] read_addr0,
    input [31:0]     data0,

    input [4:0] read_addr1,
    input [31:0]     data1,

    input write_enable,
    input [4:0] write_addr,
    input [4:0] write_data,
);

    reg [31:0] registers[30:0];
    for (integer i = 1; i < 32; ++ i) initial registers[i - 1] = 0;

    wire [31:0] regs[31:0];
    assign regs[0] = 0;
    for (integer i = 1; i <= 32; ++ i)
        assign regs[i] = registers[i - 1];

    assign data0 = regs[read_addr0];
    assign data1 = regs[read_addr1];
    
    always @(posedge clk)
        if (write_enable && write_addr) begin
            registers[write_addr - 1] <= write_data;
            $strobe("x0:  %h x1:  %h x2:  %h x3:  %h \n", regs[0],  regs[1],  regs[2],  regs[3]);
            $strobe("x4:  %h x5:  %h x6:  %h x7:  %h \n", regs[4],  regs[5],  regs[6],  regs[7]);
            $strobe("x8:  %h x9:  %h x10: %h x11: %h \n", regs[8],  regs[9],  regs[10], regs[11]);
            $strobe("x12: %h x13: %h x14: %h x15: %h \n", regs[12], regs[13], regs[14], regs[15]);
            $strobe("x16: %h x17: %h x18: %h x19: %h \n", regs[16], regs[17], regs[18], regs[19]);
            $strobe("x20: %h x21: %h x22: %h x23: %h \n", regs[20], regs[21], regs[22], regs[23]);
            $strobe("x24: %h x25: %h x26: %h x27: %h \n", regs[24], regs[25], regs[26], regs[27]);
            $strobe("x28: %h x29: %h x30: %h x31: %h \n", regs[28], regs[29], regs[30], regs[31]);
        end
endmodule   
