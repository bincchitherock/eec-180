`timescale 1ns / 1ps

module eightbit_fuladder_tb;
    wire [7:0] sum;
    wire       cout, overflow;
    reg  [16:0] test;
    reg  [8:0] expected;

    // design under test
    eightbit_fuladder DUT (
        .a(test[7:0]),
        .b(test[15:8]),
        .cin(1'b0),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );

    // stimulus and basic verification
    initial begin
        for (test = 0; test < 65536; test = test + 1) begin
            #10;
            expected = test[7:0] + test[15:8];

            if ({cout, sum} != expected)
                $display("ERROR add: a=%h b=%h sum=%h cout=%b", test[7:0], test[15:8], sum, cout);

            if (overflow != ((~(test[7] ^ test[15])) & (sum[7] ^ test[7])))
                $display("ERROR ovf: a=%h b=%h sum=%h ovf=%b", test[7:0], test[15:8], sum, overflow);
        end
        #10 $finish;
    end
endmodule
