`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:49 04/29/2015
// Design Name:   PopSorter
// Module Name:   H:/Users/cjh025/Documents/GitHub/GeneticBrewRun/PopSorter_Test.v
// Project Name:  GeneticBrewRun
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PopSorter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PopSorter_Test;

	// Inputs
	reg clk;
	reg start;
	reg [599:0] in;
	
	wire done;
	wire [299:0] sorted;

	// Instantiate the Unit Under Test (UUT)
	PopSorter uut (
		.clk(clk), 
		.start(start),
		.sorted(sorted),
		.in(in)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		
		in = -1356136;

		// Wait 100 ns for global reset to finish
		#100;
		
		start = 1;
		#10;
		start = 0;
		#10000;

	end
      
endmodule

