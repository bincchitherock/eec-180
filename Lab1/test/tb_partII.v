module tb_partII;

    reg [3:0] count;        // 4-bit counter to drive SW[3:0]

    wire [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire [1:0] KEY;
    wire [9:0] LEDR;
    wire [9:0] SW;

    assign SW[3:0] = count; // connect counter to switch inputs

    // instantiate the design under test
    partII UUT (.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2),
                .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5),
                .KEY(KEY), .LEDR(LEDR), .SW(SW));

    initial begin
        count = 4'b0000;
        repeat (16) begin   // 16 combos for 4 inputs
            #100
            $display("SW[3:0] = %b (%2d) | HEX1 = %b  HEX0 = %b",
                      count, count, HEX1, HEX0);
            count = count + 4'b0001;
        end
    end
endmodule