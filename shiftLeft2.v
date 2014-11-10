`timescale 1ns / 1ps

module calcJump(clk, instruction, pc, jumpAddr);
    input clk;
    input[26:0] instruction;
    input[3:0] pc;
    output[31:0] jumpAddr;

    reg[31:0] t0, t3;
    wire[31:0] t1, t2;
    wire[26:0] instruction;
    always @( posedge clk )
    begin
        t0[31:0] <= {{5{instruction[26]}}, instruction[26:0]};
    end
    
    sla s0(t1, t0, 32'b0);
    sla s1(t2, t1, 32'b0);

    always @( posedge clk )
    begin
        t3[31:0] <= {pc[3:0], t2[27:0]};
    end
    
    assign jumpAddr = t3;
endmodule
