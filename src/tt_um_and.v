module tt_um_and(A,B,Y);
  input [7:0] A;
  input [7:0] B;
  output [7:0] Y;
  assign Y = A & B;
endmodule
