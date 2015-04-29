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
	reg [11:0] in[49:0];
	
	wire done;
	wire [5:0] sorted[49:0];

	// Instantiate the Unit Under Test (UUT)
	PopSorter uut (
		.clk(clk), 
		.start(start), 
		.in(in)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		
		in = 128490238590238502385238502386902386902369072390679032786023485234858235523485234528490238490238690182346024903768923475890234756072348907623489076890234786;

		// Wait 100 ns for global reset to finish
		#100;
		
		start = 1;
		#10;
		start = 0;
		#10000;

	end
      
endmodule

