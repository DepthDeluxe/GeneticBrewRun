`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:11 04/30/2015 
// Design Name: 
// Module Name:    Package_Answer 
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
module Package_answer(
	 input clk,
    input [149:0] answer_in,
    output wire [239:0] answerPackaged,
	 output reg done
	 );

initial begin
	done = 0;
end

assign answerPackaged[239:232] = {3'b0, answer_in[149:145]};
assign answerPackaged[231:224] = {3'b0, answer_in[144:140]};
assign answerPackaged[223:216] = {3'b0, answer_in[139:135]};
assign answerPackaged[215:208] = {3'b0, answer_in[134:130]};
assign answerPackaged[207:200] = {3'b0, answer_in[129:125]};
assign answerPackaged[199:192] = {3'b0, answer_in[124:120]};
assign answerPackaged[191:184] = {3'b0, answer_in[119:115]};
assign answerPackaged[183:176] = {3'b0, answer_in[114:110]};
assign answerPackaged[175:168] = {3'b0, answer_in[109:105]};
assign answerPackaged[167:160] = {3'b0, answer_in[104:100]};
assign answerPackaged[159:152] = {3'b0, answer_in[99:95]};
assign answerPackaged[151:144] = {3'b0, answer_in[94:90]};
assign answerPackaged[143:136] = {3'b0, answer_in[89:85]};
assign answerPackaged[135:128] = {3'b0, answer_in[84:80]};
assign answerPackaged[127:120] = {3'b0, answer_in[79:75]};
assign answerPackaged[119:112] = {3'b0, answer_in[74:70]};
assign answerPackaged[111:104] = {3'b0, answer_in[69:65]};
assign answerPackaged[103:96] = {3'b0, answer_in[64:60]};
assign answerPackaged[95:88] = {3'b0, answer_in[59:55]};
assign answerPackaged[87:80] = {3'b0, answer_in[54:50]};
assign answerPackaged[79:72] = {3'b0, answer_in[49:45]};
assign answerPackaged[71:64] = {3'b0, answer_in[44:40]};
assign answerPackaged[63:56] = {3'b0, answer_in[39:35]};
assign answerPackaged[55:48] = {3'b0, answer_in[34:30]};
assign answerPackaged[47:40] = {3'b0, answer_in[29:25]};
assign answerPackaged[39:32] = {3'b0, answer_in[24:20]};
assign answerPackaged[31:24] = {3'b0, answer_in[19:15]};
assign answerPackaged[23:16] = {3'b0, answer_in[14:10]};
assign answerPackaged[15:8] = {3'b0, answer_in[9:5]};
assign answerPackaged[7:0] = {3'b0, answer_in[4:0]};

always @ ( posedge clk )
begin
	done = 1;
end

endmodule	