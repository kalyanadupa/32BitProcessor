`timescale 1ns / 1ps

/*
regDst = ;
branch = ;
memRead = ;
memToReg = ;
aluOp = ;
memWrite = ;
aluSrc = ;
addrOp = ;
writeDataOp = ;
pcOp = ;
aOp2 = ;
spOp = ;
regWrite = ;
*/

module controlPath(clk, instruct, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc, addrOp, writeDataOp, pcOp, aOp2, spOp, regWrite, zero, forBranch);
    input clk;
    input[31:0] instruct, forBranch;
    output regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite, zero;
    output[3:0] aluOp;
    
    always@(posedge clk)
    begin
    case(instruct[31:30])
        0:  begin
            case(instruct[29:26])
                0:  begin
                        regDst = 1;
                        branch = 0;
                        memRead = 0;
                        memToReg = 0;
                        memWrite = 0;
                        aluSrc = 0;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        regWrite = 1;
                        aluOp = instruct[11:8];
                    end
                1:  begin
                        branch = 0;
                        memRead = 0;
                        aluOp = 4b'0000;
                        memWrite = 1;
                        aluSrc = 1;
                        addrOp = 1;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        spOp = 4b'0000;
                        regWrite = 0;
                    end
                2:  begin
                        regDst = 0;
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        aluOp = 4b'0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 1;
                        pcOp = 1;
                        aOp2 = 1;
                        spOp = 4b'0001;
                        regWrite = 1;
                    end
                3:  begin
                        regDst = 0;
                        branch = 0;
                        memToReg = 0;
                        aluOp = 4b'0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        regWrite = 1;
                    end
            endcase
            end
        1:  begin
                regDst = 0;
                branch = 0;
                memRead = 0;
                memToReg = 0;
                memWrite = 0;
                aluSrc = 1;
                addrOp = 0;
                writeDataOp = 0;
                pcOp = 0;
                aOp2 = 1;
                regWrite = 1;
                aluOp = instruct[11:8];
            end
        2:  begin
                branch = 1;
                memRead = 0;
                memWrite = 0;
                aluSrc = 0;
                addrOp = 0;
                writeDataOp = 0;
                pcOp = 0;
                aOp2 = 1;
                regWrite = 0;
            case(instruct[29:26])
                0:  zero = 1;
                1:  if (forBranch < 0) zero = 1;
                    else zero = 0;
                2:  if (forBranch > 0) zero = 1;
                    else zero = 0;
                3:  if (forBranch == 0) zero = 1;
                    else zero = 0;
            endcase
            end
        3:  begin
            case(instruct[29:26])
                0:  begin
                        regDst = 0;
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        aluOp = 4b'0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 0;
                        regWrite = 1;
                    end 
                1:  begin
                        branch = 0;
                        memRead = 0;
                        aluOp = 4b'0000;
                        memWrite = 1;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 0;
                        regWrite = 0;
                    end 
                2:  begin
                        regDst = ;
                        branch = ;
                        memRead = ;
                        memToReg = ;
                        aluOp = ;
                        memWrite = ;
                        aluSrc = ;
                        addrOp = ;
                        writeDataOp = ;
                        pcOp = ;
                        aOp2 = ;
                        spOp = ;
                        regWrite = ;
                    end
                3:  begin
                        regDst = ;
                        branch = ;
                        memRead = ;
                        memToReg = ;
                        aluOp = ;
                        memWrite = ;
                        aluSrc = ;
                        addrOp = ;
                        writeDataOp = ;
                        pcOp = ;
                        aOp2 = ;
                        spOp = ;
                        regWrite = ;
                    end
            endcase
            end
    endcase
    end
endmodule
