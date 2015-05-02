`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:12 04/09/2015 
// Design Name: 
// Module Name:    mutationTemp 
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


//http://stackoverflow.com/questions/12412909/applying-mutation-in-a-ga-to-solve-the-traveling-salesman

//each gene should have a certain tendency to change based on a mutation rate
//mutation indicies don't work if random vars refer to terminal indicies
module Mutation(
    input clk,
	 input start,
	 input [374:0] sel_population, //selection is 20%, 10 paths at 150 bits apiece
    input [31:0] prg_seed,
    output [1874:0] mutant_pop, // 50 paths at 150 bits apiece
	 output done
    );
	 

reg [1:0] state, next_state;
reg [9:0] all_done;

wire iter_start; assign iter_start = ( state == 1 );
assign done = ( state == 2 );


initial begin
	state = 0;
end

wire [4:0] iter_done;
Iterator iterator_modules[4:0] (
	.clk(clk),
	.start(iter_start),
	.prg_seed(prg_seed),
	.parent(sel_population),
	.family(mutant_pop),
	.done(iter_done)
);	

initial begin
	state = 0; next_state = 0;
end
		
integer i;
always @ ( * )
begin
	// default case is to hold
	all_done = all_done;

	// states
	// 0: hold
	// 1: wait for iterators
	// 2: done
	case (state)
		0:
		begin
			if ( start )
				next_state = 1;
			else
				next_state = 0;		//retain state
			
			all_done = 0;
		end
		1:
		begin
			if ( all_done == 5'b11111 )
				next_state = 2;
			else
				next_state = 1;
			
			// wait for all modules to finish
			for ( i = 0; i < 5; i = i + 1 )
				all_done[i] = all_done[i] | iter_done[i];
		end
		
		default:
		begin
			next_state = 0;
			all_done = all_done;
		end
	endcase
end


always @ (posedge clk)
begin
	state <= next_state;
end
endmodule
