`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:16 04/08/2015 
// Design Name: 
// Module Name:    selection 
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
module selection(
    input clk,
    input start,
    input [7499:0] pop,
    input [31:0] prg_seed,
    output reg [1499:0] sel_pop,
    output reg done
    );
	
	reg [7499:0] population;
		
	wire [599:0] popDistance;

	initial done = 0;
	 
	reg [6:0] i;
	initial i = 0;

	reg [5:0] j;
	initial j = 0;

	reg [6:0] newi;
	initial newi = 0;
	
	reg [5:0] newj;
	initial newj = 0;
	
	
	reg [11:0] fittest;
	initial fittest = 9999999;
	reg [149:0] fittest_genome;
	
	
	compDistance cd0 (.in(population[149:0]), .out(popDistance[11:0]));
	compDistance cd1 (.in(population[299:150]), .out(popDistance[23:12]));
	compDistance cd2 (.in(population[449:300]), .out(popDistance[35:24]));
	compDistance cd3 (.in(population[599:450]), .out(popDistance[47:36]));
	compDistance cd4 (.in(population[749:600]), .out(popDistance[59:48]));
	compDistance cd5 (.in(population[899:750]), .out(popDistance[71:60]));
	compDistance cd6 (.in(population[1049:900]), .out(popDistance[83:72]));
	compDistance cd7 (.in(population[1199:1050]), .out(popDistance[95:84]));
	compDistance cd8 (.in(population[1349:1200]), .out(popDistance[107:96]));
	compDistance cd9 (.in(population[1499:1350]), .out(popDistance[119:108]));
	compDistance cd10 (.in(population[1649:1500]), .out(popDistance[131:120]));
	compDistance cd11 (.in(population[1799:1650]), .out(popDistance[143:132]));
	compDistance cd12 (.in(population[1949:1800]), .out(popDistance[155:144]));
	compDistance cd13 (.in(population[2099:1950]), .out(popDistance[167:156]));
	compDistance cd14 (.in(population[2249:2100]), .out(popDistance[179:168]));
	compDistance cd15 (.in(population[2399:2250]), .out(popDistance[191:180]));
	compDistance cd16 (.in(population[2549:2400]), .out(popDistance[203:192]));
	compDistance cd17 (.in(population[2699:2550]), .out(popDistance[215:204]));
	compDistance cd18 (.in(population[2849:2700]), .out(popDistance[227:216]));
	compDistance cd19 (.in(population[2999:2850]), .out(popDistance[239:228]));
	compDistance cd20 (.in(population[3149:3000]), .out(popDistance[251:240]));
	compDistance cd21 (.in(population[3299:3150]), .out(popDistance[263:252]));
	compDistance cd22 (.in(population[3449:3300]), .out(popDistance[275:264]));
	compDistance cd23 (.in(population[3599:3450]), .out(popDistance[287:276]));
	compDistance cd24 (.in(population[3749:3600]), .out(popDistance[299:288]));
	compDistance cd25 (.in(population[3899:3750]), .out(popDistance[311:300]));
	compDistance cd26 (.in(population[4049:3900]), .out(popDistance[323:312]));
	compDistance cd27 (.in(population[4199:4050]), .out(popDistance[335:324]));
	compDistance cd28 (.in(population[4349:4200]), .out(popDistance[347:336]));
	compDistance cd29 (.in(population[4499:4350]), .out(popDistance[359:348]));
	compDistance cd30 (.in(population[4649:4500]), .out(popDistance[371:360]));
	compDistance cd31 (.in(population[4799:4650]), .out(popDistance[383:372]));
	compDistance cd32 (.in(population[4949:4800]), .out(popDistance[395:384]));
	compDistance cd33 (.in(population[5099:4950]), .out(popDistance[407:396]));
	compDistance cd34 (.in(population[5249:5100]), .out(popDistance[419:408]));
	compDistance cd35 (.in(population[5399:5250]), .out(popDistance[431:420]));
	compDistance cd36 (.in(population[5549:5400]), .out(popDistance[443:432]));
	compDistance cd37 (.in(population[5699:5550]), .out(popDistance[455:444]));
	compDistance cd38 (.in(population[5849:5700]), .out(popDistance[467:456]));
	compDistance cd39 (.in(population[5999:5850]), .out(popDistance[479:468]));
	compDistance cd40 (.in(population[6149:6000]), .out(popDistance[491:480]));
	compDistance cd41 (.in(population[6299:6150]), .out(popDistance[503:492]));
	compDistance cd42 (.in(population[6449:6300]), .out(popDistance[515:504]));
	compDistance cd43 (.in(population[6599:6450]), .out(popDistance[527:516]));
	compDistance cd44 (.in(population[6749:6600]), .out(popDistance[539:528]));
	compDistance cd45 (.in(population[6899:6750]), .out(popDistance[551:540]));
	compDistance cd46 (.in(population[7049:6900]), .out(popDistance[563:552]));
	compDistance cd47 (.in(population[7199:7050]), .out(popDistance[575:564]));
	compDistance cd48 (.in(population[7349:7200]), .out(popDistance[587:576]));
	compDistance cd49 (.in(population[7499:7350]), .out(popDistance[599:588]));

	reg [11:0] popDistance11i; 
	reg [149:0] pop149i; 
	
	reg [11:0] popDistance11j; 	
	reg [149:0] pop149j;
	
	always @ (*)
	begin
		popDistance11i = ( popDistance & (150'b111111111111 << 11*i) ) >> 11*i;
		pop149i = ( popDistance & (7500'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 << 150*i) ) >> 150*i;

		sel_pop[149:0] = population[149:0];
		sel_pop[299:150] = population[299:150];
		sel_pop[449:300] = population[449:300];
		sel_pop[599:450] = population[599:450];
		sel_pop[749:600] = population[749:600];
		sel_pop[899:750] = population[899:750];
		sel_pop[1049:900] = population[1049:900];
		sel_pop[1199:1050] = population[1199:1050];
		sel_pop[1349:1200] = population[1349:1200];
		sel_pop[1499:1350] = population[1499:1350];
		if(start == 1 && done == 0)
		begin

			if( j >= 10)
			begin
				done = 1;
			end
			else
			begin
				if(i >= 30)
				begin
					newi = j;
					newj = j + 1;
					fittest = 99999999;
				end
				else
				begin
	
					
					if(popDistance11i < fittest)
					begin
						fittest = popDistance11i;
						fittest_genome = pop149i;



//						fittest = popDistance11i;
//						fittest_genome = pop149i;
//						
//						
//						popDistance[11*i] = popDistance11j;
//						popDistance[12*j] = fittest;
						
//						pop149i = pop149j;
//						pop149j = fittest_genome;
						
						
					end
					
					
					newi = i + 1;
				end
			end
		end
		else
		begin
			newi = 0;
			newj = 0;

			
		end
	end
	
	always @ (posedge clk)
	begin
		

		sel_pop[(149*j)+ 0 ] = fittest_genome[i + 0];
		sel_pop[(149*j)+ 1 ] = fittest_genome[i + 1];
		sel_pop[(149*j)+ 2 ] = fittest_genome[i + 2];
		sel_pop[(149*j)+ 3 ] = fittest_genome[i + 3];
		sel_pop[(149*j)+ 4 ] = fittest_genome[i + 4];
		sel_pop[(149*j)+ 5 ] = fittest_genome[i + 5];
		sel_pop[(149*j)+ 6 ] = fittest_genome[i + 6];
		sel_pop[(149*j)+ 7 ] = fittest_genome[i + 7];
		sel_pop[(149*j)+ 8 ] = fittest_genome[i + 8];
		sel_pop[(149*j)+ 9 ] = fittest_genome[i + 9];
		sel_pop[(149*j)+ 10 ] = fittest_genome[i + 10];
		sel_pop[(149*j)+ 11 ] = fittest_genome[i + 11];
		sel_pop[(149*j)+ 12 ] = fittest_genome[i + 12];
		sel_pop[(149*j)+ 13 ] = fittest_genome[i + 13];
		sel_pop[(149*j)+ 14 ] = fittest_genome[i + 14];
		sel_pop[(149*j)+ 15 ] = fittest_genome[i + 15];
		sel_pop[(149*j)+ 16 ] = fittest_genome[i + 16];
		sel_pop[(149*j)+ 17 ] = fittest_genome[i + 17];
		sel_pop[(149*j)+ 18 ] = fittest_genome[i + 18];
		sel_pop[(149*j)+ 19 ] = fittest_genome[i + 19];
		sel_pop[(149*j)+ 20 ] = fittest_genome[i + 20];
		sel_pop[(149*j)+ 21 ] = fittest_genome[i + 21];
		sel_pop[(149*j)+ 22 ] = fittest_genome[i + 22];
		sel_pop[(149*j)+ 23 ] = fittest_genome[i + 23];
		sel_pop[(149*j)+ 24 ] = fittest_genome[i + 24];
		sel_pop[(149*j)+ 25 ] = fittest_genome[i + 25];
		sel_pop[(149*j)+ 26 ] = fittest_genome[i + 26];
		sel_pop[(149*j)+ 27 ] = fittest_genome[i + 27];
		sel_pop[(149*j)+ 28 ] = fittest_genome[i + 28];
		sel_pop[(149*j)+ 29 ] = fittest_genome[i + 29];
		sel_pop[(149*j)+ 30 ] = fittest_genome[i + 30];
		sel_pop[(149*j)+ 31 ] = fittest_genome[i + 31];
		sel_pop[(149*j)+ 32 ] = fittest_genome[i + 32];
		sel_pop[(149*j)+ 33 ] = fittest_genome[i + 33];
		sel_pop[(149*j)+ 34 ] = fittest_genome[i + 34];
		sel_pop[(149*j)+ 35 ] = fittest_genome[i + 35];
		sel_pop[(149*j)+ 36 ] = fittest_genome[i + 36];
		sel_pop[(149*j)+ 37 ] = fittest_genome[i + 37];
		sel_pop[(149*j)+ 38 ] = fittest_genome[i + 38];
		sel_pop[(149*j)+ 39 ] = fittest_genome[i + 39];
		sel_pop[(149*j)+ 40 ] = fittest_genome[i + 40];
		sel_pop[(149*j)+ 41 ] = fittest_genome[i + 41];
		sel_pop[(149*j)+ 42 ] = fittest_genome[i + 42];
		sel_pop[(149*j)+ 43 ] = fittest_genome[i + 43];
		sel_pop[(149*j)+ 44 ] = fittest_genome[i + 44];
		sel_pop[(149*j)+ 45 ] = fittest_genome[i + 45];
		sel_pop[(149*j)+ 46 ] = fittest_genome[i + 46];
		sel_pop[(149*j)+ 47 ] = fittest_genome[i + 47];
		sel_pop[(149*j)+ 48 ] = fittest_genome[i + 48];
		sel_pop[(149*j)+ 49 ] = fittest_genome[i + 49];
		sel_pop[(149*j)+ 50 ] = fittest_genome[i + 50];
		sel_pop[(149*j)+ 51 ] = fittest_genome[i + 51];
		sel_pop[(149*j)+ 52 ] = fittest_genome[i + 52];
		sel_pop[(149*j)+ 53 ] = fittest_genome[i + 53];
		sel_pop[(149*j)+ 54 ] = fittest_genome[i + 54];
		sel_pop[(149*j)+ 55 ] = fittest_genome[i + 55];
		sel_pop[(149*j)+ 56 ] = fittest_genome[i + 56];
		sel_pop[(149*j)+ 57 ] = fittest_genome[i + 57];
		sel_pop[(149*j)+ 58 ] = fittest_genome[i + 58];
		sel_pop[(149*j)+ 59 ] = fittest_genome[i + 59];
		sel_pop[(149*j)+ 60 ] = fittest_genome[i + 60];
		sel_pop[(149*j)+ 61 ] = fittest_genome[i + 61];
		sel_pop[(149*j)+ 62 ] = fittest_genome[i + 62];
		sel_pop[(149*j)+ 63 ] = fittest_genome[i + 63];
		sel_pop[(149*j)+ 64 ] = fittest_genome[i + 64];
		sel_pop[(149*j)+ 65 ] = fittest_genome[i + 65];
		sel_pop[(149*j)+ 66 ] = fittest_genome[i + 66];
		sel_pop[(149*j)+ 67 ] = fittest_genome[i + 67];
		sel_pop[(149*j)+ 68 ] = fittest_genome[i + 68];
		sel_pop[(149*j)+ 69 ] = fittest_genome[i + 69];
		sel_pop[(149*j)+ 70 ] = fittest_genome[i + 70];
		sel_pop[(149*j)+ 71 ] = fittest_genome[i + 71];
		sel_pop[(149*j)+ 72 ] = fittest_genome[i + 72];
		sel_pop[(149*j)+ 73 ] = fittest_genome[i + 73];
		sel_pop[(149*j)+ 74 ] = fittest_genome[i + 74];
		sel_pop[(149*j)+ 75 ] = fittest_genome[i + 75];
		sel_pop[(149*j)+ 76 ] = fittest_genome[i + 76];
		sel_pop[(149*j)+ 77 ] = fittest_genome[i + 77];
		sel_pop[(149*j)+ 78 ] = fittest_genome[i + 78];
		sel_pop[(149*j)+ 79 ] = fittest_genome[i + 79];
		sel_pop[(149*j)+ 80 ] = fittest_genome[i + 80];
		sel_pop[(149*j)+ 81 ] = fittest_genome[i + 81];
		sel_pop[(149*j)+ 82 ] = fittest_genome[i + 82];
		sel_pop[(149*j)+ 83 ] = fittest_genome[i + 83];
		sel_pop[(149*j)+ 84 ] = fittest_genome[i + 84];
		sel_pop[(149*j)+ 85 ] = fittest_genome[i + 85];
		sel_pop[(149*j)+ 86 ] = fittest_genome[i + 86];
		sel_pop[(149*j)+ 87 ] = fittest_genome[i + 87];
		sel_pop[(149*j)+ 88 ] = fittest_genome[i + 88];
		sel_pop[(149*j)+ 89 ] = fittest_genome[i + 89];
		sel_pop[(149*j)+ 90 ] = fittest_genome[i + 90];
		sel_pop[(149*j)+ 91 ] = fittest_genome[i + 91];
		sel_pop[(149*j)+ 92 ] = fittest_genome[i + 92];
		sel_pop[(149*j)+ 93 ] = fittest_genome[i + 93];
		sel_pop[(149*j)+ 94 ] = fittest_genome[i + 94];
		sel_pop[(149*j)+ 95 ] = fittest_genome[i + 95];
		sel_pop[(149*j)+ 96 ] = fittest_genome[i + 96];
		sel_pop[(149*j)+ 97 ] = fittest_genome[i + 97];
		sel_pop[(149*j)+ 98 ] = fittest_genome[i + 98];
		sel_pop[(149*j)+ 99 ] = fittest_genome[i + 99];
		sel_pop[(149*j)+ 100 ] = fittest_genome[i + 100];
		sel_pop[(149*j)+ 101 ] = fittest_genome[i + 101];
		sel_pop[(149*j)+ 102 ] = fittest_genome[i + 102];
		sel_pop[(149*j)+ 103 ] = fittest_genome[i + 103];
		sel_pop[(149*j)+ 104 ] = fittest_genome[i + 104];
		sel_pop[(149*j)+ 105 ] = fittest_genome[i + 105];
		sel_pop[(149*j)+ 106 ] = fittest_genome[i + 106];
		sel_pop[(149*j)+ 107 ] = fittest_genome[i + 107];
		sel_pop[(149*j)+ 108 ] = fittest_genome[i + 108];
		sel_pop[(149*j)+ 109 ] = fittest_genome[i + 109];
		sel_pop[(149*j)+ 110 ] = fittest_genome[i + 110];
		sel_pop[(149*j)+ 111 ] = fittest_genome[i + 111];
		sel_pop[(149*j)+ 112 ] = fittest_genome[i + 112];
		sel_pop[(149*j)+ 113 ] = fittest_genome[i + 113];
		sel_pop[(149*j)+ 114 ] = fittest_genome[i + 114];
		sel_pop[(149*j)+ 115 ] = fittest_genome[i + 115];
		sel_pop[(149*j)+ 116 ] = fittest_genome[i + 116];
		sel_pop[(149*j)+ 117 ] = fittest_genome[i + 117];
		sel_pop[(149*j)+ 118 ] = fittest_genome[i + 118];
		sel_pop[(149*j)+ 119 ] = fittest_genome[i + 119];
		sel_pop[(149*j)+ 120 ] = fittest_genome[i + 120];
		sel_pop[(149*j)+ 121 ] = fittest_genome[i + 121];
		sel_pop[(149*j)+ 122 ] = fittest_genome[i + 122];
		sel_pop[(149*j)+ 123 ] = fittest_genome[i + 123];
		sel_pop[(149*j)+ 124 ] = fittest_genome[i + 124];
		sel_pop[(149*j)+ 125 ] = fittest_genome[i + 125];
		sel_pop[(149*j)+ 126 ] = fittest_genome[i + 126];
		sel_pop[(149*j)+ 127 ] = fittest_genome[i + 127];
		sel_pop[(149*j)+ 128 ] = fittest_genome[i + 128];
		sel_pop[(149*j)+ 129 ] = fittest_genome[i + 129];
		sel_pop[(149*j)+ 130 ] = fittest_genome[i + 130];
		sel_pop[(149*j)+ 131 ] = fittest_genome[i + 131];
		sel_pop[(149*j)+ 132 ] = fittest_genome[i + 132];
		sel_pop[(149*j)+ 133 ] = fittest_genome[i + 133];
		sel_pop[(149*j)+ 134 ] = fittest_genome[i + 134];
		sel_pop[(149*j)+ 135 ] = fittest_genome[i + 135];
		sel_pop[(149*j)+ 136 ] = fittest_genome[i + 136];
		sel_pop[(149*j)+ 137 ] = fittest_genome[i + 137];
		sel_pop[(149*j)+ 138 ] = fittest_genome[i + 138];
		sel_pop[(149*j)+ 139 ] = fittest_genome[i + 139];
		sel_pop[(149*j)+ 140 ] = fittest_genome[i + 140];
		sel_pop[(149*j)+ 141 ] = fittest_genome[i + 141];
		sel_pop[(149*j)+ 142 ] = fittest_genome[i + 142];
		sel_pop[(149*j)+ 143 ] = fittest_genome[i + 143];
		sel_pop[(149*j)+ 144 ] = fittest_genome[i + 144];
		sel_pop[(149*j)+ 145 ] = fittest_genome[i + 145];
		sel_pop[(149*j)+ 146 ] = fittest_genome[i + 146];
		sel_pop[(149*j)+ 147 ] = fittest_genome[i + 147];
		sel_pop[(149*j)+ 148 ] = fittest_genome[i + 148];
		sel_pop[(149*j)+ 149 ] = fittest_genome[i + 149];
		i = newi;
		j = newj;
	end
	
	
	
	always @ (posedge start)
	begin
		done = 0;
		population = pop;
	end


endmodule
