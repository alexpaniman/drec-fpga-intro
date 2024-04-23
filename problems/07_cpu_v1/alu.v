module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,

    output reg [31:0]res
);
   /*
    * Problem 1:
    * Write operations execution logic here.
    */
   always @(*) begin
      case (res)
        3'b000: res <= src_a;
        3'b001: res <= src_a + src_b;
      endcase; 
   end
endmodule
