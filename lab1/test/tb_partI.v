module tb_partI;

    reg [1:0] count;        // 2-bit counter to drive SW[1:0]

    wire [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire [1:0] KEY;
    wire [9:0] LEDR;
    wire [9:0] SW;

    assign SW[1:0] = count; // connect counter to switch inputs
    // e.g. when count = 00, both switches are down. 

    // instantiate the design under test
    partI UUT (.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2),
               .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5),
               .KEY(KEY), .LEDR(LEDR), .SW(SW));

    initial begin
        count = 2'b00;
        repeat (4) begin    // 4 combos for 2 inputs
            #100
            $display("SW[1:0] = %b | AND=%b  OR=%b  XOR=%b  NAND=%b",
                      count, LEDR[0], LEDR[1], LEDR[2], LEDR[3]);
            count = count + 2'b01;
        end
        $stop;
    end
endmodule