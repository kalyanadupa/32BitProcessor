`timescale 1ns / 1ps

module rippleadder(sum, cout, a, b, cin);
    output [31:0] sum;
    output cout;

    input [31:0] a, b;
    input cin;

    wire [32:0] c;
    assign c[0] = cin;

    fulladder fa0(sum[0], c[1] , a[0], b[0], c[0]);
    fulladder fa1(sum[1], c[2], a[1], b[1], c[1]);
    fulladder fa2(sum[2], c[3], a[2], b[2], c[2]);
    fulladder fa3(sum[3], c[4], a[3], b[3], c[3]);
    fulladder fa4(sum[4], c[5], a[4], b[4], c[4]);
    fulladder fa5(sum[5], c[6], a[5], b[5], c[5]);
    fulladder fa6(sum[6], c[7], a[6], b[6], c[6]);
    fulladder fa7(sum[7], c[8], a[7], b[7], c[7]);
    fulladder fa8(sum[8], c[9], a[8], b[8], c[8]);
    fulladder fa9(sum[9], c[10], a[9], b[9], c[9]);
    fulladder fa10(sum[10], c[11], a[10], b[10], c[10]);
    fulladder fa11(sum[11], c[12], a[11], b[11], c[11]);
    fulladder fa12(sum[12], c[13], a[12], b[12], c[12]);
    fulladder fa13(sum[13], c[14], a[13], b[13], c[13]);
    fulladder fa14(sum[14], c[15], a[14], b[14], c[14]);
    fulladder fa15(sum[15], c[16], a[15], b[15], c[15]);
    fulladder fa16(sum[16], c[17], a[16], b[16], c[16]);
    fulladder fa17(sum[17], c[18], a[17], b[17], c[17]);
    fulladder fa18(sum[18], c[19], a[18], b[18], c[18]);
    fulladder fa19(sum[19], c[20], a[19], b[19], c[19]);
    fulladder fa20(sum[20], c[21], a[20], b[20], c[20]);
    fulladder fa21(sum[21], c[22], a[21], b[21], c[21]);
    fulladder fa22(sum[22], c[23], a[22], b[22], c[22]);
    fulladder fa23(sum[23], c[24], a[23], b[23], c[23]);
    fulladder fa24(sum[24], c[25], a[24], b[24], c[24]);
    fulladder fa25(sum[25], c[26], a[25], b[25], c[25]);
    fulladder fa26(sum[26], c[27], a[26], b[26], c[26]);
    fulladder fa27(sum[27], c[28], a[27], b[27], c[27]);
    fulladder fa28(sum[28], c[29], a[28], b[28], c[28]);
    fulladder fa29(sum[29], c[30], a[29], b[29], c[29]);
    fulladder fa30(sum[30], c[31], a[30], b[30], c[30]);
    fulladder fa31(sum[31], c[32], a[31], b[31], c[31]);

    assign cout = c[31];
endmodule

