`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:20:48 04/20/2015
// Design Name:   random
// Module Name:   U:/public/Genetic_Algorithm_Alex/randomTest.v
// Project Name:  Genetic_Algorithm_Alex
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module randomTest;

	// Inputs
	reg clk;
	reg [31:0] prg_seed;

	// Outputs
	wire [4:0] random0;
	wire [4:0] random1;

	// Instantiate the Unit Under Test (UUT)
	random uut (
		.clk(clk), 
		.prg_seed(prg_seed), 
		.random0(random0), 
		.random1(random1)
	);
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		prg_seed = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		prg_seed = 684135483;
		#40
		prg_seed = 1836248158;

	end
      
endmodule

