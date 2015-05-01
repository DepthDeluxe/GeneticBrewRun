`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:16 04/08/2015 
// Design Name: 
// Module Name:    selection 
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
module Selection(
    input clk,
    input start,
    input [7499:0] pop,
	 
    output reg [1499:0] sel_pop,
    output done
    );
	 
	 reg [1:0] state, next_state;
	 
	 wire [599:0] distances;				// holds computed distances
	 wire cdp_start, cdp_done;			// done for distance computation
	 wire [299:0] sorted_indices;		// sorted indices from sorting algo
	 wire ps_start, ps_done;			// done for
	 
	 assign cdp_start = ( state == 1 );
	 CompDistancePop cdp_module(
		.clk(clk),
		.start(cdp_start),
		.pop(pop),
		.distances(distances),
		.done(cdp_done)
	  );
	 
	 assign ps_state = ( state == 2 );
	 PopSorter pop_sorter_module(
		.clk(clk),
		.start(ps_start),
		.in(distances),
		.sorted(sorted_indices),
		.done(ps_done)
	  );
	
	 assign done = (state == 3);
	 assign cdp_start = ( state == 1 );
	 assign ps_start = ( state == 2 );
	 
	 initial begin
		state = 0;
		next_state = 0;
	 end
	 
	 reg [3:0] i;
	 reg [7:0] j;
	 always @ ( * )
	 begin
		// map the selected population out as mapped by the sorted indices
		for ( i = 0; i < 10; i = i + 1 )
			for ( j = 0; j < 150; j = j + 1 )
				sel_pop[150 * i + j] = pop[150 * sorted_indices[i] + j];
	 
		// states
		// 0: waiting to start
		// 1: distance calculation
		// 2: sorting
		// 3: done
		case ( state )
		0:
			if ( start ) 
				next_state = 1;
			else
				next_state = 0;
		1:
			if ( cdp_done )
				next_state = 2;
			else
				next_state = 1;
		2:
			if ( ps_done )
				next_state = 3;
			else
				next_state = 2;
		3:
			next_state = 0;
		endcase
	 end
	 
	 always @ ( posedge clk )
	 begin
		state <= next_state;
	 end
	
endmodule
