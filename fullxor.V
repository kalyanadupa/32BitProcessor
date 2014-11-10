`timescale 1ns / 1ps

module fullxor(out, a, b);
    output[31:0] out;
    input[31:0] a, b;

    xor n0(out[0], a[0], b[0]);
    xor n1(out[1], a[1], b[1]);
    xor n2(out[2], a[2], b[2]);
    xor n3(out[3], a[3], b[3]);
    xor n4(out[4], a[4], b[4]);
    xor n5(out[5], a[5], b[5]);
    xor n6(out[6], a[6], b[6]);
    xor n7(out[7], a[7], b[7]);
    xor n8(out[8], a[8], b[8]);
    xor n9(out[9], a[9], b[9]);
    xor n10(out[10], a[10], b[10]);
    xor n11(out[11], a[11], b[11]);
    xor n12(out[12], a[12], b[12]);
    xor n13(out[13], a[13], b[13]);
    xor n14(out[14], a[14], b[14]);
    xor n15(out[15], a[15], b[15]);
    xor n16(out[16], a[16], b[16]);
    xor n17(out[17], a[17], b[17]);
    xor n18(out[18], a[18], b[18]);
    xor n19(out[19], a[19], b[19]);
    xor n20(out[20], a[20], b[20]);
    xor n21(out[21], a[21], b[21]);
    xor n22(out[22], a[22], b[22]);
    xor n23(out[23], a[23], b[23]);
    xor n24(out[24], a[24], b[24]);
    xor n25(out[25], a[25], b[25]);
    xor n26(out[26], a[26], b[26]);
    xor n27(out[27], a[27], b[27]);
    xor n28(out[28], a[28], b[28]);
    xor n29(out[29], a[29], b[29]);
    xor n30(out[30], a[30], b[30]);
    xor n31(out[31], a[31], b[31]);
endmodule

