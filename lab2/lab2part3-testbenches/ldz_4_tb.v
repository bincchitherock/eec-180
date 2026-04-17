`timescale 1ns / 1ps
module ldz_4_tb;
    reg  [3:0] SW;
    wire [2:0] LEDR;
    integer expected;
    integer i;

    ldz_4 DUT (.SW(SW), .LEDR(LEDR));

    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            SW = i;
            #10;
            if      (SW[3]) expected = 0;
            else if (SW[2]) expected = 1;
            else if (SW[1]) expected = 2;
            else if (SW[0]) expected = 3;
            else            expected = 4;
            if (LEDR != expected)
                $display("ERROR: SW=%b LEDR=%b expected=%0d", SW, LEDR, expected);
        end
        #10 $finish;
    end
endmodule