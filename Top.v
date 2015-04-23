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

// sub lines
wire sel_start;
wire mut_start;
wire sel_done; assign sel_done = 0;
wire mut_done; assign mut_done = 0;

wire button_p;
Pulser button_pulser_module(
	.clk(clk),
	.in(button),
	.out(button_p)
);
	
wire init_pop_start;
wire [7500:0] init_population;
wire init_pop_done;
InitPop init_pop_module(
  .clk(clk),
  .start(init_pop_start),
  .prg_seed(counter),
  .population(init_population),
  .done(init_pop_done)
);

wire [7500:0] mut_population;
wire [7500:0] population;
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
