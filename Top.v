`timescale 1ns / 1ps
`include "InitPop.v"
`include "State.v"
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
    output done
    );

reg [31:0] counter;
reg [31:0] next_counter;

// start lines
wire sel_start;
wire mut_start;
wire init_pop_start;

// done lines
wire init_pop_done;
wire sel_done; assign sel_done = 0;
wire mut_done;

// population lines
wire [7499:0] init_population;			// population output from InitPop
wire [7499:0] population;					// population at each state
wire [1499:0] sel_population; assign sel_population = population[1499:0];				// population that is selected
wire [7499:0] mut_population;				// population to be mutated

wire button_p;
PulserModule button_pulser_module(
	.clk(clk),
	.in(button),
	.out(button_p)
);

// Population initializer, runs once
InitPop init_pop_module(
  .clk(clk),
  .start(init_pop_start),
  .prg_seed(counter),
  .population(init_population),
  .done(init_pop_done)
);

// Selection module, first thing to run at each iteration
// DADAA

// Mutation module, runs after selection module
mutation mutation_module(
    .clk(clk),
	 .start(mut_start),
	 .sel_population(sel_population), //selection is 20%, 10 paths at 150 bits apiece
    .prg_seed(counter),
    .mutant_pop(mut_population), // 50 paths at 150 bits apiece
	 .done(mut_donee)
);

// State module, holds the state and controls flow of the system
State state_module(
  .clk(clk),
  .in_pop(init_population),
  .mut_pop(mut_population),
  .in_done(init_pop_done),
  .sel_done(sel_done),
  .mut_done(mut_done),
  .population(population),
  .in_start(init_pop_start),
  .sel_start(sel_start),
  .mut_start(mut_start)
);

wire [0:7] uart_data_to_send;
wire uart_transmit; assign uart_transmit = 0;
wire uart_in;
wire uart_out;
wire [7:0] uart_data; assign uart_data = 0;
UARTModule uart_module(
	 .clk(clk),
	 .data_to_send(uart_data_to_send),
    .transmit(transmit),
	 .in(uart_in),
	 .out(uart_out),
	 .LED_magic(uart_data)
);


initial begin
	counter = 0;
end

always @ ( * )
begin
	next_counter = counter + 1;
end

always @ ( posedge clk )
begin
	counter <= next_counter;
end

endmodule
