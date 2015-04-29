`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:42 04/28/2015
// Design Name:   CompDistancePop
// Module Name:   H:/Users/cjh025/Documents/GitHub/GeneticBrewRun/CompDistancePop_Test.v
// Project Name:  GeneticBrewRun
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CompDistancePop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CompDistancePop_Test;

	// Inputs
	reg clk;
	reg start;
	reg [7499:0] pop;

	// Instantiate the Unit Under Test (UUT)
	CompDistancePop uut (
		.clk(clk), 
		.start(start), 
		.pop(pop)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		pop = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		start = 1;
		#10000;
        
		// Add stimulus here

	end
      
endmodule

