`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:39 11/10/2014 
// Design Name: 
// Module Name:    processor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module processor(clk);
	wire[31:0] instruction, forBranch;
	input clk;
	wire regDst, aluSrc, memRead, memWrite, jump, bAndZ,  addrOp, writeDataOp, wdOp2, pcOp, aOp2, spWrite, spWrite2;	
	wire[31:0] aluOp, spOp;
   wire branch, memToReg,  regWrite, zero,wdOp2;
	
	controlPath f1(clk, instruction, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc,addrOp, writeDataOp, pcOp, aOp2, spOp, regWrite, zero, forBranch, spWrite, spWrite2, wdOp2)
	finalDataPath f0(clk, regDst, aluSrc, memRead, memWrite, jump, bAndZ, aluOp, spOp, addrOp, writeDataOp, wdOp2, pcOp, aOp2, spWrite, spWrite2);

endmodule
