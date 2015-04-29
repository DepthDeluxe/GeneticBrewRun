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
    input [7499:0] pop,
	 
	 output [11:0] distances[49:0],
    output done
    );
	
	wire [49:0] all_done;
	assign done = (all_done == 0);
	CompDistance cd_modules[49:0] (
	 .clk(clk),
	 .start(start),
    .in(pop),
	 .done(all_done),
    .out(distances)
    );

endmodule
