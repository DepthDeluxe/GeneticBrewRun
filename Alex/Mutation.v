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
    input [31:0] prg_seed,
	 input [1499:0] sel_population, //selection is 20%, 10 paths at 150 bits apiece
    output reg [7499:0] mutant_pop, // 50 paths at 150 bits apiece
	 output done
    );

reg [7499:0] next_mutant_pop;
reg [1:0] state, next_state;

//wire [749:0] family[9:0]

//instantiation
/*
iterator iterator0 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1499:1350]), .family(family0));			//first parent
iterator iterator1 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1349:1200]), .family(family1));		//second parent
iterator iterator2 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1199:1150]), .family(family2));		//third parent
iterator iterator3 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1049:900]), .family(family3));			//fourth parent
iterator iterator4 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[899:750]), .family(family4));			//fifth parent
iterator iterator5 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[749:600]), .family(family5));			//sixth parent
iterator iterator6 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[599:450]), .family(family6));			//seventh parent
iterator iterator7 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[449:300]), .family(family7));			//eighth parent
iterator iterator8 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[299:150]), .family(family8));			//ninth parent
iterator iterator9 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[149:0]), .family(family9));				//tenth parent
*/

assign done = ( state == 3 );

initial begin
	mutant_pop = 0; next_mutant_pop = 0;
	state = 0; next_state = 0;
end

always @ (*)
begin
	//assign next_mutant_pop to submodule outputs
	//next_mutant_pop = {family0, family1, family2, family3, family4, family5, family6, family7, family8, family9};
	
	// will just duplicate stuff for now
	next_mutant_pop = {sel_population, sel_population, sel_population, sel_population, sel_population};

	// states
	// 0: waiting state
	// 1: processing state
	// 2: done state
	case ( state )
	0: if ( start )
			next_state = 1;
		else
			next_state = 0;
	1: next_state = 2;
	default: next_state = 0;
	endcase
end


always @ (posedge clk)
begin
	mutant_pop <= next_mutant_pop;
	state <= next_state;
end
endmodule
