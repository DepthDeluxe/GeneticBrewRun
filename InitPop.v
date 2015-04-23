`include "PseudorandomGenerator.v"

module InitPop(
  input clk,
  input start,
  input [31:0] prg_seed,
  output reg [7500:0] population,
  output done
);

reg [7500:0] next_population;

reg [1:0] state;
reg [1:0] next_state;

reg [9:0] counter;
reg [9:0] next_counter;

wire prg_start; assign prg_start = ( state == 1 );
wire [7:0] prg_val;
wire prg_done;
PseudorandomGenerator prg(
  .clk(clk),
  .start(prg_start),
  .in_seed(prg_seed),
  .value(prg_val),
  .done(prg_done)
);

// we are done when we are in state 3
assign done = ( state == 3 );

initial begin
  state = 0;
  counter = 0;
  population = 0;
end

// for the population sel
wire pop_sel_lo;
assign pop_sel_lo = counter << 3;

always @ ( * )
begin
  // cases:
  // 0: idle state, wait for start
  // 1: waiting for PRG
  // 2: PRG done, write next couple of bytes
  // 3: done
  case ( state )
  0:
  begin
    if ( start )
      next_state = 1;
    else
      next_state = 0;

    next_counter = 0;
    next_population = 0;
  end
  1:
  begin
    if ( prg_done )
      next_state = 2;
    else
      next_state = 1;

    next_counter = counter;
    next_population = population;
  end
  2:
  begin
    if ( counter < 938 )
    begin
      next_state = 1;
      next_counter = counter + 1;

      // set the population at the index
      next_population = population << 8 | prg_val;
    end
    else
    begin
      next_state = 3;
      next_counter = counter + 1;

      // only write half the PRG value since we are at the end
      next_population = population << 8 | prg_val;
    end
  end
  3:
  begin
    next_state = 0;
    next_counter = 0;
    next_population = population;
  end
  endcase
end

always @ ( posedge clk )
begin
  population <= next_population;
  state <= next_state;
  counter <= next_counter;
end

endmodule
