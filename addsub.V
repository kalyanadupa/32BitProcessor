`timescale 1ns / 1ps

module addsub(sum, cout, a, b, cin);
    output[31:0] sum;
    output cout;
    input[31:0] a, b;
    input cin;
    wire[31:0] notb, finalb;

    fullnot f1(notb, b);
    mux2to1_32 mux1(finalb, notb, b, cin);

    rippleadder rp1(sum, cout, a, finalb, cin);
endmodule





