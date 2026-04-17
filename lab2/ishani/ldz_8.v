module ldz_8 (
    input  wire [7:0] SW,
    output wire [3:0] LEDR
);
    wire [2:0] lz_upper;
    wire [2:0] lz_lower;
    wire       upper_is_zero;

    ldz_4 upper_lzd (
        .SW(SW[7:4]),
        .LEDR(lz_upper)
    );

    ldz_4 lower_lzd (
        .SW(SW[3:0]),
        .LEDR(lz_lower)
    );
    assign upper_is_zero = lz_upper[2];

    //conditional statement
    assign LEDR = upper_is_zero ? ({1'b0, lz_lower} + 4'd4) : {1'b0, lz_upper};
endmodule
