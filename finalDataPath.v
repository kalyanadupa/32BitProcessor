`timescale 1ns / 1ps

module finalDataPath(clk, regDst, branch, memRead, memToReg, memWrite, aluSrc, addrOp,
         writeDataOp, pcOp, aOp2, regWrite, zero, spWrite, spWrite2, wdOp2, aluOp, spOp, pc);
	input clk;
    output regDst, branch, memRead, memToReg, memWrite, aluSrc, addrOp,
         writeDataOp, pcOp, aOp2, regWrite, zero, spWrite, spWrite2, wdOp2;
    output[3:0] aluOp, spOp;
	wire[31:0] instruct, readData1, readData2, writeReg, secondInput, extendInstr, readData, tmpSP, writeRegData, finalPC;
	wire[31:0] nextPC, finalNextPC, branchPC, spOut, finalAddress1, finalAddress2, finalWriteData1, finalWriteData2;
	
    output[31:0] pc;
    reg[31:0] pc, sp;
    initial pc = 32'b0;
    initial sp = 32'b111111100;

    memory im(clk, pc, 32'b0, 1'b0, 1'b1, instruct);
	controlPath cp(clk, instruct, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc, addrOp, writeDataOp, pcOp, aOp2, spOp, regWrite, zero, spWrite, spWrite2, wdOp2);
    
	alu forSP(spOut, sp, 4, spOp);
	alu forNextPC(nextPC, pc, 4, 0);
	mux2to1_32 forFinalSp1(finalSp1, nextPC, spOut, spWrite);
	mux2to1_32 forFinalSp2(tmpSP, sp, finalSp1, spWrite2);

	mux2to1_32 forWriteReg(writeReg, instruct[21:17], instruct[16:12], regDst);
	registerBank rb(readData1, readData2, clk, 1'b0, instruct[26:22], instruct[21:17], writeReg, writeData);
	
	signExtend se(clk, instruct[15:0], extendInstr);
	mux2to1_32 forSecondInput(secondInput, readData2, extendInstr, aluSrc);
	alu mainalu(aluResult, readData1, secondInput, aluOp);
	
	mux2to1_32 forfinalAddress1(finalAddress1, spOut, pc, aOp2);
	mux2to1_32 forfinalAddress2(finalAddress2, aluResult, finalAddress1, addrOp);
	mux2to1_32 forfinalWriteData1(finalWriteData1, nextPC, sp, wdOp2);
	mux2to1_32 forfinalWriteData2(finalWriteData2, readData2, finalWriteData1, writeDataOp);
	memory dm(clk, finalAddress, finalWriteData2, memWrite, memRead, readData);
	
    wire[31:0] t0, t1, t2, t3;
	mux2to1_32 forWriteData(writeRegData, aluResult, readData, memToReg);
    registerBank rb2(t2, t3, clk, 1'b1, 5'b0, 5'b0, 5'b0, writeRegData);

	sla s0(t0, extendInstr, 32'b0);
	sla s1(t1, t0, 32'b0);
	alu calcPC(aluRes2, nextPC, t1, 0);
	
	mux2to1_32 calcbranchPC(finalNextPC, nextPC, aluRes2, zero);
	mux2to1_32 forfinalPC(finalPC, finalNextPC, regWrite, pcOp);
	
	always@ (posedge clk)
    begin
		pc <= finalPC;
        sp <= tmpSP;
    end
endmodule
