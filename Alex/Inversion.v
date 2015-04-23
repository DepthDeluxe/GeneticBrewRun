`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:22 04/09/2015 
// Design Name: 
// Module Name:    inversionTemp 
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

//inversion
//selects two indicies based on PRN's and inverts section
module inversion(
	input clk,
	input prg_seed,
	input [149:0] parent,
	output [149:0] mutant
	);

reg [149:0] next_mutant;
reg [7:0] random0;
reg [7:0] random1;

initial begin
mutant = 150'b0;
next_mutant = 150'b0;
random0 = 8'b0;
random1 = 8'b0;
end

random random_3 (.clk(clk), .prg_seed(prg_seed), .random0(random0), .random1(random1));

always @ ( * )
begin
	//invert based on random vars
	if ( random0 != random1 && abs(random0 - random1) < 3	)
	begin
		if ( random1 == 0 )
			mutant = parent;
		else if (random1 == 1)
			mutant[7:0] = parent[7:0];
		//...
		else
			mutant[7:0] = parent[0:7];
	end
end


endmodule
