`timescale 1ns / 1ps

module finalDataPath(clk, regDst, aluSrc, memRead, memWrite, jump, bAndZ, aluOp, addrOp, writeDataOp, pcOp, aOp2);
	input clk, regDst, aluSrc, memRead, memWrite, jump, bAndZ, addrOp, writeDataOp, pcOp, aOp2;
	reg[31:0] pc, sp;
	input[3:0] aluOp;
	wire[31:0] instruct, readData1, readData2, writeReg, secondInput, extendInstr, readData;
	wire[31:0] nextPC, finalNextPC, branchPC, jumpAddr, spOut, finalAddress1, finalAddress2, finalWriteData;
	
	alu forSP(spOut, sp, 4, 0);
	alu forNextPC(nextPC, pc, 4, 0);
	// todo cycling sp and todo LDSP STSP
	
	instructMem im(clk, pc, instrct);
	
	mux2to1_32 forWriteReg(writeReg, instruct[21:17], instruct[16:12], regDst);
	registerBank rb(readData1, readData2, clk, regWrite, instruct[26:22], instruct[21:17], writeReg, writeData);
	
	signExtend se(clk, instruct[15:0], extendInstr);
	mux2to1_32 forSecondInput(secondInput, readData2, extendInstr, aluSrc);
	alu mainalu(aluResult, readData1, secondInput, aluOp);
	
	mux2to1_32 forfinalAddress1(finalAddress1, spOut, pc, aOp2);
	mux2to1_32 forfinalAddress2(finalAddress2, aluResult, finalAddress1, addrOp);
	mux2to1_32 forfinalWriteData(finalWriteData, writeData, nextPC, writeDataOp);
	memory dm(clk, finalAddress, finalWriteData, memWrite, memRead, readData);
	
	mux2to1_32 forWriteData(regWrite, aluResult, readData, memToReg);
	calcJump jumpCalc(clk, instruct[26:0], pc[31:26], jumpAddr);
	
	wire[31:0] t0, t1;
	sla s0(t0, extendInstr, 32'b0);
	sla s1(t1, t0, 32'b0);
	alu calcPC(aluRes2, nextPC, t1, 0);
	
	mux2to1_32 calcbranchPC(branchPC, nextPC, aluRes2, bAndZ);
	mux2to1_32 jumpOrNot(finalNextPC, branchPC, jumpAddr, jump);
	mux2to1_32 forfinalPC(finalPC, finalNextPC, regWrite, pcOp);
	
	always@ (posedge clk)
	begin
		pc = finalNextPC;
	end
	//assign pc = finalNextPC;
endmodule