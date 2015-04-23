`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:00 04/09/2015 
// Design Name: 
// Module Name:    randomTemp 
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

//random generation
//inputs prg_seed and outputs two PRN's between 0 and 149, inclusive

module random(
	input clk,
	input [31:0] prg_seed,
	output reg [4:0] random0,
	output reg [4:0] random1
	);

reg [4:0] next_random0;
reg [4:0] next_random1;

initial begin
random0 = 0;
random1 = 0;
next_random0 = 0;
next_random1 = 0;
end

always @ (*)
begin
	//assign next_random vars based on prg_seed
	next_random0 = prg_seed[4:0];
	next_random1 = prg_seed[9:5];
end

//assign random vars
always @ (posedge clk)
begin
//if ( random0 != random1 && random0 < 149 && random1 < 149 )
	random0 = next_random1;
	random1 = next_random0;
end
endmodule
