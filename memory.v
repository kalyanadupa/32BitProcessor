`timescale 1ns / 1ps

module memory(clk, address, writeData, memoryWrite, memoryRead, readData);
    input [31:0] address, writeData;
    input clk, memoryWrite, memoryRead;
    output reg [31:0] readData;

    reg[7:0] mems[63:0];
    wire[31:0] tmp;

    //MOVE R1, R0
	initial mems[0] = 8'b00001100;
	initial mems[1] = 8'b00100000;
	initial mems[2] = 8'b00000000; 
	initial mems[3] = 8'b00000000;

	//MOVE R2, R0
	initial mems[4] = 8'b00000100;
	initial mems[5] = 8'b01000000;
	initial mems[6] = 8'b00000000; 
	initial mems[7] = 8'b00000000;

	//R1 <= R1 + 3
	initial mems[8] = 8'b01000000;
	initial mems[9] = 8'b00100000;
	initial mems[10] = 8'b00000000; 
	initial mems[11] = 8'b00000011;

	//R2 <= R2 + 5
	initial mems[12] = 8'b01000000;
	initial mems[13] = 8'b01000000;
	initial mems[14] = 8'b00000000; 
	initial mems[15] = 8'b00000101;

	//CALL 12
	initial mems[16] = 8'b11010000;
	initial mems[17] = 8'b00000000;
	initial mems[18] = 8'b00000000; 
	initial mems[19] = 8'b00001100;

	//R1 = R1 + 0
	initial mems[20] = 8'b01000000;
	initial mems[21] = 8'b00100000;
	initial mems[22] = 8'b00000000; 
	initial mems[23] = 8'b00000000;

	//BZ R3 0
	initial mems[24] = 8'b11001100;
	initial mems[25] = 8'b00000000;
	//fill in here
	initial mems[26] = 8'b00000000; 
	initial mems[27] = 8'b00000000;

	//R3 = R2 - R1
	initial mems[28] = 8'b00000000;
	initial mems[29] = 8'b01100010;
	initial mems[30] = 8'b00001000; 
	initial mems[31] = 8'b10000101;

	//BZ R3 24
	initial mems[32] = 8'b11001100;
	initial mems[33] = 8'b01100000;
	//fill in here
	initial mems[34] = 8'b00000000; 
	initial mems[35] = 8'b00011000;

	//BMI R3 + 12
	initial mems[36] = 8'b11000100;
	initial mems[37] = 8'b01100000;
	initial mems[38] = 8'b00000000; 
	initial mems[39] = 8'b00001100;

	//R2 = R2 - R1
	initial mems[40] = 8'b00000000;
	initial mems[41] = 8'b01000010;
	initial mems[42] = 8'b00001000; 
	initial mems[43] = 8'b10000101;

	//BR +8
	initial mems[44] = 8'b10000000;
	initial mems[45] = 8'b00000000;
	initial mems[46] = 8'b00000000; 
	initial mems[47] = 8'b00001000;

	//R1 = R1 - R2
	initial mems[48] = 8'b00000000;
	initial mems[49] = 8'b00100001;
	initial mems[50] = 8'b00010000; 
	initial mems[51] = 8'b10000101;

	//BR -24
	initial mems[52] = 8'b10000000;
	initial mems[53] = 8'b00000000;
	initial mems[54] = 8'b11111111; 
	initial mems[55] = 8'b11101000;

	//RETURN
	initial mems[56] = 8'b11010100;
	initial mems[57] = 8'b00000000;
	initial mems[58] = 8'b00000000; 
	initial mems[59] = 8'b00000000;
   
    assign tmp[7:0] = mems[address+3];
    assign tmp[15:8] = mems[address+2];
    assign tmp[23:16] = mems[address+1];
    assign tmp[31:24] = mems[address+0];

    always @(posedge clk)
    begin
        if(memoryWrite == 1)
        begin
            mems[address+0] = writeData[31:24];
            mems[address+1] = writeData[23:16];
            mems[address+2] = writeData[15:8];
            mems[address+3] = writeData[7:0];
        end
        if(memoryRead == 1)
            readData = tmp;
    end
endmodule
