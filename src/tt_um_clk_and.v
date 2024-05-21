
/*
A clock divider in Verilog, using the cascading
flip-flop method TOP.
*/

module tt_um_clk_and(
  input clk,
  input reset,
  output Y,
  output reg clk_div2,
  output reg clk_div4,
  output reg clk_div8,
  output reg clk_div16,
  output reg [7:0] ui_in, uio_in;
);

 
  // Reset and toggle logic for clk_div2
  always @(posedge clk or posedge reset)
    if (reset)
      clk_div2 <= 0;
    else
      clk_div2 <= ~clk_div2;
	
  // Reset and toggle logic for clk_div4
  always @(posedge clk_div2 or posedge reset)
    if (reset)
      clk_div4 <= 0;
    else
      clk_div4 <= ~clk_div4;
  	

  // Reset and toggle logic for clk_div8
  always @(posedge clk_div4 or posedge reset)
    if (reset)
      clk_div8 <= 0;
    else
      clk_div8 <= ~clk_div8;

  // Reset and toggle logic for clk_div16
  always @(posedge clk_div8 or posedge reset)
    if (reset)
      clk_div16 <= 0;
    else
      clk_div16 <= ~clk_div16;

  // Logic for Y output
  assign Y = clk_div2 & clk_div8;

	// Initialization and signal assignment
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Clock generation

         ui_in = 8'h00; uio_in = 8'h00;
       

        #10 ui_in = 8'hFF;  // Assign new values
        #10 ui_in = 8'hA5;
    end

endmodule
