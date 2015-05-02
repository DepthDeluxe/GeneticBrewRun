module State (
  input clk,
  input start,
  input [1874:0] in_pop,
  input [1874:0] mut_pop,
  input in_done,
  input sel_done,
  input mut_done,
  output [1874:0] population,
  output in_start,
  output sel_start,
  output mut_start,
  output uart_transmit,
  output [1:0] state_out
);

reg [1:0] state; assign state_out = state;
reg [1:0] next_state;

reg [15:0] num_generations;
reg [15:0] next_num_generations;

// the population will be from the initial population module when
// we haven't processed any generations
assign population = (num_generations == 0) ? in_pop : mut_pop;

// assign the starts to be corresponding to states
assign in_start = ( state == 1 );
assign sel_start = ( state == 2 );
assign mut_start = ( state == 3 );
assign uart_transmit = ( state == 0 && num_generations != 0 );

initial begin
  state = 0; next_state = 0;
  num_generations = 0; next_num_generations = 0;
end

always @ ( * )
begin
	// states
	// 0: waiting to start, hold
	// 1: initializing population
	// 2: selecting population
	// 3: mutating population
  case ( state )
	 0: begin
			if ( start )
			begin
				next_state = 1;
				next_num_generations = 0;
			end
			else
			begin
				next_state = 0;
				next_num_generations = num_generations;
			end
		end
    
	 // start the inital population
    1: begin
			if ( in_done )
				next_state = 2;
			else
				next_state = 1;

			next_num_generations = 0;
		 end

    // selection phase
    2: begin
			if ( sel_done )
				next_state = 3;
			else
				next_state = 2;

			next_num_generations = num_generations;
		 end

    // mutation time!
    3: begin
			if ( mut_done )
			  if ( num_generations > 10 ) //30000 )
			  begin
				 next_state = 0;
				 next_num_generations = num_generations;
			  end
			  else
			  begin
				 next_state = 2;
				 next_num_generations = num_generations + 1;
			  end
			else
			begin
			  next_state = 3;
			  next_num_generations = num_generations;
			end
		end
  endcase
end

always @ ( posedge clk )
begin
  state <= next_state;
  num_generations <= next_num_generations;
end

endmodule
