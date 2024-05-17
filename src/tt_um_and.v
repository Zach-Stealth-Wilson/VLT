module tt_um_and(A,B,Y,ena,clk,rst_n);
  input [7:0] A;
  input [7:0] B;
  output [7:0] Y;
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
  assign Y = A & B;
endmodule
