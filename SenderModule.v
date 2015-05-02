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
	 
    input [239:0] in,
    input start,
    
	 output udata,
	 output reg done
    );
	 
reg next_done;
	 
reg [1:0] state;
reg [1:0] next_state;
	 
reg [9:0] shift_register;
reg [9:0] next_shift_register;

reg [3:0] counter;				//counter for 10 bits
reg [3:0] next_counter;

reg [12:0] downclk_counter;	//counter to reach 9600 baud
reg [12:0] next_downclk_counter;

reg [4:0] item_counter;			// marks current gene (30) 
reg [4:0] next_item_counter;

reg [7:0] current_item;			// is current gene (8 bits)
reg [7:0] next_current_item;
wire [0:7] flipped; assign flipped = current_item;

// we are busy if the counter is not at the beginning
wire busy; assign busy = (counter != 0);

// udata is just the top of the shift_register
assign udata = shift_register[0];

// assign initial state for the shift register
initial
begin
	state = 0;
	
	counter = 0;						// helps determine when to transmit next bit

	shift_register[0] = 1;			// constant high bit / stop bit
	shift_register[1] = 0;			// start bit
	
	shift_register[9:2] = 0;		// data (when not shifting)

	downclk_counter = 0;				// adjusts for transmission at 9600 baud

	item_counter = 0;
	current_item = 8'b11111111;
	
	done = 0;
end

always @ ( * )
begin
	case (state)
		0:		//wait to start
			begin
				next_counter = counter;
				next_downclk_counter = downclk_counter;
				next_shift_register = shift_register;
				next_item_counter = item_counter;
				next_current_item = current_item;
				next_done = 0;
				
				if ( start )
					next_state = 1;
				else
					next_state = state;
			end
		1:		//set next gene
			begin
				next_counter = counter;
				next_downclk_counter = downclk_counter;
				
				if ( item_counter < 30 )
				begin
				next_current_item = {
					in[item_counter*8], 
					in[item_counter*8+1], 
					in[item_counter*8+2], 
					in[item_counter*8+3], 
					in[item_counter*8+4], 
					in[item_counter*8+5], 
					in[item_counter*8+6], 
					in[item_counter*8+7]};
					

					next_state = 2;
					next_item_counter = item_counter + 1;
					next_shift_register = shift_register;
					next_done = done;
				end else begin
					next_current_item = 8'b0;
					next_item_counter = 0;
					next_state = 0;
					next_shift_register = 10'b0000000001;
					next_done = 1;
				end
			end
		2:		//send current item
			begin
				next_item_counter = item_counter; 	//retain item_counter
				next_current_item = current_item;
				next_downclk_counter = downclk_counter;
				next_done = done;

				// counter block (counter determines busy)
				// if we request to transmit or are busy, then increment counter
				// if counter is currently 8 then that is the last transmission and set to 0
				if ( counter < 10 )				//if downclk is ready for next bit (works)
				begin
					next_counter = counter + 1;	//move to next bit
					next_state = 3;					//move to downclk state
				end else begin							//else we are done with gene
					next_counter = 0;					//reset to first bit
					next_state = 1;					//return to state 1 to select next gene
				end
			
				// shift register block
				// set shift_register to "in" if we are not actively transmitting
				// assign the next shift register only if we are busy and the downclk counter
				// is zero.  This makes sure we send at 9600 baud
				if ( busy == 0 )
				begin
					next_shift_register[9:2] = flipped;
					next_shift_register[1:0] = shift_register[1:0];
				end else begin
					next_shift_register[8:0] = shift_register[9:1];
					next_shift_register[9] = shift_register[0];
				end
			end
		
		3:
			begin
				next_counter = counter;
				next_shift_register = shift_register;
				next_item_counter = item_counter;
				next_current_item = current_item;
				next_done = done;
				
				// downclck counter block
				// increment the downclock counter if we are less than the
				// max and are busy (50mil clk / 9600 baud = 5208.3)
				if ( downclk_counter < 5209 )
				begin
					next_downclk_counter = downclk_counter + 1;
					next_state = state;
				end else begin
					next_downclk_counter = 0;
					next_state = 2;
				end
			end
		
		default:
			begin
				next_current_item = 8'b11111111;
			end
		endcase
end

always @ ( posedge clk )
begin
	counter <= next_counter;
	downclk_counter <= next_downclk_counter;
	shift_register <= next_shift_register;
	state <= next_state;
	item_counter <= next_item_counter;
	current_item <= next_current_item;
	done <= next_done;
end
endmodule
