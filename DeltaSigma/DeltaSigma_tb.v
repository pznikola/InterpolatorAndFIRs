// SPDX-License-Identifier: Apache-2.0

//`default_nettype none

`default_nettype wire

`timescale 1 us/ 10 ps

`include "DeltaSigma.v"

module DeltaSigma_tb();
	
	// input data to send
	reg [13:0] inputData [0:1024];

	// clk, rst signals
	reg clk = 0;
    reg reset;

	// testbench signals
    reg [13:0] data_in;

	// Data counters
	reg [9:0] inputDataCounter = 16'b0;

	// Outut as signed and goldenData as signed
	wire [3:0] data_out;

	// toggle clock
	//always #10 clk <= (clk === 1'b0);
	always #5.20833333333 clk <= (clk === 1'b0); //96MHz

	initial $readmemh("input.txt", inputData);

	// Send input data
	always @ (posedge clk) begin
		if (reset == 1'b1) begin
			data_in <= 0;
			inputDataCounter <= 0;
		end
		else begin
			data_in <= inputData[inputDataCounter][13:0];
			inputDataCounter <= inputDataCounter + 1'b1;
		end
	end

	// Release reset
	initial begin
		reset <= 1'b1;
		#43;
		reset <= 1'b0;
	end
	
	// DUT
	DeltaSigma i1 (
		.data_in(data_in),
		.clk(clk),
		.data_out(data_out),
		.reset(reset)
	);
endmodule