module genericadder #(parameter K = 8) (
    input  wire [K-1:0] a,
    input  wire [K-1:0] b,
    input  wire         cin,
    output wire [K-1:0] sum,
    output wire         cout,
    output wire         overflow
);
    wire [K:0] c;
    genvar i;

    assign c[0] = cin;

    generate
        for (i = 0; i < K; i = i + 1) begin 
            fulladder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[K];
    assign overflow = c[K-1] ^ c[K];

endmodule
