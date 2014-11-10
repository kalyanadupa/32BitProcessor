`timescale 1ns / 1ps

module sla(out, in, b);
    output[31:0] out;
    input[31:0] in, b;

    mux2to1 m0(out[0], 1'b0, in[0], b[0]);
    mux2to1 m1(out[1], in[0], in[1], b[0]);
    mux2to1 m2(out[2], in[1], in[2], b[0]);
    mux2to1 m3(out[3], in[2], in[3], b[0]);
    mux2to1 m4(out[4], in[3], in[4], b[0]);
    mux2to1 m5(out[5], in[4], in[5], b[0]);
    mux2to1 m6(out[6], in[5], in[6], b[0]);
    mux2to1 m7(out[7], in[6], in[7], b[0]);
    mux2to1 m8(out[8], in[7], in[8], b[0]);
    mux2to1 m9(out[9], in[8], in[9], b[0]);
    mux2to1 m10(out[10], in[9], in[10], b[0]);
    mux2to1 m11(out[11], in[10], in[11], b[0]);
    mux2to1 m12(out[12], in[11], in[12], b[0]);
    mux2to1 m13(out[13], in[12], in[13], b[0]);
    mux2to1 m14(out[14], in[13], in[14], b[0]);
    mux2to1 m15(out[15], in[14], in[15], b[0]);
    mux2to1 m16(out[16], in[15], in[16], b[0]);
    mux2to1 m17(out[17], in[16], in[17], b[0]);
    mux2to1 m18(out[18], in[17], in[18], b[0]);
    mux2to1 m19(out[19], in[18], in[19], b[0]);
    mux2to1 m20(out[20], in[19], in[20], b[0]);
    mux2to1 m21(out[21], in[20], in[21], b[0]);
    mux2to1 m22(out[22], in[21], in[22], b[0]);
    mux2to1 m23(out[23], in[22], in[23], b[0]);
    mux2to1 m24(out[24], in[23], in[24], b[0]);
    mux2to1 m25(out[25], in[24], in[25], b[0]);
    mux2to1 m26(out[26], in[25], in[26], b[0]);
    mux2to1 m27(out[27], in[26], in[27], b[0]);
    mux2to1 m28(out[28], in[27], in[28], b[0]);
    mux2to1 m29(out[29], in[28], in[29], b[0]);
    mux2to1 m30(out[30], in[29], in[30], b[0]);
    mux2to1 m31(out[31], in[30], in[31], b[0]);
endmodule

