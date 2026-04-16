`timescale 1ns / 1ps

module genericadder_tb;
    parameter K = 8;
    localparam integer NUM_CASES = (1 << (2*K));

    wire [K-1:0] sum;
    wire         cout, overflow;
    reg  [2*K:0] test;
    reg  [K:0]   expected;

    // design under test
    genericadder #(K) DUT (
        .a(test[K-1:0]),
        .b(test[(2*K)-1:K]),
        .cin(1'b0),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );

    // stimulus and basic verification
    initial begin
        for (test = 0; test < NUM_CASES; test = test + 1) begin
            #10;
            expected = test[K-1:0] + test[(2*K)-1:K];

            if ({cout, sum} != expected)
                $display("ERROR add: a=%h b=%h sum=%h cout=%b", test[K-1:0], test[(2*K)-1:K], sum, cout);

            if (overflow != ((~(test[K-1] ^ test[(2*K)-1])) & (sum[K-1] ^ test[K-1])))
                $display("ERROR ovf: a=%h b=%h sum=%h ovf=%b", test[K-1:0], test[(2*K)-1:K], sum, overflow);
        end
        #10 $finish;
    end
endmodule
