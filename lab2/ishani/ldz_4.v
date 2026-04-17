module ldz_4 (
    input  wire [3:0] SW,
    output wire [2:0] LEDR
);
    assign LEDR[2] = ~SW[3] & ~SW[2] & ~SW[1] & ~SW[0];
    assign LEDR[1] = ~SW[3] & ~SW[2] & (SW[0] | SW[1]);
    assign LEDR[0] = (~SW[3] & SW[2]) | (~SW[3] & ~SW[2] & ~SW[1] & SW[0]);
endmodule
