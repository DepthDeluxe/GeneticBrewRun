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
module swap(
	input clk,
	input [31:0] prg_seed,
	input [149:0] parent,
	
	output [4:0] debug_aug0,
	output [4:0] debug_aug1,
//	output [4:0] debug_selection,
	output [149:0] debug_change,
	output [2:0] debug_state,
	
	output reg [149:0] mutant,
	output reg done
	);

reg [149:0] next_mutant;
reg prg_start;

wire [4:0] aug0;
wire [4:0] aug1;

reg [2:0] state;
reg [2:0] next_state;
wire [1:0] random_state; assign random_state = prg_seed[11:10]; 	//accounts for randomized number of swaps, 0-3

reg next_done;

PseudorandomGenerator prg_module0 (
	.clk(clk),
	.start(prg_start),
	.in_seed(prg_seed),
	.value(aug0),
	.done(prg_done0)
	);
PseudorandomGenerator prg_module1 (
	.clk(clk),
	.start(prg_start),
	.in_seed(prg_seed+183),
	.value(aug1),
	.done(prg_done1)
	);

//debug assignment
assign debug_aug0 = aug0;
assign debug_aug1 = aug1;
//assign debug_selection = parent[5*aug0 -: 5];		//if aug0 is 0, then takes bits 0:-5
assign debug_change = parent ^ mutant;
assign debug_state = state;

initial begin
	mutant = 150'b0;
	state = 0;
	done = 0;
	prg_start = 0;
end


always @ (*)
begin
	case (state)
		0:
			begin
				next_mutant = mutant;
				next_done = done;
				
				if ( done == 0 )
					next_state = 1;
				else
					next_state = 0;
			end
					
		1:		//wait for random number
			begin
				prg_start = 1;
				next_mutant = mutant;		//retain mutant
				next_done = done;				//retain done
			
				if ( prg_done0 == 1 && prg_done1 == 1 )
				begin
					next_state = 2;
					prg_start = 0;
				end else
					next_state = 1;
			end
			
		2:		//sample random vars until acceptable values are attained
				//need 0-29
			begin
				next_mutant = mutant;		//retain mutant
				next_done = done;				//retain done
				prg_start = 0;
				
				//constrain random vars and random state, as long as done is 0
				if (random_state != 0)
					if (aug0 != aug1 && aug0 < 32 && aug0 > 0 && aug1 < 32 && aug1 > 0)
						next_state = random_state + 2;
					else
						next_state = 1;
				else
					next_state = 2;
			end
			
		3:		//first potential swap
			begin
				next_mutant = parent;		//set next_mutant
				next_done = 0;		//not done
				prg_start = 0;
			
				//set swapped indicies
				next_mutant[5*aug0] = parent[5*aug1];
				next_mutant[5*aug0 + 1] = parent[5*aug1 + 1];
				next_mutant[5*aug0 + 2] = parent[5*aug1 + 2];
				next_mutant[5*aug0 + 3] = parent[5*aug1 + 3];
				next_mutant[5*aug0 + 4] = parent[5*aug1 + 4];
				
				next_mutant[5*aug1] = parent[5*aug0];
				next_mutant[5*aug1 + 1] = parent[5*aug0 + 1];
				next_mutant[5*aug1 + 2] = parent[5*aug0 + 2];
				next_mutant[5*aug1 + 3] = parent[5*aug0 + 3];
				next_mutant[5*aug1 + 4] = parent[5*aug0 + 4];
				
				next_state = 4;	//move to next state
			end
			
		4:		//second potential swap
			begin
				next_mutant = parent;		//set next_mutant
				next_done = 0;		//not done
				prg_start = 0;
				
				//set swapped indicies
				next_mutant[5*aug0] = parent[5*aug1];
				next_mutant[5*aug0 + 1] = parent[5*aug1 + 1];
				next_mutant[5*aug0 + 2] = parent[5*aug1 + 2];
				next_mutant[5*aug0 + 3] = parent[5*aug1 + 3];
				next_mutant[5*aug0 + 4] = parent[5*aug1 + 4];
				
				next_mutant[5*aug1] = parent[5*aug0];
				next_mutant[5*aug1 + 1] = parent[5*aug0 + 1];
				next_mutant[5*aug1 + 2] = parent[5*aug0 + 2];
				next_mutant[5*aug1 + 3] = parent[5*aug0 + 3];
				next_mutant[5*aug1 + 4] = parent[5*aug0 + 4];
				
				next_state = 5;	//move to next state
			end
			
		5:		//third potential swap
			begin
				next_mutant = parent;		//set next_mutant
				prg_start = 0;
				
				//set swapped indicies
				next_mutant[5*aug0] = parent[5*aug1];
				next_mutant[5*aug0 + 1] = parent[5*aug1 + 1];
				next_mutant[5*aug0 + 2] = parent[5*aug1 + 2];
				next_mutant[5*aug0 + 3] = parent[5*aug1 + 3];
				next_mutant[5*aug0 + 4] = parent[5*aug1 + 4];
				
				next_mutant[5*aug1] = parent[5*aug0];
				next_mutant[5*aug1 + 1] = parent[5*aug0 + 1];
				next_mutant[5*aug1 + 2] = parent[5*aug0 + 2];
				next_mutant[5*aug1 + 3] = parent[5*aug0 + 3];
				next_mutant[5*aug1 + 4] = parent[5*aug0 + 4];

				next_done = 1;		//done
				next_state = 0;
			end
	endcase
end

always @ (posedge clk)
begin
	mutant <= next_mutant;
	state <= next_state;
	done <= next_done;
end

endmodule
