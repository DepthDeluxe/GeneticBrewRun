`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:09 03/19/2015 
// Design Name: 
// Module Name:    ReceiverModule 
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
module ReceiverModule(
    input udata,
    input clk,
	 output debug_busy,
    output [7:0] out_data
    );

reg [7:0] shift_register;
reg [7:0] next_shift_register;

reg [3:0] counter;
reg [3:0] next_counter;

reg [12:0] downclk_counter;
reg [12:0] next_downclk_counter;

wire busy;

assign busy = ( counter != 0 );
assign out_data = shift_register;

initial
begin
	shift_register = 0;
	counter = 0;
	downclk_counter = 0;
end

always @ ( * )
begin

	// Load data into shift register
	// if we are busy and at appropriate sampling point, shift 
	if ( downclk_counter == 0 )
	begin
		if (busy && counter <= 9)
		begin
			next_shift_register[6:0] = shift_register[7:1];
			next_shift_register[7] = udata;
			
		end
		else
			next_shift_register = shift_register;		// hold state
		
		//counter block
		if ( ~udata && ~busy )
			next_counter = 1;
		else if ( busy && counter <= 9 )
			next_counter = counter + 1;
		else
			next_counter = 0;
	end
	else
	begin
		next_shift_register = shift_register;
		next_counter = counter;
	end
	
	// downclk counter block
	if ( downclk_counter < 5209 && busy )
		next_downclk_counter = downclk_counter + 1;
	else
		next_downclk_counter = 0;
end

always @ ( posedge clk )
begin
	shift_register <= next_shift_register;
	counter <= next_counter;
	downclk_counter <= next_downclk_counter;
end

endmodule
