`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:36 04/23/2015 
// Design Name: 
// Module Name:    Package_answer 
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
    input [1499:0] sel_population,
    output reg [239:0] answer
    );

reg [149:0] final_path; assign final_path = sel_population[1499:1350];

assign answer[239:232] = {3'b0, final_path[149:145]};
assign answer[231:224] = {3'b0, final_path[144:140]};
assign answer[223:216] = {3'b0, final_path[139:135]};
assign answer[215:208] = {3'b0, final_path[134:130]};
assign answer[207:200] = {3'b0, final_path[129:125]};
assign answer[199:192] = {3'b0, final_path[124:120]};
assign answer[191:184] = {3'b0, final_path[119:115]};
assign answer[183:176] = {3'b0, final_path[114:110]};
assign answer[175:168] = {3'b0, final_path[109:105]};
assign answer[167:160] = {3'b0, final_path[104:100]};
assign answer[159:152] = {3'b0, final_path[99:95]};
assign answer[151:144] = {3'b0, final_path[94:90]};
assign answer[143:136] = {3'b0, final_path[89:85]};
assign answer[135:128] = {3'b0, final_path[84:80]};
assign answer[127:120] = {3'b0, final_path[79:75]};
assign answer[119:112] = {3'b0, final_path[74:70]};
assign answer[111:104] = {3'b0, final_path[69:65]};
assign answer[103:96] = {3'b0, final_path[64:60]};
assign answer[95:88] = {3'b0, final_path[59:55]};
assign answer[87:80] = {3'b0, final_path[54:50]};
assign answer[79:72] = {3'b0, final_path[49:45]};
assign answer[71:64] = {3'b0, final_path[44:40]};
assign answer[63:56] = {3'b0, final_path[39:35]};
assign answer[55:48] = {3'b0, final_path[34:30]};
assign answer[47:40] = {3'b0, final_path[29:25]};
assign answer[39:32] = {3'b0, final_path[24:20]};
assign answer[31:24] = {3'b0, final_path[19:15]};
assign answer[23:16] = {3'b0, final_path[14:10]};
assign answer[15:8] = {3'b0, final_path[9:5]};
assign answer[7:0] = {3'b0, final_path[4:0]};

endmodule
