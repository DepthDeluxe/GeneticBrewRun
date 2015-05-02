`timescale 1ns / 1ps

`include "InitPop.v"
`include "Alex/Iterator.v"
`include "LFSR.v"
`include "Alex/Mutation.v"
`include "PseudorandomGenerator.v"
`include "State.v"
`include "Alex/Swap.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:22 04/22/2015 
// Design Name: 
// Module Name:    Top 
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
module Top(
	 input clk,
    input button,
    output light,
	 output uart_out
    );

// start lines
wire sel_start;
wire mut_start;
wire init_pop_start;

// UART stuff (will properly reconnect later)
//wire uart_transmit;
assign uart_out = 0;

// done lines
wire init_pop_done;
wire sel_done;
wire mut_done;

// population lines
wire [1874:0] init_population;			// population output from InitPop
wire [1874:0] population;					// population at each state
wire [374:0] sel_population;
wire [1874:0] mut_population;				// population to be mutated

wire button_p;
Pulser button_pulser_module(
	.clk(clk),
	.in(button),
	.out(button_p)
);

// Population initializer, runs once
InitPop init_pop_module(
  .clk(clk),
  .start(init_pop_start),
  .prg_seed(-230667),
  .population(init_population),
  .done(init_pop_done)
);

// Selection module, first thing to run at each iteration
Selection selection_module (
	.clk(clk),
	.start(sel_start),
	.pop(population),
	.sel_pop(sel_population),
	.done(sel_done)
);

// Mutation module, runs after selection module
Mutation mutation_module(
    .clk(clk),
	 .start(mut_start),
	 .sel_population(sel_population), //selection is 20%, 10 paths at 150 bits apiece
    .prg_seed(-3829076),
    .mutant_pop(mut_population), // 50 paths at 150 bits apiece
	 .done(mut_done)
);

// State module, holds the state and controls flow of the system
wire [1:0] state_out; assign light = (state_out == 0);
State state_module(
  .clk(clk),
  .start(button_p),
  .in_pop(init_population),
  .mut_pop(mut_population),
  .in_done(init_pop_done),
  .sel_done(sel_done),
  .mut_done(mut_done),
  .population(population),
  .in_start(init_pop_start),
  .sel_start(sel_start),
  .mut_start(mut_start),
  .uart_transmit(uart_transmit),
  .state_out(state_out)
);

/*
wire [0:7] uart_data_to_send;
wire [7:0] uart_data; assign uart_data = 0;
UARTModule uart_module(
	 .clk(clk),
	 .data_to_send(uart_data_to_send),
    .transmit(transmit),
	 .LED_magic(uart_data)
);
*/

endmodule
