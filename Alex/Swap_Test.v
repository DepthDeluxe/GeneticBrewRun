`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:58:55 04/22/2015
// Design Name:   swap
// Module Name:   U:/public/Genetic_Algorithm_Alex/swapTest.v
// Project Name:  Genetic_Algorithm_Alex
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: swap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module swapTest;

	// Inputs
	reg clk;
	reg [31:0] prg_seed;
	reg [149:0] parent;
	
	// Outputs
//	wire [4:0] debug_aug0;
//	wire [4:0] debug_aug1;
//	wire [4:0] debug_selection;
//	wire [149:0] debug_change;

	wire [149:0] mutant;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	swap uut (
		.clk(clk), 
		.prg_seed(prg_seed), 
		.parent(parent),
//		.debug_aug0(debug_aug0),
//		.debug_aug1(debug_aug1),
//		.debug_selection(debug_selection),
//		.debug_change(debug_change),
		.mutant(mutant),
		.done (done)
	);

	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		prg_seed = 0;
		parent = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		prg_seed = 32'd3124684136;
		parent = 150'b000000000100010000110010000101001100011101000010010101001011011000110101110011111000010001100101001110100101011011010111110001100111010110111110011101;

	end
      
endmodule

