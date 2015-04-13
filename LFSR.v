module LFSR(
  input clk,
  input [31:0] set_value,
  input set,
  output out
);

reg [31:0] sr;
reg [31:0] next_sr;

// the output is the last bit of the shift register
assign out = sr[31];

initial
begin
  sr = 0;
end

always @ ( * )
begin
  // if set bit high, set the sr to the set_value,
  // otherwise it is a combination of other bits
  if ( set )
    next_sr = set_value;
  else
  begin
    next_sr[31:1] = sr[30:0];
    next_sr[0] = sr[31] ^ sr[21] ^ sr[1] ^ sr[0] ^ 1;
  end
end

always @ ( posedge clk )
begin
  sr <= next_sr;
end


endmodule
