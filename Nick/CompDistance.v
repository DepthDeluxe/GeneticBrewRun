`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:46 04/08/2015 
// Design Name: 
// Module Name:    compDistance 
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
module compDistance(
    input [149:0] in,
    output [11:0] out
    );
	
	wire [9:0] outp [28:0];
	
	getDistance dis0 (.value1(in[4: 0]), .value2(in[9: 5]), .dist(outp[0]));
	getDistance dis1 (.value1(in[9: 5]), .value2(in[14: 10]), .dist(outp[1]));
	getDistance dis2 (.value1(in[14: 10]), .value2(in[19: 15]), .dist(outp[2]));
	getDistance dis3 (.value1(in[19: 15]), .value2(in[24: 20]), .dist(outp[3]));
	getDistance dis4 (.value1(in[24: 20]), .value2(in[29: 25]), .dist(outp[4]));
	getDistance dis5 (.value1(in[29: 25]), .value2(in[34: 30]), .dist(outp[5]));
	getDistance dis6 (.value1(in[34: 30]), .value2(in[39: 35]), .dist(outp[6]));
	getDistance dis7 (.value1(in[39: 35]), .value2(in[44: 40]), .dist(outp[7]));
	getDistance dis8 (.value1(in[44: 40]), .value2(in[49: 45]), .dist(outp[8]));
	getDistance dis9 (.value1(in[49: 45]), .value2(in[54: 50]), .dist(outp[9]));
	getDistance dis10 (.value1(in[54: 50]), .value2(in[59: 55]), .dist(outp[10]));
	getDistance dis11 (.value1(in[59: 55]), .value2(in[64: 60]), .dist(outp[11]));
	getDistance dis12 (.value1(in[64: 60]), .value2(in[69: 65]), .dist(outp[12]));
	getDistance dis13 (.value1(in[69: 65]), .value2(in[74: 70]), .dist(outp[13]));
	getDistance dis14 (.value1(in[74: 70]), .value2(in[79: 75]), .dist(outp[14]));
	getDistance dis15 (.value1(in[79: 75]), .value2(in[84: 80]), .dist(outp[15]));
	getDistance dis16 (.value1(in[84: 80]), .value2(in[89: 85]), .dist(outp[16]));
	getDistance dis17 (.value1(in[89: 85]), .value2(in[94: 90]), .dist(outp[17]));
	getDistance dis18 (.value1(in[94: 90]), .value2(in[99: 95]), .dist(outp[18]));
	getDistance dis19 (.value1(in[99: 95]), .value2(in[104: 100]), .dist(outp[19]));
	getDistance dis20 (.value1(in[104: 100]), .value2(in[109: 105]), .dist(outp[20]));
	getDistance dis21 (.value1(in[109: 105]), .value2(in[114: 110]), .dist(outp[21]));
	getDistance dis22 (.value1(in[114: 110]), .value2(in[119: 115]), .dist(outp[22]));
	getDistance dis23 (.value1(in[119: 115]), .value2(in[124: 120]), .dist(outp[23]));
	getDistance dis24 (.value1(in[124: 120]), .value2(in[129: 125]), .dist(outp[24]));
	getDistance dis25 (.value1(in[129: 125]), .value2(in[134: 130]), .dist(outp[25]));
	getDistance dis26 (.value1(in[134: 130]), .value2(in[139: 135]), .dist(outp[26]));
	getDistance dis27 (.value1(in[139: 135]), .value2(in[144: 140]), .dist(outp[27]));
	getDistance dis28 (.value1(in[144: 140]), .value2(in[149: 145]), .dist(outp[28]));

	assign out = outp[0] + outp[1] + outp[2] + outp[3] + outp[4] + outp[5] + outp[6] + outp[7] + outp[8] + outp[9] + outp[10] + outp[11] + outp[12] + outp[13] + outp[14] + outp[15] + outp[16] + outp[17] + outp[18] + outp[19] + outp[20] + outp[21] + outp[22] + outp[23] + outp[24] + outp[25] + outp[26] + outp[27] + outp[28];

endmodule
