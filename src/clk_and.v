
/*
A clock divider in Verilog, using the cascading
flip-flop method.
*/
`default_nettype none

module clk_and(
  input clk,
  input reset,
  output Y,
  output reg clk_div2,
  output reg clk_div4,
  output reg clk_div8,
  output reg clk_div16
);

 
  always @(posedge clk)
    clk_div2 <= reset ? 0 : ~clk_div2;
	
  always @(posedge clk_div2)
    clk_div4 <= ~clk_div4;
  	

  always @(posedge clk_div4)
    clk_div8 <= ~clk_div8;

  always @(posedge clk_div8)
    clk_div16 <= ~clk_div16;
  	//assign A = clk_div2;
  assign Y = clk_div2 & clk_div8;


endmodule
