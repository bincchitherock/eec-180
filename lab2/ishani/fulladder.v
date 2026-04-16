module fulladder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output reg  sum,
    output reg  cout
);
    always @(a, b, cin) 
    begin
        {cout, sum} = a + b + cin;
    end
endmodule
