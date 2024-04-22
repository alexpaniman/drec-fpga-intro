module sign_ext(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 4 (solved):
*   Describe sign extension logic.
*/
   assign ext_imm = {{20{imm[11]}}, imm};

endmodule
