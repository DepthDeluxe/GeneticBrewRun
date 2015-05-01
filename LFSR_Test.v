module LFSRTest;

reg clk;
reg [31:0] set_value;
reg set;

wire out;

LFSR uut(
  .clk(clk),
  .set_value(set_value),
  .set(set)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("LFSR.vcd");
  $dumpvars(0, LFSRTest);

  clk = 0;
  set_value = 47;
  set = 1;

  #100
  set = 0;
  #100
  set_value = 17931672013;
  #100
  set = 1;
  #10
  set = 0;
  #1000

  $finish;
end

endmodule
