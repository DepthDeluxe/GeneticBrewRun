`timescale 1 ns / 1 ps

module Iterator_Test;

reg clk;
reg start;
reg [31:0] prg_seed;
reg [149:0] parent;

wire [749:0] family;
wire done;

Iterator uut(
    .clk(clk),
	 .start(start),
	 .prg_seed(prg_seed),
    .parent(parent),
    .family(family),
	 .done(done)
    );
	 
always #5 clk = ~clk;

initial begin
	clk = 0;
	start = 0;
	prg_seed = 19072239;
	parent = -1236236;
	
	#1000;
	
	start = 1;
	#20;
	start = 0;
	#10000;

end

endmodule
