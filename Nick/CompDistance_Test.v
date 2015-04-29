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

module CompDistance_Test;

	// Inputs
	reg clk;
	reg start;
	reg [149:0] in;

	// Outputs
	wire [11:0] out;
	wire done;
	wire [9:0] dout_debug;

	// Instantiate the Unit Under Test (UUT)
	CompDistance uut (
		.clk(clk),
		.start(start),
		.in(in),
		.out(out),
		.done(done),
		.dout_debug(dout_debug)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		in = 149'b11;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#200;
		
		in = 149'b000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110000000011000000001100000000110;
		start = 1;
		#10;
		start = 0;
		
		#10000;
        
		// Add stimulus here

	end
      
endmodule

