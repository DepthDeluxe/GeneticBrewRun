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
module mutation(
    input clk,
	 input start,
	 input [1499:0] sel_population, //selection is 20%, 10 paths at 150 bits apiece
    input [31:0] prg_seed,
    output reg [7499:0] mutant_pop, // 50 paths at 150 bits apiece
	 output done
    );

wire [7499:0] next_mutant_pop;

reg state;
reg next_state;

assign done = (state == 2);

initial begin
	mutant_pop = 7500'b0;
	state = 0;
end

	iterator iterator[9:0] (
		.clk(clk),
		.prg_seed(prg_seed),
		.parent(sel_population),
		.family(next_mutant_pop)
	);	
		
always @ (*)
begin
	case (state)
		0: 
			if ( start == 1 )
				next_state = 1;
			else next_state = 0;		//retain state
		
		1: 
			next_state = 2;
		
		default: next_state = 0;
	endcase
end


always @ (posedge clk)
begin
	mutant_pop <= next_mutant_pop;
	state <= next_state;
end
endmodule
