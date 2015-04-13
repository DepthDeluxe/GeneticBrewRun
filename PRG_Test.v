`timescale 1ns/10ps
`include "PseudorandomGenerator.v"

module PRGTest;

reg clk;
reg start;
reg [31:0] in_seed;
wire [7:0] value;
wire done;

PseudorandomGenerator uut(
  .clk(clk),
  .start(start),
  .in_seed(in_seed),
  .value(value),
  .done(done)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("PRG.vcd");
  $dumpvars(0, PRGTest);

  clk = 0;
  start = 0;
  in_seed = 2682981917;

  // wait for init
  #100;

  start = 1;
  #20;
  start = 0;
  #100;

  start = 1;
  #20;
  start = 0;
  #100;

  in_seed = 1928682902;
  #10;
  start = 1;
  #20;
  start = 0;
  #100;

  #1000;
  $finish;
end

endmodule
