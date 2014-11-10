`timescale 1ns / 1ps

module fulladder(sum, cout, a, b, cin);
    output sum, cout;
    input a, b, cin;
    wire sum, cout;
    wire tt1, tt2, tt3;

    xor x1 (sum, a, b, cin);

    and a1 (tt1, a, b);
    and a2 (tt2, b, cin);
    and a3 (tt3, a, cin);

    or (cout, tt1, tt2, tt3);
endmodule

