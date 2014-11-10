`timescale 1ns / 1ps

module memory(clk, address, write_data, memory_write, memory_read, read_data);
    input [31:0] address, write_data;
    input clk, memory_write, memory_read;
    output reg [31:0] read_data;
	 
    reg[7:0] mems[63:0];
    wire[31:0] tmp;
    assign tmp[7:0] = mems[address+3];
    assign tmp[15:8] = mems[address+2];
    assign tmp[23:16] = mems[address+1];
    assign tmp[31:24] = mems[address+0];
	 
	always @(posedge clk)
	begin
		if(memory_write == 1)
		begin
			mems[address+0] = write_data[31:24];
			mems[address+1] = write_data[23:16];
			mems[address+2] = write_data[15:8];
			mems[address+3] = write_data[7:0];
      end
      if(memory_read == 1)
			read_data = tmp;
    end
endmodule
