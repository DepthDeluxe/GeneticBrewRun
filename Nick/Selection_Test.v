`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:08:12 04/22/2015
// Design Name:   selection
// Module Name:   U:/public/selection/selectionTest.v
// Project Name:  selection
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: selection
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Selection_Test;

	// Inputs
	reg clk;
	reg start;
	reg [7499:0] pop;
	
	// Outputs
	wire [1499:0] sel_pop;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	Selection uut (
		.clk(clk), 
		.start(start), 
		.pop(pop),
		.sel_pop(sel_pop), 
		.done(done)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		pop = 7500'b111111111111111111111111;

		// Wait 100 ns for global reset to finish
		#100;
		
		start = 1;
		#50;
		start = 0;
		#100000;

	end
      
endmodule

