`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:46 04/08/2015 
// Design Name: 
// Module Name:    compDistance 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CompDistance(
	 input clk,
	 input start,
    input [149:0] in,
	 output done,
    output reg [11:0] out,
	 output [9:0] dout_debug
    );
	 
	 assign dout_debug = dout;
	 
	 // declare the RAM table
	 wire [9:0] addr;
	 wire [8:0] dout;
	 DistanceTable dt_mod (
		clk,
		addr,
		dout
	 );
	 
	 // holds the state and currently active module
	 reg [1:0] state; reg [1:0] next_state;
	 reg [3:0] counter; reg [3:0] next_counter;
	 assign done = (state == 2);
	 
	 // A and B are adjacent places in the in array
	 wire [4:0] A; assign A = in[counter];
	 wire [4:0] B; assign B = in[counter + 1];
	 assign addr = (A < B) ? (A << 5 | B) : (B << 5 | A);
	 
	 reg [11:0] next_out;
	 
	 initial begin
		state = 3;
		next_state = 3;
		counter = 0;
		next_counter = 0;
		out = 0;
		next_out = 0;
	 end
	 
	 always @ ( * )
	 begin
		// state 0: wait for ROM
		// state 1: increment counter
		// state 2: done
		// state 3: hold
		case ( state )
		0: begin
			next_state = 1;
			next_counter = counter;
			next_out = out;
			end
		1: begin
			// if we aren't done, then move back to first state
			if ( counter > 13 )
				next_state = 2;
			else
				next_state = 0;
			
			// increment counter, add the output of the ROM module
			next_counter = counter + 1;
			next_out = out + dout;
			end
		2: begin
			next_state = 3;
			next_counter = 0;
			next_out = out;
			end
		3: begin
			if ( start )
				next_state = 0;
			else
				next_state = 3;
			
			next_counter = 0;
			next_out = 0;
			end
		endcase
	 end
	 
	 always @ ( posedge clk )
	 begin
		state <= next_state;
		counter <= next_counter;
		out <= next_out;
	 end
	 
endmodule
