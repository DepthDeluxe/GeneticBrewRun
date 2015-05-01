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
	 
    output [1499:0] sel_pop,
    output done
    );
	 
	 wire distances[599:0];				// holds computed distances
	 wire cdp_done;						// done for distance computation
	 wire [299:0] sorted_indices;		// sorted indices from sorting algo
	 wire ps_done;							// done for 
	 
	 CompDistancePop cdp_module(
     .clk(clk),
     .start(start),
     .pop(pop),
	  .distances(distances),
	  .done(cdp_done)
	  );
	 
	  PopSorter pop_sorter_module(
		.clk(clk),
		.start(ps_start),
		.in(distances),
		.sorted(sorted_indices),
		.done(ps_done)
	  );
	 
	 reg [1:0] state;
	 reg [1:0] next_state;
	
	 assign done = (state == 1);
	 assign sel_pop = pop[1499:0];
	 
	 initial begin
		state = 0;
		next_state = 0;
	 end
	 
	 always @ ( * )
	 begin
		case ( state )
		0:
			if ( start ) 
				next_state = 1;
			else
				next_state = 0;
		1: next_state = 0;
		default: next_state = 1;
		endcase
	 end
	 
	 always @ ( posedge clk )
	 begin
		state <= next_state;
	 end
	
endmodule
