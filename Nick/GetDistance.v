`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:20 04/22/2015 
// Design Name: 
// Module Name:    getDistance 
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
module getDistance(
    input [4:0] value1,
    input [4:0] value2,
    output reg [9:0] dist
    );
	
	wire [9:0] inp;

	assign inp = value1 < value2 ? ( value1 << 5 ) | value2 : ( value2 << 5 ) | value1;

	
	
	always @ *
	begin
		case(inp)
			10'b0000000001: dist = 9;
			  10'b0000000010: dist = 12;
			  10'b0000000011: dist = 23;
			  10'b0000000100: dist = 22;
			  10'b0000000101: dist = 33;
			  10'b0000000110: dist = 22;
			  10'b0000000111: dist = 33;
			  10'b0000001000: dist = 43;
			  10'b0000001001: dist = 47;
			  10'b0000001010: dist = 95;
			  10'b0000001011: dist = 47;
			  10'b0000001100: dist = 97;
			  10'b0000001101: dist = 95;
			  10'b0000001110: dist = 45;
			  10'b0000001111: dist = 91;
			  10'b0000010000: dist = 169;
			  10'b0000010001: dist = 66;
			  10'b0000010010: dist = 62;
			  10'b0000010011: dist = 71;
			  10'b0000010100: dist = 72;
			  10'b0000010101: dist = 85;
			  10'b0000010110: dist = 136;
			  10'b0000010111: dist = 116;
			  10'b0000011000: dist = 168;
			  10'b0000011001: dist = 178;
			  10'b0000011010: dist = 100;
			  10'b0000011011: dist = 65;
			  10'b0000011100: dist = 156;
			  10'b0000011101: dist = 68;
			  10'b0000100010: dist = 11;
			  10'b0000100011: dist = 13;
			  10'b0000100100: dist = 19;
			  10'b0000100101: dist = 23;
			  10'b0000100110: dist = 31;
			  10'b0000100111: dist = 23;
			  10'b0000101000: dist = 33;
			  10'b0000101001: dist = 40;
			  10'b0000101010: dist = 90;
			  10'b0000101011: dist = 48;
			  10'b0000101100: dist = 88;
			  10'b0000101101: dist = 91;
			  10'b0000101110: dist = 55;
			  10'b0000101111: dist = 81;
			  10'b0000110000: dist = 176;
			  10'b0000110001: dist = 63;
			  10'b0000110010: dist = 62;
			  10'b0000110011: dist = 69;
			  10'b0000110100: dist = 70;
			  10'b0000110101: dist = 92;
			  10'b0000110110: dist = 146;
			  10'b0000110111: dist = 109;
			  10'b0000111000: dist = 176;
			  10'b0000111001: dist = 185;
			  10'b0000111010: dist = 93;
			  10'b0000111011: dist = 55;
			  10'b0000111100: dist = 165;
			  10'b0000111101: dist = 58;
			  10'b0001000011: dist = 17;
			  10'b0001000100: dist = 31;
			  10'b0001000101: dist = 26;
			  10'b0001000110: dist = 32;
			  10'b0001000111: dist = 27;
			  10'b0001001000: dist = 36;
			  10'b0001001001: dist = 35;
			  10'b0001001010: dist = 83;
			  10'b0001001011: dist = 36;
			  10'b0001001100: dist = 86;
			  10'b0001001101: dist = 82;
			  10'b0001001110: dist = 54;
			  10'b0001001111: dist = 82;
			  10'b0001010000: dist = 181;
			  10'b0001010001: dist = 53;
			  10'b0001010010: dist = 51;
			  10'b0001010011: dist = 59;
			  10'b0001010100: dist = 60;
			  10'b0001010101: dist = 98;
			  10'b0001010110: dist = 143;
			  10'b0001010111: dist = 104;
			  10'b0001011000: dist = 180;
			  10'b0001011001: dist = 191;
			  10'b0001011010: dist = 87;
			  10'b0001011011: dist = 59;
			  10'b0001011100: dist = 167;
			  10'b0001011101: dist = 62;
			  10'b0001100100: dist = 27;
			  10'b0001100101: dist = 10;
			  10'b0001100110: dist = 45;
			  10'b0001100111: dist = 10;
			  10'b0001101000: dist = 20;
			  10'b0001101001: dist = 29;
			  10'b0001101010: dist = 80;
			  10'b0001101011: dist = 46;
			  10'b0001101100: dist = 75;
			  10'b0001101101: dist = 82;
			  10'b0001101110: dist = 68;
			  10'b0001101111: dist = 68;
			  10'b0001110000: dist = 189;
			  10'b0001110001: dist = 56;
			  10'b0001110010: dist = 59;
			  10'b0001110011: dist = 64;
			  10'b0001110100: dist = 65;
			  10'b0001110101: dist = 105;
			  10'b0001110110: dist = 159;
			  10'b0001110111: dist = 96;
			  10'b0001111000: dist = 189;
			  10'b0001111001: dist = 197;
			  10'b0001111010: dist = 81;
			  10'b0001111011: dist = 42;
			  10'b0001111100: dist = 179;
			  10'b0001111101: dist = 45;
			  10'b0010000101: dist = 33;
			  10'b0010000110: dist = 34;
			  10'b0010000111: dist = 33;
			  10'b0010001000: dist = 42;
			  10'b0010001001: dist = 57;
			  10'b0010001010: dist = 108;
			  10'b0010001011: dist = 67;
			  10'b0010001100: dist = 100;
			  10'b0010001101: dist = 109;
			  10'b0010001110: dist = 55;
			  10'b0010001111: dist = 88;
			  10'b0010010000: dist = 164;
			  10'b0010010001: dist = 83;
			  10'b0010010010: dist = 82;
			  10'b0010010011: dist = 89;
			  10'b0010010100: dist = 90;
			  10'b0010010101: dist = 81;
			  10'b0010010110: dist = 146;
			  10'b0010010111: dist = 123;
			  10'b0010011000: dist = 165;
			  10'b0010011001: dist = 171;
			  10'b0010011010: dist = 108;
			  10'b0010011011: dist = 59;
			  10'b0010011100: dist = 159;
			  10'b0010011101: dist = 61;
			  10'b0010100110: dist = 55;
			  10'b0010100111: dist = 1;
			  10'b0010101000: dist = 10;
			  10'b0010101001: dist = 25;
			  10'b0010101010: dist = 76;
			  10'b0010101011: dist = 50;
			  10'b0010101100: dist = 67;
			  10'b0010101101: dist = 79;
			  10'b0010101110: dist = 78;
			  10'b0010101111: dist = 58;
			  10'b0010110000: dist = 197;
			  10'b0010110001: dist = 56;
			  10'b0010110010: dist = 61;
			  10'b0010110011: dist = 66;
			  10'b0010110100: dist = 66;
			  10'b0010110101: dist = 114;
			  10'b0010110110: dist = 169;
			  10'b0010110111: dist = 89;
			  10'b0010111000: dist = 198;
			  10'b0010111001: dist = 205;
			  10'b0010111010: dist = 74;
			  10'b0010111011: dist = 32;
			  10'b0010111100: dist = 188;
			  10'b0010111101: dist = 35;
			  10'b0011000111: dist = 55;
			  10'b0011001000: dist = 65;
			  10'b0011001001: dist = 68;
			  10'b0011001010: dist = 114;
			  10'b0011001011: dist = 60;
			  10'b0011001100: dist = 118;
			  10'b0011001101: dist = 111;
			  10'b0011001110: dist = 23;
			  10'b0011001111: dist = 113;
			  10'b0011010000: dist = 149;
			  10'b0011010001: dist = 82;
			  10'b0011010010: dist = 74;
			  10'b0011010011: dist = 84;
			  10'b0011010100: dist = 85;
			  10'b0011010101: dist = 67;
			  10'b0011010110: dist = 114;
			  10'b0011010111: dist = 137;
			  10'b0011011000: dist = 148;
			  10'b0011011001: dist = 160;
			  10'b0011011010: dist = 120;
			  10'b0011011011: dist = 86;
			  10'b0011011100: dist = 135;
			  10'b0011011101: dist = 89;
			  10'b0011101000: dist = 10;
			  10'b0011101001: dist = 26;
			  10'b0011101010: dist = 77;
			  10'b0011101011: dist = 51;
			  10'b0011101100: dist = 67;
			  10'b0011101101: dist = 80;
			  10'b0011101110: dist = 78;
			  10'b0011101111: dist = 57;
			  10'b0011110000: dist = 197;
			  10'b0011110001: dist = 58;
			  10'b0011110010: dist = 63;
			  10'b0011110011: dist = 67;
			  10'b0011110100: dist = 68;
			  10'b0011110101: dist = 113;
			  10'b0011110110: dist = 169;
			  10'b0011110111: dist = 89;
			  10'b0011111000: dist = 198;
			  10'b0011111001: dist = 204;
			  10'b0011111010: dist = 75;
			  10'b0011111011: dist = 32;
			  10'b0011111100: dist = 189;
			  10'b0011111101: dist = 35;
			  10'b0100001001: dist = 25;
			  10'b0100001010: dist = 73;
			  10'b0100001011: dist = 56;
			  10'b0100001100: dist = 59;
			  10'b0100001101: dist = 77;
			  10'b0100001110: dist = 88;
			  10'b0100001111: dist = 48;
			  10'b0100010000: dist = 206;
			  10'b0100010001: dist = 58;
			  10'b0100010010: dist = 66;
			  10'b0100010011: dist = 69;
			  10'b0100010100: dist = 69;
			  10'b0100010101: dist = 123;
			  10'b0100010110: dist = 179;
			  10'b0100010111: dist = 82;
			  10'b0100011000: dist = 207;
			  10'b0100011001: dist = 213;
			  10'b0100011010: dist = 68;
			  10'b0100011011: dist = 22;
			  10'b0100011100: dist = 198;
			  10'b0100011101: dist = 25;
			  10'b0100101010: dist = 51;
			  10'b0100101011: dist = 35;
			  10'b0100101100: dist = 50;
			  10'b0100101101: dist = 53;
			  10'b0100101110: dist = 90;
			  10'b0100101111: dist = 52;
			  10'b0100110000: dist = 216;
			  10'b0100110001: dist = 33;
			  10'b0100110010: dist = 42;
			  10'b0100110011: dist = 44;
			  10'b0100110100: dist = 44;
			  10'b0100110101: dist = 133;
			  10'b0100110110: dist = 176;
			  10'b0100110111: dist = 68;
			  10'b0100111000: dist = 216;
			  10'b0100111001: dist = 225;
			  10'b0100111010: dist = 52;
			  10'b0100111011: dist = 41;
			  10'b0100111100: dist = 203;
			  10'b0100111101: dist = 44;
			  10'b0101001011: dist = 58;
			  10'b0101001100: dist = 41;
			  10'b0101001101: dist = 11;
			  10'b0101001110: dist = 132;
			  10'b0101001111: dist = 64;
			  10'b0101010000: dist = 263;
			  10'b0101010001: dist = 35;
			  10'b0101010010: dist = 50;
			  10'b0101010011: dist = 41;
			  10'b0101010100: dist = 40;
			  10'b0101010101: dist = 181;
			  10'b0101010110: dist = 210;
			  10'b0101010111: dist = 35;
			  10'b0101011000: dist = 262;
			  10'b0101011001: dist = 274;
			  10'b0101011010: dist = 21;
			  10'b0101011011: dist = 77;
			  10'b0101011100: dist = 245;
			  10'b0101011101: dist = 79;
			  10'b0101101100: dist = 78;
			  10'b0101101101: dist = 54;
			  10'b0101101110: dist = 75;
			  10'b0101101111: dist = 86;
			  10'b0101110000: dist = 207;
			  10'b0101110001: dist = 24;
			  10'b0101110010: dist = 14;
			  10'b0101110011: dist = 24;
			  10'b0101110100: dist = 25;
			  10'b0101110101: dist = 126;
			  10'b0101110110: dist = 151;
			  10'b0101110111: dist = 89;
			  10'b0101111000: dist = 205;
			  10'b0101111001: dist = 219;
			  10'b0101111010: dist = 71;
			  10'b0101111011: dist = 75;
			  10'b0101111100: dist = 186;
			  10'b0101111101: dist = 78;
			  10'b0110001101: dist = 52;
			  10'b0110001110: dist = 140;
			  10'b0110001111: dist = 26;
			  10'b0110010000: dist = 264;
			  10'b0110010001: dist = 61;
			  10'b0110010010: dist = 77;
			  10'b0110010011: dist = 71;
			  10'b0110010100: dist = 71;
			  10'b0110010101: dist = 181;
			  10'b0110010110: dist = 227;
			  10'b0110010111: dist = 25;
			  10'b0110011000: dist = 264;
			  10'b0110011001: dist = 272;
			  10'b0110011010: dist = 21;
			  10'b0110011011: dist = 50;
			  10'b0110011100: dist = 253;
			  10'b0110011101: dist = 51;
			  10'b0110101110: dist = 129;
			  10'b0110101111: dist = 74;
			  10'b0110110000: dist = 261;
			  10'b0110110001: dist = 30;
			  10'b0110110010: dist = 43;
			  10'b0110110011: dist = 33;
			  10'b0110110100: dist = 32;
			  10'b0110110101: dist = 179;
			  10'b0110110110: dist = 203;
			  10'b0110110111: dist = 46;
			  10'b0110111000: dist = 259;
			  10'b0110111001: dist = 272;
			  10'b0110111010: dist = 32;
			  10'b0110111011: dist = 84;
			  10'b0110111100: dist = 240;
			  10'b0110111101: dist = 86;
			  10'b0111001111: dist = 136;
			  10'b0111010000: dist = 132;
			  10'b0111010001: dist = 99;
			  10'b0111010010: dist = 88;
			  10'b0111010011: dist = 98;
			  10'b0111010100: dist = 100;
			  10'b0111010101: dist = 54;
			  10'b0111010110: dist = 91;
			  10'b0111010111: dist = 158;
			  10'b0111011000: dist = 129;
			  10'b0111011001: dist = 145;
			  10'b0111011010: dist = 141;
			  10'b0111011011: dist = 110;
			  10'b0111011100: dist = 113;
			  10'b0111011101: dist = 112;
			  10'b0111110000: dist = 253;
			  10'b0111110001: dist = 74;
			  10'b0111110010: dist = 89;
			  10'b0111110011: dist = 86;
			  10'b0111110100: dist = 86;
			  10'b0111110101: dist = 170;
			  10'b0111110110: dist = 226;
			  10'b0111110111: dist = 50;
			  10'b0111111000: dist = 254;
			  10'b0111111001: dist = 258;
			  10'b0111111010: dist = 47;
			  10'b0111111011: dist = 31;
			  10'b0111111100: dist = 246;
			  10'b0111111101: dist = 30;
			  10'b1000010001: dist = 230;
			  10'b1000010010: dist = 220;
			  10'b1000010011: dist = 231;
			  10'b1000010100: dist = 232;
			  10'b1000010101: dist = 83;
			  10'b1000010110: dist = 105;
			  10'b1000010111: dist = 285;
			  10'b1000011000: dist = 10;
			  10'b1000011001: dist = 22;
			  10'b1000011010: dist = 269;
			  10'b1000011011: dist = 222;
			  10'b1000011100: dist = 49;
			  10'b1000011101: dist = 224;
			  10'b1000110010: dist = 16;
			  10'b1000110011: dist = 11;
			  10'b1000110100: dist = 11;
			  10'b1000110101: dist = 149;
			  10'b1000110110: dist = 175;
			  10'b1000110111: dist = 66;
			  10'b1000111000: dist = 228;
			  10'b1000111001: dist = 242;
			  10'b1000111010: dist = 49;
			  10'b1000111011: dist = 72;
			  10'b1000111100: dist = 210;
			  10'b1000111101: dist = 75;
			  10'b1001010011: dist = 10;
			  10'b1001010100: dist = 11;
			  10'b1001010101: dist = 140;
			  10'b1001010110: dist = 160;
			  10'b1001010111: dist = 83;
			  10'b1001011000: dist = 218;
			  10'b1001011001: dist = 233;
			  10'b1001011010: dist = 66;
			  10'b1001011011: dist = 83;
			  10'b1001011100: dist = 197;
			  10'b1001011101: dist = 86;
			  10'b1001110100: dist = 1;
			  10'b1001110101: dist = 150;
			  10'b1001110110: dist = 170;
			  10'b1001110111: dist = 75;
			  10'b1001111000: dist = 228;
			  10'b1001111001: dist = 243;
			  10'b1001111010: dist = 58;
			  10'b1001111011: dist = 84;
			  10'b1001111100: dist = 208;
			  10'b1001111101: dist = 87;
			  10'b1010010101: dist = 151;
			  10'b1010010110: dist = 171;
			  10'b1010010111: dist = 74;
			  10'b1010011000: dist = 229;
			  10'b1010011001: dist = 244;
			  10'b1010011010: dist = 57;
			  10'b1010011011: dist = 84;
			  10'b1010011100: dist = 209;
			  10'b1010011101: dist = 87;
			  10'b1010110110: dist = 92;
			  10'b1010110111: dist = 201;
			  10'b1010111000: dist = 84;
			  10'b1010111001: dist = 93;
			  10'b1010111010: dist = 185;
			  10'b1010111011: dist = 139;
			  10'b1010111100: dist = 82;
			  10'b1010111101: dist = 141;
			  10'b1011010111: dist = 240;
			  10'b1011011000: dist = 97;
			  10'b1011011001: dist = 128;
			  10'b1011011010: dist = 223;
			  10'b1011011011: dist = 201;
			  10'b1011011100: dist = 58;
			  10'b1011011101: dist = 204;
			  10'b1011111000: dist = 285;
			  10'b1011111001: dist = 293;
			  10'b1011111010: dist = 17;
			  10'b1011111011: dist = 76;
			  10'b1011111100: dist = 271;
			  10'b1011111101: dist = 76;
			  10'b1100011001: dist = 32;
			  10'b1100011010: dist = 268;
			  10'b1100011011: dist = 223;
			  10'b1100011100: dist = 39;
			  10'b1100011101: dist = 225;
			  10'b1100111010: dist = 278;
			  10'b1100111011: dist = 227;
			  10'b1100111100: dist = 72;
			  10'b1100111101: dist = 228;
			  10'b1101011011: dist = 66;
			  10'b1101011100: dist = 254;
			  10'b1101011101: dist = 67;
			  10'b1101111100: dist = 218;
			  10'b1101111101: dist = 3;
			  10'b1110011101: dist = 220;
		  default: dist = 5;


		endcase
		
	end

endmodule
