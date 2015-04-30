`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:33:34 04/30/2015
// Design Name:   Top
// Module Name:   H:/Users/cjh025/Documents/GitHub/GeneticBrewRun/Top_Test.v
// Project Name:  GeneticBrewRun
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_Test;

	// Inputs
	reg clk;
	reg button;

	// Outputs
	wire light;
	wire uart_out;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.button(button),
		.light(light),
		.uart_out(uart_out)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		button = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		button = 1;
		
		#10000000;
        
		// Add stimulus here

	end
      
endmodule

