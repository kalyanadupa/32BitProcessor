`timescale 1ns / 1ps

module mux2to1(out, a, b, sel);
    output out;
    input a, b, sel;
    wire out1, out2, notb;

    and a1 (out1, a, sel);
    not i1 (notb, sel);
    and a2 (out2, b, notb);
    or o1 (out, out1, out2);
endmodule

