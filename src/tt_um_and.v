
/*
A clock divider in Verilog, using the cascading
flip-flop method.
*/

module tt_um_and(
  input clk,
  input reset,
	input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input ena,
  input  wire       rst_n,     // reset_n - low to reset
 // input wire A,
 // input wire B,
  output Y,
  output reg clk_div2,
  output reg clk_div4,
  output reg clk_div8,
  output reg clk_div16
);

  // simple ripple clock divider
  	
 
 
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
