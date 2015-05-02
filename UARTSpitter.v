`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:00 04/30/2015 
// Design Name: 
// Module Name:    Top 
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
module UARTSpitter(
	input clk,
   input [1499:0] sel_population,
	input start,
	output out,
	output reg done
	 );
	 
reg next_done;

reg [1:0] state, next_state;

wire [149:0] raw_answer; assign raw_answer = sel_population[1499:1350];
wire [239:0] answerPackaged;

wire packageAnswer_start; assign packageAnswer_start = ( state == 1 );
wire answerSender_start; assign answerSender_start = ( state == 2 );

Package_answer	packageAnswer (.clk(clk), .answer_in(raw_answer), .answerPackaged(answerPackaged), .done(packageAnswer_done));
SenderModule answerSender (.clk(clk), .in(answerPackaged), .start(answerSender_start), .udata(out), .done(answerSender_done));

initial begin
	done = 0;
	state = 0;
end

always @ ( * )
begin
	case (state)
		0:
			begin
				next_done = done;
				
				if ( start == 1 )
					next_state = 1;
				else
					next_state = state;
			end
		1:
			begin
				next_done = done;
				
				if ( packageAnswer_done == 1 )
					next_state = 2;
				else
					next_state = state;
			end
		2:
			begin
				next_done = done;
			
				if ( answerSender_done == 1 )
					next_state = 3;
				else
					next_state = state;
			
			end
		3:
			begin
				next_done = 1;
				next_state = 0;
			end
	endcase
end

always @ (posedge clk)
begin
	state <= next_state;
	done <= next_done;
end
endmodule
