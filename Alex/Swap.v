`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:05 04/09/2015 
// Design Name: 
// Module Name:    swap 
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
module Swap(
	input clk,
	input start,
	input [31:0] prg_seed,
	input [149:0] parent,
	
	output [4:0] debug_aug0,
	output [4:0] debug_aug1,
	output [149:0] debug_change,
	output [2:0] debug_state,
	
	output reg [149:0] mutant,
	output done
	);
	

reg [149:0] next_mutant;
reg [2:0] state, next_state;
reg [2:0] counter, next_counter;

assign done = ( state == 5 );

// PRG controls
wire [7:0] prg_val0, prg_val1;
wire prg_start; assign prg_start = ( state == 1 || state == 2 );
wire prg_done;
PseudorandomGenerator prg_module0 (
	.clk(clk),
	.start(prg_start),
	.in_seed(prg_seed),
	.value(prg_val0),
	.done(prg_done)
	);
PseudorandomGenerator prg_module1 (
	.clk(clk),
	.start(prg_start),
	.in_seed(~prg_seed),
	.value(prg_val1)
	);
	
// indices
wire [4:0] index0, index1;
assign index0 = prg_val0[4:0];
assign index1 = prg_val1[4:0];

initial begin
	mutant = 0; next_mutant = 0;
	counter = 0; next_counter = 0;
	state = 0; next_state = 0;
end

integer i;
always @ (*)
begin
	// default behavior: keep mutant the same
	next_mutant = mutant;
	next_counter = counter;

	// states
	// 0: hold state
	// 1: generate random counter value, wait for PRG
	// 2: generate indices, wait for PRG
	// 3: PRG acceptable check
	// 4: swaps indices
	// 5: done state
	case ( state )
		0:	// hold state
			if ( start )
			begin
				next_state = 1;
				next_mutant = parent;
			end
			else
				next_state = 0;
				
		1: // wait for PRG, generate number of swaps we will do
			if ( prg_done )
			begin
				next_state = 3;
				
				// will swap 1-3 times
				next_counter = prg_val0[7:5] + 1;
			end
			else
				next_state = 1;

		2:	// wait for PRG, generate indices
			if ( prg_done )
				next_state = 3;
			else
				next_state = 2;
			
		3:	// PRG acceptable check	
			//sample random vars until acceptable values are attained
			//need 0-29
			if (index0 != index1 && index0 < 30 && index1 < 30)
				next_state = 4;
			else
				next_state = 2;
			
		4: // perform swap
			begin			
				//set swapped indicies
				for ( i = 0; i < 5; i = i + 1 )
				begin
					next_mutant[5 * index0 + i] = mutant[5 * index1 + i];
					next_mutant[5 * index1 + i] = mutant[5 * index0 + i];
				end
				
				// decrement counter, if counter is zero, move to done state
				next_counter = counter - 1;
				if ( counter == 0 )
					next_state = 5;
				else
					next_state = 2;
			end
		5:
			next_state = 0;
	endcase
end

always @ (posedge clk)
begin
	mutant <= next_mutant;
	counter <= next_counter;
	state <= next_state;
end

endmodule
