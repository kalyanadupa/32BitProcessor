`timescale 1ns / 1ps

module testRegBank;

	// Inputs
	reg clk;
	reg regWrite;
	reg [4:0] regS;
	reg [4:0] regT;
	reg [4:0] regD;
	reg [31:0] writeData;

	// Outputs
	wire [31:0] regA;
	wire [31:0] regB;

	// Instantiate the Unit Under Test (UUT)
	registerBank uut (
		.regA(regA), 
		.regB(regB), 
		.clk(clk), 
		.regWrite(regWrite), 
		.regS(regS), 
		.regT(regT), 
		.regD(regD), 
		.writeData(writeData)
	);

	initial begin
		
		clk = 0; #100;
		regWrite = 0; regS = 1; regT = 2; regD = 3; writeData = 1;
		clk = 1; #100; clk = 0; #100; clk = 1; #100;
 
		$display("regWrite = %d\tregS = %d\tregT = %d\tregD = %d\twriteData = %d\tregA = %d\tregB = %d", regWrite, regS, regT, regD, writeData, regA, regB);

		/*clk = 0; #100;
		clk = 1; #100;
		regWrite = 0; regS = 0; regT = 0; regD = 0; writeData = 0;
		
		clk = 0; #100;
		clk = 1; #100;
		regWrite = 0; regS = 0; regT = 0; regD = 0; writeData = 0;*/
	end
      
endmodule

