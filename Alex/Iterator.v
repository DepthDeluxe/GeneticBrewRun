`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:00 04/16/2015 
// Design Name: 
// Module Name:    babymaker 
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
module iterator(
    input clk,
	 input [31:0] prg_seed,
    input [149:0] parent,
    output [749:0] family
    );
	 
wire child_1;
wire child_2;
wire child_3;
wire child_4;

assign family = {parent, child_1, child_2, child_3, child_4};

swap swap_00 (.clk(clk), .prg_seed(prg_seed), .parent(parent), .mutant(child_1));
swap swap_01 (.clk(clk), .prg_seed(prg_seed), .parent(parent), .mutant(child_2));
swap swap_02 (.clk(clk), .prg_seed(prg_seed), .parent(parent), .mutant(child_3));
swap swap_03 (.clk(clk), .prg_seed(prg_seed), .parent(parent), .mutant(child_4));
//deletionInsertion deletionInsertion_1 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1499:1350]), .mutant(child_3));
//inversion inversion_1 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1499:1350]), .mutant(child_4));

endmodule
