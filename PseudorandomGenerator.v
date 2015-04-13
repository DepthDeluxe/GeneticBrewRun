`include "LFSR.v"
module PseudorandomGenerator(
  input clk,
  input start,
  input [31:0] in_seed,
  output reg [7:0] value,
  output done
);

reg [7:0] next_value;

reg [3:0] counter;
reg [3:0] next_counter;

// declare the LFSR
reg set;
reg next_set;
wire lfsr_out;
reg [31:0] prev_seed;
reg [31:0] next_prev_seed;
LFSR lfsr_mod(
  .clk(clk),
  .set(set),
  .set_value(in_seed),    // hard-code the LFSR seed for a while
  .out(lfsr_out)
);

assign done = counter == 8;

initial
begin
  value = 0;
  counter = 0;

  set = 0;
  prev_seed = 0;
end

always @ ( * )
begin
  // if we are in inactive state and request to start,
  // hold value and increment counter
  //
  // if we are currently active, then clock in the LFSR
  //
  // otherwise, next_counter and next_value should be 0
  if ( counter == 0 && start )
  begin
    next_counter = 1;
    next_value = 0;

    // set the new seed
    next_prev_seed = in_seed;
    next_set = prev_seed != next_prev_seed;
  end
  else if ( counter > 0 && counter < 8 )
  begin
    next_counter = counter + 1;

    // set the next_value at proper location
    next_value = value << 1 | lfsr_out;

    next_prev_seed = prev_seed;
    next_set = 0;
  end
  else
  begin
    next_counter = 0;
    next_value = value;

    next_prev_seed = prev_seed;
    next_set = 0;
  end
end

always @ ( posedge clk )
begin
  value <= next_value;
  counter <= next_counter;
  prev_seed <= next_prev_seed;
  set <= next_set;
end

endmodule
