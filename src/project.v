/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_and(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,     // reset_n - low to reset
);
	
  // All output pins must be assigned. If not used, assign to 0.
 //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
	assign uio_out[6:0] = 0;
	assign uio_in[7:0] = 0;
	assign ui_in[7:0] = 0;
	assign uio_oe[6:0]  = 0;
	assign uio_oe[7]  = 0;  // enable msb to monitor enable
	assign uio_out[7] = ena_and_rst_n;
	
  // release reset when project enabled
  wire ena_and_rst_n = ena & rst_n;


	tt_um_clk_and top(
		.clk(clk),
		.reset(ena_and_rst_n),
		.Y(uo_out[7:6]),
		.clk_div2(uo_out[5:4]),
		.clk_div4(uo_out[3:2]),
		.clk_div8(uo_out[2:1]),
		.clk_div16(uo_out[1:0])
	);


endmodule

