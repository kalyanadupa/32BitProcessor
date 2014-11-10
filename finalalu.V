`timescale 1ns / 1ps

module alu(out, a, b, op);
    output reg [31:0] out;
    input[31:0] a, b;
    input[3:0] op;
    wire[31:0] t0, t2, t3, t4, t5, t6, t7;
    wire t;

    addsub s0(t0, t, a, b, op[0]);
    fulland s2(t2, a, b);
    fullor s3(t3, a, b);
    fullxor s4(t4, a, b);
    fullnot s5(t5, a);
    sla s6(t6, a, b);
    sra s7(t7, a, b);

    always@ (a, b, op)
    begin
        if (op == 0)
        begin
            out = t0;
        end

        if (op == 1)
        begin
            out = t0;
        end

        if (op == 2)
        begin
            out = t2;
        end

        if (op == 3)
        begin
            out = t3;
        end

        if (op == 4)
        begin
            out = t4;
        end

        if (op == 5)
        begin
            out = t5;
        end

        if (op == 6)
        begin
            out = t6;
        end

        if (op == 7)
        begin
            out = t7;
        end
    end
endmodule

