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
    input [74:0] in,
    output reg [11:0] distance,
	 output done
    );
	 
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
	 
	 assign done = ( state == 3 );
	 
	 // A and B are adjacent places in the in array
	 wire [4:0] A; assign A = in[counter];
	 wire [4:0] B; assign B = in[counter + 1];
	 assign addr = (A < B) ? (A << 5 | B) : (B << 5 | A);
	 
	 reg [11:0] next_distance;
	 
	 initial begin
		state = 0; next_state = 0;
		counter = 0; next_counter = 0;
		distance = 0; next_distance = 0;
	 end
	 
	 always @ ( * )
	 begin
		// default assignment: remain unchanged
		next_counter = counter;
		next_distance = distance;
		
		// state 0: hold
		// state 1: wait for ROM
		// state 2: do math, increment counter, check for done
		// state 3: done
		case ( state )
		0:
			if ( start )
			begin
				next_state = 1;
				next_counter = 0;
				next_distance = 0;
			end
			else
				next_state = 0;
		
		1:
			next_state = 2;
		
		2:
		begin
			// will only need to do 6 calculations since we are looking
			// between the nodes
			if ( counter < 6 )
				next_state = 1;
			else
				next_state = 3;
			
			// increment counter, add the output of the ROM module
			next_counter = counter + 1;
			next_distance = distance + dout;
		end
		
		3: next_state = 0;
		endcase
	 end
	 
	 always @ ( posedge clk )
	 begin
		state <= next_state;
		counter <= next_counter;
		distance <= next_distance;
	 end
	 
endmodule
