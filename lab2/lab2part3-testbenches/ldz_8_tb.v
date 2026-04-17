`timescale 1ns / 1ps
module ldz_8_tb;
    reg  [7:0] SW;
    wire [3:0] LEDR;
    integer expected;
    integer i;

    ldz_8 DUT (.SW(SW), .LEDR(LEDR));

    initial begin
        for (i = 0; i < 1000; i = i + 1) begin
            SW = $random % 256;
            #10;
            // count leading zeros manually
            if      (SW[7]) expected = 0;
            else if (SW[6]) expected = 1;
            else if (SW[5]) expected = 2;
            else if (SW[4]) expected = 3;
            else if (SW[3]) expected = 4;
            else if (SW[2]) expected = 5;
            else if (SW[1]) expected = 6;
            else if (SW[0]) expected = 7;
            else            expected = 8;
            if (LEDR != expected)
                $display("ERROR: SW=%b LEDR=%b expected=%0d", SW, LEDR, expected);
        end
        #10 $finish;
    end
endmodule