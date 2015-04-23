`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:42:47 03/19/2015 
// Design Name: 
// Module Name:    PulserModule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PulserModule(
    input clk,
	 input in,
	 
    output out
    );
	 
reg [2:0] state;
reg [2:0] next_state;

// output high only when the state is 1
assign out = ( state == 1 | state == 2 );

// initially start in the 0 state
initial
begin
	state = 0;
end

// state transition logic
always @ ( * )
begin
	case( state )
		0: next_state = in ? 1:0;
		1: next_state = 2;
		2: next_state = 3;
		3: next_state = in ? 3:0;
	default: next_state = 0;
	endcase
end

always @ ( posedge clk )
begin
	state <= next_state;
end

endmodule
