module Pulser(
  input clk,
  input in,
  output out
);

reg [1:0] state;
reg [1:0] next_state;

assign out = ( state == 1 );

initial begin
  state = 0;
end

always @ ( * )
begin
  if ( state == 0 )
    if ( in )
      next_state = 1;
    else
      next_state = 0;
  else if ( state == 1 )
    next_state = 2;
  else
    if ( in )
      next_state = 3;
    else
      next_state = 0;
end

always @ ( posedge clk )
begin
  state <= next_state;
end

endmodule
