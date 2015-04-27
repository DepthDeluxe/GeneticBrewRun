`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:08:17 04/22/2015
// Design Name:   compDistance
// Module Name:   U:/public/selection/compDistanceTest.v
// Project Name:  selection
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: compDistance
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module compDistanceTest;

	// Inputs
	reg [149:0] in;

	// Outputs
	wire [12:0] out;

	// Instantiate the Unit Under Test (UUT)
	compDistance uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 149'b11;

		// Wait 100 ns for global reset to finish
		#200;
		
		in = 149'b000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110;
		
		#200;
        
		// Add stimulus here

	end
      
endmodule

