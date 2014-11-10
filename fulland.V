`timescale 1ns / 1ps

module fulland(out, a, b);
    output[31:0] out;
    input[31:0] a, b;

    and n0(out[0], a[0], b[0]);
    and n1(out[1], a[1], b[1]);
    and n2(out[2], a[2], b[2]);
    and n3(out[3], a[3], b[3]);
    and n4(out[4], a[4], b[4]);
    and n5(out[5], a[5], b[5]);
    and n6(out[6], a[6], b[6]);
    and n7(out[7], a[7], b[7]);
    and n8(out[8], a[8], b[8]);
    and n9(out[9], a[9], b[9]);
    and n10(out[10], a[10], b[10]);
    and n11(out[11], a[11], b[11]);
    and n12(out[12], a[12], b[12]);
    and n13(out[13], a[13], b[13]);
    and n14(out[14], a[14], b[14]);
    and n15(out[15], a[15], b[15]);
    and n16(out[16], a[16], b[16]);
    and n17(out[17], a[17], b[17]);
    and n18(out[18], a[18], b[18]);
    and n19(out[19], a[19], b[19]);
    and n20(out[20], a[20], b[20]);
    and n21(out[21], a[21], b[21]);
    and n22(out[22], a[22], b[22]);
    and n23(out[23], a[23], b[23]);
    and n24(out[24], a[24], b[24]);
    and n25(out[25], a[25], b[25]);
    and n26(out[26], a[26], b[26]);
    and n27(out[27], a[27], b[27]);
    and n28(out[28], a[28], b[28]);
    and n29(out[29], a[29], b[29]);
    and n30(out[30], a[30], b[30]);
    and n31(out[31], a[31], b[31]);
endmodule

