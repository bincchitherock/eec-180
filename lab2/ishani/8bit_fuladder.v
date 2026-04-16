// 8-bit ripple-carry adder built from fulladder submodules.
// overflow: signed (two's complement) overflow — 1 if the true sum is not
// representable in 8 bits (same as carry_into_MSB XOR carry_out_of_MSB).

module eightbit_fuladder (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire       cin,
    output wire [7:0] sum,
    output wire       cout,
    output wire       overflow
);
    wire [8:0] c;
    genvar i;

    assign c[0] = cin;

    generate
        for (i = 0; i < 8; i = i + 1) begin 
            fulladder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout     = c[8];
    assign overflow = c[7] ^ c[8];

endmodule
