module sign_ext2(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 5 (solved):
*   Describe sign extension logic using ternary operator.
*/

   wire ext = imm[11] ? 1'b1 : 1'b0;

   assign ext_imm = {{20{ext}}, imm};

endmodule
