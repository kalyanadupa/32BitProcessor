`timescale 1ns / 1ps

module instructMem(clk, readAddr, instruct);
    input clk;
    input[31:0] readAddr;
    output[31:0] instruct;
    reg[31:0] mem[255:0];
    reg[31:0] t0;
    
    always@ (posedge clk) 
    begin
        t0 = mem[readAddr[7:0]];
    end
    
    assign instruct = t0;
endmodule
