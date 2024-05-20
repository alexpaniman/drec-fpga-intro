`include "alu-commands.v"

module alu(input [31:0] a, input [31:0] b, input [3:0] operation, output reg [31:0] res);
    wire [31:0] sub = a - b;
    
    always @(*) begin
        case (operation)
            `ALU_NONE : res = a;
            `ALU_ADD  : res = a + b;
            `ALU_SUB  : res = a - b;
            `ALU_XOR  : res = a ^ b;
            `ALU_OR   : res = a | b;
            `ALU_AND  : res = a & b; 
            `ALU_SLL  : res = a << b;
            `ALU_SRL  : res = a >> b;
            `ALU_SRA  : res = { a[31], (a[31:1] >> b) };
            `ALU_SLT  : res = (a[31] != b[31]) ? a[31] : sub[31];
            `ALU_SLTU : res = a < b;
            default   : res = 0;
        endcase
    end
endmodule
