`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:03 04/22/2015
// Design Name:   getDistance
// Module Name:   U:/public/selection/getDistanceTest.v
// Project Name:  selection
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: getDistance
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module getDistanceTest;

	// Inputs
	reg [4:0] value1;
	reg [4:0] value2;

	// Outputs
	wire [9:0] dist;

	// Instantiate the Unit Under Test (UUT)
	getDistance uut (
		.value1(value1), 
		.value2(value2), 
		.dist(dist),
	);

	initial begin
		// Initialize Inputs
		value1 = 01010;
		value2 = 11000;

		// Wait 100 ns for global reset to finish
		#100;
		
		value1 = 01001;
		value2 = 01100;
		
		#100;
        
		// Add stimulus here

	end
      
endmodule

