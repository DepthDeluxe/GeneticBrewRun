`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:00 04/16/2015 
// Design Name: 
// Module Name:    babymaker 
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
module Iterator(
    input clk,
	 input start,
	 input [31:0] prg_seed,
    input [149:0] parent,
    output [749:0] family,
	 output done
    );

// the first member of the family is always going to be the parent
assign family[149:0] = parent;
	
// state management
reg [1:0] state, next_state;
assign done = ( state == 2 );
wire swap_start; assign swap_start = ( state == 1 );
	
// declare an array of Swap modules (sooo cleeeeean)
reg [3:0] all_done;
wire [3:0] swap_done;
Swap swap_modules[3:0] (
	.clk(clk),
	.start(swap_start),
	.prg_seed(prg_seed),
	.parent(parent),
	.mutant(family[749:150]),
	.done(swap_done)
);

initial
begin
	state = 0; next_state = 0;
	all_done = 0;
end

integer i;
always @ ( * )
begin
	// default case is to hold
	all_done = all_done;

	// states
	// 0: hold / wait to start
	// 1: wait for all swap modules to stop
	// 2: done
	case ( state )
	0:
	begin
		if ( start )
			next_state = 1;
		else
			next_state = 0;
			
		// reset the all_done register
		all_done = 0;
	end
	1:
	begin
		// only go on to end state when every single Swap module is done
		if ( all_done == 4'b1111 )
			next_state = 2;
		else
			next_state = 1;
	
		for ( i = 0; i < 4; i = i + 1 )
			all_done[i] = all_done[i] | swap_done[i];
	end
	default:
	begin
		next_state = 0;
		all_done = all_done;
	end
	endcase
end

always @ ( posedge clk )
begin
	state <= next_state;
end

endmodule
