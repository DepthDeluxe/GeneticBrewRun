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
	 output reg done
    );

reg next_mutant_pop;

wire family0;
wire family1;
wire family2;
wire family3;
wire family4;
wire family5;
wire family6;
wire family7;
wire family8;
wire family9;

initial begin
	mutant_pop = 7500'b0;
	
	done = 0;
end

//instantiation
iterator iterator0 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1499:1350]), .family(family0));			//first parent
//iterator iterator1 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1349:1200]), .family(family1));		//second parent
//iterator iterator2 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1199:1150]), .family(family2));		//third parent
//iterator iterator3 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[1049:900]), .family(family3));			//fourth parent
//iterator iterator4 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[899:750]), .family(family4));			//fifth parent
//iterator iterator5 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[749:600]), .family(family5));			//sixth parent
//iterator iterator6 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[599:450]), .family(family6));			//seventh parent
//iterator iterator7 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[449:300]), .family(family7));			//eighth parent
//iterator iterator8 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[299:150]), .family(family8));			//ninth parent
//iterator iterator9 (.clk(clk), .prg_seed(prg_seed), .parent(sel_population[149:0]), .family(family9));				//tenth parent


//6000,5850,5700,5550,5400,5250,5100,4950,4800,4650,4500,4350,4200,4050,3900,3750,3600,3450,3300,3150,3000,2850,2700,2550,2400,2250,2100,1950,1800,1650,1500,1350,1200,1050,900,750,600,450,300,150)

always @ (*)
begin
	//assign next_mutant_pop to submodule outputs
	next_mutant_pop = {family0, family1, family2, family3, family4, family5, family6, family7, family8, family9};

end


always @ (posedge clk)
begin
	//mutant_pop[7499:6000] = next_mutant_pop[7499:6000];
	mutant_pop <= next_mutant_pop;
	//terminate
	//done = 1;
end
endmodule
