`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:47 04/29/2015 
// Design Name: 
// Module Name:    PopSorter 
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
module PopSorter(
	 input clk,
	 input start,
    input [11:0] in[49:0],
    output reg [5:0] sorted[49:0],
	 output done
    );
	 
	 reg [11:0] distances[49:0], next_distances[49:0];
	 
	 reg [1:0] state, next_state;
	 reg [5:0] counter, next_counter;
	 
	 reg [5:0] least_index;
	 reg [5:0] least_value;
	 
	 reg [5:0] next_sorted[49:0];
	 
	 assign done = ( state == 2 );
	 
	 reg [14:0] i;
	 initial begin
		sorted_pop = 0;
		for ( int i = 0; i < 49; i = i + 1 )
		begin
			distances[i] = 0;
			next_distances[i] = 0;
			next_sorted[i] = 0;
		end
		state = 0;
		next_state = 0;
		counter = 0;
		next_counter = 0;
		least_index = 0;
	 end
	 
	 always @ ( * )
	 begin
	   // state 0: waiting to start state
		// state 1: processing state
		// state 2: done state
		
		least_index = 0;
		least_value = 0;
		next_sorted = sorted;
		next_distances = distances;
		
		case ( state )
		0:
		begin
			if ( start )
			begin
				next_state = 1;
				next_distances = in;
			end
			else
				next_state = 0;
			
			next_counter = 0;
		end
		1:
		begin
			// stay in this state until the counter is full
			if ( counter < 49 )
				next_state = 1;
			else
				next_state = 2;
				
			least_value = 6'b111111;
			for ( i = 0; i < 49; i = i + 1 )
			begin
				if ( distances[i] < least_value )
				begin
					least_value = distances[i];
					least_index = i;
				end
			end
			
			// save that index and
			// set that index to a max value so it won't be picked up again
			next_sorted[counter] = least_index;
			next_distances[least_index] = 11'b11111111111;
			
			next_counter = counter + 1;
		end
		default:
		begin
			next_state = 1;
			next_counter = 0;
		end
		endcase
	end

	always @ ( posedge clk )
	begin
		sorted <= next_sorted;
		distances <= next_distances;
		state <= next_state;
		counter <= next_counter;
	end

endmodule
