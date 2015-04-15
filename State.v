module State (
  input clk,
  input [7500:0] in_pop,
  input [7500:0] mut_pop,
  input in_done,
  input sel_done,
  input mut_done,
  output [7500:0] population,
  output in_start,
  output sel_start,
  output mut_start
);

reg [1:0] state;
reg [1:0] next_state;

reg [15:0] num_generations;
reg [15:0] next_num_generations;

// the population will be from the initial population module when
// we haven't processed any generations
assign population = (num_generations == 0) ? in_pop : mut_pop;

// assign the starts to be corresponding to states
assign in_start = ( state == 0 );
assign sel_start = ( state == 1 );
assign mut_start = ( state == 2 );

initial begin
  state = 0;
  num_generations = 0;
end

always @ ( * )
begin
  case ( state )
    // start the inital population
    0: begin
      if ( in_done )
        next_state = 1;
      else
        next_state = 0;

      next_num_generations = 0;
    end

    // selection phase
    1: begin
      if ( sel_done )
        next_state = 2;
      else
        next_state = 1;

      next_num_generations = num_generations;
    end

    // mutation time!
    2: begin
      if ( mut_done )
        if ( num_generations > 30000 )
        begin
          next_state = 3;
          next_num_generations = num_generations + 1;
        end
        else
        begin
          next_state = 1;
          next_num_generations = num_generations;
        end
      else
      begin
        next_state = 2;
        next_num_generations = num_generations;
      end

    end

    // final state: hold
    3: begin
      next_state = 3;
      next_num_generations = num_generations;
    end
  endcase
end

always @ ( posedge clk )
begin
  state <= next_state;
  num_generations <= next_num_generations;
end

endmodule
