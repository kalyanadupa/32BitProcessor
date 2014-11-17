`timescale 1ns / 1ps

module controlPath(clk, instruct, regDst, branch, memRead, memToReg, aluOp, memWrite, aluSrc,
                   addrOp, writeDataOp, pcOp, aOp2, spOp, regWrite, zero, spWrite, spWrite2, wdOp2);
    input clk;
    input[31:0] instruct;
    output regDst, branch, memRead, memToReg, memWrite, aluSrc, addrOp,
           writeDataOp, pcOp, aOp2, regWrite, zero, spWrite, spWrite2, wdOp2;
    reg regDst, branch, memRead, memToReg, memWrite, aluSrc, addrOp,
           writeDataOp, pcOp, aOp2, regWrite, zero, spWrite, spWrite2, wdOp2;
    output[3:0] aluOp, spOp;
    reg[3:0] aluOp, spOp;
    wire[31:0] forBranch, t1;
    registerBank rb(forBranch, t1, clk, 1'b0, instruct[25:21], 5'b0, 5'b0, 32'b0);
    
    always@(posedge clk)
    begin
    case(instruct[31:30])
        0:  begin
            case(instruct[29:26])
                // arthematic
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
                        spWrite = 0;
                        wdOp2 = 0;
                        aluOp = instruct[11:8];
                    end
                // push
                1:  begin
                        branch = 0;
                        memRead = 0;
                        aluOp = 4'b0000;
                        memWrite = 1;
                        aluSrc = 1;
                        addrOp = 1;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        spOp = 4'b0000;
                        regWrite = 0;
                        spWrite = 0;
                        wdOp2 = 0;
                    end
                // pop
                2:  begin
                        regDst = 0;
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        aluOp = 4'b0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 1;
                        pcOp = 1;
                        aOp2 = 1;
                        spOp = 4'b0001;
                        regWrite = 1;
                        spWrite = 0;
                        wdOp2 = 0;
                    end
                // move
                3:  begin
                        regDst = 0;
                        branch = 0;
                        memToReg = 0;
                        aluOp = 4'b0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        regWrite = 1;
                        spWrite = 0;
                        wdOp2 = 0;
                    end
            endcase
            end
        // immediate arthematic
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
                spWrite = 0;
                wdOp2 = 0;
                aluOp = instruct[11:8];
            end
        // branch
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
                spWrite = 0;
                wdOp2 = 0;
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
                // load
                0:  begin
                        regDst = 0;
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        aluOp = 4'b0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 0;
                        regWrite = 1;
                        spWrite = 0;
                        wdOp2 = 0;
                    end
                // store
                1:  begin
                        branch = 0;
                        memRead = 0;
                        aluOp = 4'b0000;
                        memWrite = 1;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 0;
                        regWrite = 0;
                        spWrite = 0;
                        wdOp2 = 0;
                    end
                // load stack
                2:  begin
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        aluOp = 4'b0000;
                        memWrite = 0;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 0;
                        aOp2 = 1;
                        regWrite = 0;
                        spWrite = 1;
                        spWrite2 = 1;
                        wdOp2 = 0;
                    end
                // store stack
                3:  begin
                        branch = 0;
                        memRead = 0;
                        aluOp = 1;
                        memWrite = 1;
                        aluSrc = 1;
                        addrOp = 0;
                        writeDataOp = 1;
                        pcOp = 0;
                        regWrite = 0;
                        spWrite = 0;
                        wdOp2 = 1;
                    end
                // call
                4:  begin
                        regDst = 1;
                        branch = 0;
                        memWrite = 1;
                        addrOp = 1;
                        writeDataOp = 1;
                        pcOp = 0;
                        aOp2 = 1;
                        spOp = 4'b0001;
                        regWrite = 0;
                        spWrite = 1;
                        wdOp2 = 0;
                    end
                // ret
                5:  begin
                        branch = 0;
                        memRead = 1;
                        memToReg = 1;
                        memWrite = 0;
                        addrOp = 0;
                        writeDataOp = 0;
                        pcOp = 1;
                        aOp2 = 0;
                        spOp = 4'b0000;
                        regWrite = 0;
                        spWrite = 1;
                        wdOp2 = 0;
                    end
            endcase
            end
    endcase
    end
endmodule
