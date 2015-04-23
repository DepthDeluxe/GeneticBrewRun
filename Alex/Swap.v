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
	
//	output [4:0] debug_aug0,
//	output [4:0] debug_aug1,
//	output [4:0] debug_selection,
//	output [149:0] debug_change,
	
	output reg [149:0] mutant,
	output reg done
	);

//test code	
//initial begin
//mutant = 0;
//end
//
//always @ ( * )
//begin
//mutant = parent;
//end

wire [4:0] split_parent [29:0]; assign split_parent = parent;
reg [4:0] next_split_parent[29:0];

wire [149:0] next_mutant; assign next_mutant = next_split_parent;

wire [4:0] aug0;
wire [4:0] aug1;

reg [1:0] state;
reg [1:0] next_state;
wire [1:0] random_state; 	//accounts for randomized number of swaps, 0-3

reg next_done;

random random_1 (.clk(clk), .prg_seed(prg_seed), .random0(aug0), .random1(aug1));

assign random_state = prg_seed[11:10];

//assign debug_aug0 = aug0;
//assign debug_aug1 = aug1;
//assign debug_selection = parent[5*aug0 -: 5];		//if aug0 is 0, then takes bits 0:-5
//assign debug_change = parent ^ mutant;

initial begin
	//mutant = 150'b0;
	split_parent = 0;

	state = 0;	
	done = 0;

end


always @ (*)
begin
	case (state)
		0:		//sample random vars until acceptable values are attained
				//need 0-29
			begin
				next_mutant = mutant;		//retain mutant
				next_done = done;				//retain done

				//constrain random vars
				if (done == 0 && aug0 != aug1 && aug0 < 32 && aug0 > 0 && aug1 < 32 && aug1 > 0 && random_state != 0)
					next_state = random_state;
				else
					next_state = 0;
			end
			
		1:		//first potential swap
			begin
				next_mutant = parent;		//set next_mutant
			
				//set swapped indicies
				//next_mutant[5*aug0 -: 5] = parent[5*aug1 -: 5];
				//next_mutant[5*aug1 -: 5] = parent[5*aug0 -: 5];
				next_split_parent[aug0] = split_parent[aug1];
				next_split_parent[aug1] = split_parent[aug0];
				
				next_done = 0;		//not done
				next_state = 2;	//move to next state
			end
			
		2:		//second potential swap
			begin
				next_mutant = parent;		//set next_mutant
			
				//set swapped indicies
				//next_mutant[5*aug0 -: 5] = parent[5*aug1 -: 5];
				//next_mutant[5*aug1 -: 5] = parent[5*aug0 -: 5];
				next_split_parent[aug0] = split_parent[aug1];
				next_split_parent[aug1] = split_parent[aug0];
				
				next_done = 0;		//not done
				next_state = 3;	//move to next state
			end
			
		3:		//third potential swap
			begin
				next_mutant = parent;		//set next_mutant
			
				//set swapped indicies
				//next_mutant[5*aug0 -: 5] = parent[5*aug1 -: 5];
				//next_mutant[5*aug1 -: 5] = parent[5*aug0 -: 5];
				next_split_parent[aug0] = split_parent[aug1];
				next_split_parent[aug1] = split_parent[aug0];

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
