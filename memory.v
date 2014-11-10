`timescale 1ns / 1ps

module memory(clk, address, writeData, memoryWrite, memoryRead, readData);
    input [31:0] address, writeData;
    input clk, memoryWrite, memoryRead;
    output reg [31:0] readData;
	 
    reg[7:0] mems[63:0];
    wire[31:0] tmp;
    
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
