`timescale 1ns / 1ps

module registerBank(regA, regB, clk, regWrite, regS, regT, regD, writeData);
    input clk;
    input regWrite;
    input [4:0] regS, regT;
    input [4:0] regD;
    input [31:0] writeData;
    output reg [31:0] regA;
    output reg [31:0] regB;
	
	reg [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, SP, PC;

	always@ (posedge clk)
	begin
		R0 <= 32'b0;
		R1 <= 5;
		R2 <= 6;
		// assign regA
		case(regS)
			 0: regA = R0;
			 1: regA = R1;
			 2: regA = R2;
			 3: regA = R3;
			 4: regA = R4;
			 5: regA = R5;
			 6: regA = R6;
			 7: regA = R7;
			 8: regA = R8;
			 9: regA = R9;
			10: regA = R10;
			11: regA = R11;
			12: regA = R12;
			13: regA = R13;
			14: regA = R14;
			15: regA = R15;
		endcase

		// assign regB
		case(regT)
			 0: regB = R0;
			 1: regB = R1;
			 2: regB = R2;
			 3: regB = R3;
			 4: regB = R4;
			 5: regB = R5;
			 6: regB = R6;
			 7: regB = R7;
			 8: regB = R8;
			 9: regB = R9;
			10: regB = R10;
			11: regB = R11;
			12: regB = R12;
			13: regB = R13;
			14: regB = R14;
			15: regB = R15;
		endcase
		
		if(regWrite)
		begin
			case(regD)
				 1:  R1 = writeData;
				 2:  R2 = writeData;
				 3:  R3 = writeData;
				 4:  R4 = writeData;
				 5:  R5 = writeData;
				 6:  R6 = writeData;
				 7:  R7 = writeData;
				 8:  R8 = writeData;
				 9:  R9 = writeData;
				10: R10 = writeData;
				11: R11 = writeData;
				12: R12 = writeData;
				13: R13 = writeData;
				14: R14 = writeData;
				15: R15 = writeData;
			endcase
		end
	end
endmodule
