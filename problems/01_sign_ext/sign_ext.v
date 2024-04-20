module sign_ext(
    input [11:0]imm,

    output [31:0]ext_imm
);

/*
*   Problem 4:
*   Describe sign extension logic.
*/
   assign ext_imm = {{20{imm[0]}}, imm};

endmodule
