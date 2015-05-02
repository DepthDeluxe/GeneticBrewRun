`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:29 04/28/2015 
// Design Name: 
// Module Name:    CompDistancePop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CompDistancePop(
    input clk,
    input start,
    input [1874:0] pop,
	 
	 output [299:0] distances,
    output reg done
    );
	
	wire [24:0] all_done;
	CompDistance cd_modules[24:0] (
	 .clk(clk),
	 .start(start),
    .in(pop),
	 .done(all_done),
    .distance(distances)
    );
	 
	// we are done only when every single module is done
	integer i;
	always @ ( * )
	begin
		done = 1;
		for ( i = 0; i < 24; i = i + 1 )
			done = done & all_done[i];
	end
endmodule
