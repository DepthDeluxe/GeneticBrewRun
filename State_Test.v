`timescale 1ns/10ps
`include "State.v"

module StateTest;

reg clk;
reg [7500:0] in_pop;
reg [7500:0] mut_pop;
reg in_done;
reg sel_done;
reg mut_done;

wire [7500:0] population;
wire in_start;
wire sel_start;
wire mut_start;

State uut(
  .clk(clk),
  .in_pop(in_pop),
  .mut_pop(mut_pop),
  .in_done(in_done),
  .sel_done(sel_done),
  .mut_done(mut_done),
  .population(population),
  .in_start(in_start),
  .sel_start(sel_start),
  .mut_start(mut_start)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("State.vcd");
  $dumpvars(0, StateTest);

  clk = 0;
  in_pop = 0;
  mut_pop = 1;
  in_done = 0;
  sel_done = 0;
  mut_done = 0;

  // wait for init
  #100;

  in_done = 1;
  #100;
  in_done = 0;
  #100;
  sel_done = 1;
  #100;
  sel_done = 0;
  #100;
  mut_done = 1;
  #100;
  mut_done = 0;
  #100;
  sel_done = 1;
  #100;
  sel_done = 0;
  #100;
  mut_done = 1;
  #100;
  mut_done = 0;
  #100;
  sel_done = 1;
  #100;
  sel_done = 0;
  #100;
  mut_done = 1;
  #100;
  mut_done = 0;
  #100;

  #1000;
  $finish;
end

endmodule
