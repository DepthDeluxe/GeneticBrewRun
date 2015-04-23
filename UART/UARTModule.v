`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:17 03/20/2015 
// Design Name: 
// Module Name:    System 
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
module UARTModule(
	 input clk,

	 input [0:7] data_to_send,
    input transmit,
	 input in,
	 
	 output out,

	 output [7:0] LED_magic
    );

wire busy;

SenderModule sender_mod(
	 .clk(clk),
	 .in(data_to_send),
	 .transmit(transmit),
	 .udata(out),
	 .busy(busy)
	 );
	 
ReceiverModule receiver_mod(
	.clk(clk),
	.udata(in),
	.out_data(LED_magic)
	);

endmodule
