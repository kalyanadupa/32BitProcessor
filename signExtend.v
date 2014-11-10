`timescale 1ns / 1ps

module signExtend(clk, in, out);
	input clk;
	input[11:0] in;
	output[31:0] out;
	
	wire[11:0] in;
	reg[31:0] out;
	
	always @( posedge clk )
	begin
		out[31:0] <= {{20{in[11]}}, in[11:0]};
	end
endmodule
