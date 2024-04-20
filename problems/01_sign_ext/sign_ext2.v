module sign_ext2(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 5:
*   Describe sign extension logic using ternary operator.
*/

   wire ext;
   assign ext = imm[0] ? 0 : 1;

   assign ext_imm = {{20{ext}}, imm};

endmodule
