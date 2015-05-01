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
    input [599:0] in,
    output reg [299:0] sorted,
	 output [5:0] least_index_out,
	 output [5:0] least_value_out,
	 output [1:0] state_out,
	 output done
    );
	 
	 reg [11:0] distances[49:0]; reg [11:0] next_distances[49:0];
	 
	 reg [1:0] state, next_state; assign state_out = state;
	 reg [5:0] counter, next_counter;
	 
	 reg [5:0] least_index; assign least_index_out = least_index;
	 reg [5:0] least_value; assign least_value_out = least_value;
	 
	 reg [5:0] next_sorted[49:0];
	 
	 assign done = ( state == 2 );
	 
	 reg [14:0] i; reg [14:0] j;
	 initial begin
		sorted = 0;
		
		// init the values for sorted and distances
		for ( i = 0; i < 50; i = i + 1 )
		begin
			for ( j = 0; j < 6; j = j + 1 )
				sorted[6 * i + j] = 0;
			next_sorted[i] = 0;
			
			for ( j = 0; j < 12; j = j + 1 )
				distances[i][j] = 0;
			next_distances[i] = 0;
		end
		
		state = 0; next_state = 0;
		counter = 0; next_counter = 0;
		least_index = 0;
	 end
	 
	 always @ ( * )
	 begin
		least_index = 0;
		least_value = 0;
		for ( i = 0; i < 50; i = i + 1 )
		begin
			for ( j = 0; j < 6; j = j + 1 )
				next_sorted[i][j] = sorted[6 * i + j];
				
			next_distances[i] = distances[i];
		end
		
	   // state 0: waiting to start state
		// state 1: processing state
		// state 2: done state
		case ( state )
		0:
		begin
			if ( start )
			begin
				next_state = 1;
				
				// sample from input when we are starting
				for ( i = 0; i < 50; i = i + 1 )
					for ( j = 0; j < 12; j = j + 1 )
						next_distances[i][j] = in[12 * i + j];
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
			least_index = 5;
			for ( i = 0; i < 50; i = i + 1 )
			begin
				if ( distances[i] < least_value )
				begin
					least_value = distances[i];
					least_index = i;
				end
			end
			
			// save that index and
			// set that index to a max value so it won't be picked up again
			for ( i = 0; i < 6; i = i + 1 )
				next_sorted[6 * counter + i] = least_index[i];
			next_distances[least_index] = 12'b111111111111;
			
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
		for ( i = 0; i < 50; i = i + 1 )
		begin
			for ( j = 0; j < 6; j = j + 1 )
				sorted[6 * i + j] <= next_sorted[i][j];
			
			distances[i] <= next_distances[i];
		end
		
		state <= next_state;
		counter <= next_counter;
	end

endmodule
