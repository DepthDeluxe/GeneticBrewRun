`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:00 03/19/2015 
// Design Name: 
// Module Name:    SenderModule 
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
module SenderModule(
    input clk,
	 
    input [7:0] in,
    input transmit,
    
	 output udata,
    output busy
    );
	 
reg [9:0] shift_register;
reg [9:0] next_shift_register;

reg [3:0] counter;
reg [3:0] next_counter;

reg [12:0] downclk_counter;
reg [12:0] next_downclk_counter;

// output of the transmit Pulser module
wire transmit_p;

// we are busy if the counter is not at the beginning
assign busy = (counter != 0);

// udata is just the top of the shift_register
assign udata = shift_register[0];

PulserModule transmit_pulser_mod(
	.clk(clk),
	.in(transmit),
	.out(transmit_p)
	);

// assign initial state for the shift register
initial
begin
	counter = 0;						// helps determine when to transmit next bit

	shift_register[0] = 1;			// constant high bit / stop bit
	shift_register[1] = 0;			// start bit
	
	shift_register[9:2] = 0;		// data (when not shifting)

	downclk_counter = 0;				// adjusts for transmission at 9600 baud
end

always @ ( * )
begin
	// counter block (counter determines busy)
	// if we request to transmit or are busy, then increment counter
	// if counter is currently 8 then that is the last transmission and set to 0
	if ( downclk_counter == 0 )
	begin
		if ( transmit_p | busy )
		begin
			if ( counter < 10 )
				next_counter = counter + 1;
			else
				next_counter = 0;
		end
		else
			next_counter = 0;
	end
	else
		next_counter = counter;
		
	// shift register block
	// set shift_register to "in" if we are not actively transmitting
	// assign the next shift register only if we are busy and the downclk counter
	// is zero.  This makes sure we send at 9600 baud
	if ( busy == 0 )
	begin
		next_shift_register[9:2] = in;
		next_shift_register[1:0] = shift_register[1:0];
	end else
	begin
		// only shift the shift register when the downclock counter has rolled over
		if ( downclk_counter == 0 )
		begin
			next_shift_register[8:0] = shift_register[9:1];
			next_shift_register[9] = shift_register[0];
		end
		// else hold state
		else
			next_shift_register = shift_register;
	end

	// downclck counter block
	// increment the downclock counter if we are less than the
	// max and are busy (50mil clk / 9600 baud = 5208.3)
	if ( downclk_counter < 5209 & busy )
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
