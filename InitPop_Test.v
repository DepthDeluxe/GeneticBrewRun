`timescale 1ns/10ps
`include "InitPop.v"

module InitPopTest;

reg clk;
reg start;
reg [31:0] prg_seed;
wire [7500:0] population;
wire done;

InitPop uut(
  .clk(clk),
  .start(start),
  .prg_seed(prg_seed),
  .population(population),
  .done(done)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("InitPop.vcd");
  $dumpvars(0, InitPopTest);

  clk = 0;
  start = 0;
  prg_seed = 2682981917;

  // wait for init
  #100;

  start = 1;


  #1000000;
  $finish;
end

endmodule
