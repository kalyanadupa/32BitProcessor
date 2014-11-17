`timescale 1ns / 1ps

module test;

	// Inputs
	reg clk;

	// Outputs
	wire regDst;
	wire branch;
	wire memRead;
	wire memToReg;
	wire memWrite;
	wire aluSrc;
	wire addrOp;
	wire writeDataOp;
	wire pcOp;
	wire aOp2;
	wire regWrite;
	wire zero;
	wire spWrite;
	wire spWrite2;
	wire wdOp2;
	wire [3:0] aluOp;
	wire [3:0] spOp;
    wire [31:0] pc; 

	// Instantiate the Unit Under Test (UUT)
	finalDataPath uut (
		.clk(clk), 
		.regDst(regDst), 
		.branch(branch), 
		.memRead(memRead), 
		.memToReg(memToReg), 
		.memWrite(memWrite), 
		.aluSrc(aluSrc), 
		.addrOp(addrOp), 
		.writeDataOp(writeDataOp), 
		.pcOp(pcOp), 
		.aOp2(aOp2), 
		.regWrite(regWrite), 
		.zero(zero), 
		.spWrite(spWrite), 
		.spWrite2(spWrite2), 
		.wdOp2(wdOp2), 
		.aluOp(aluOp), 
		.spOp(spOp),
        .pc(pc)
	);

	initial clk = 0;
    always #10 clk = ~clk;
	initial begin
	end
endmodule

