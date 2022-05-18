// SPDX-License-Identifier: Apache-2.0

//`default_nettype none

`default_nettype wire

`timescale 1 ns/ 10 ps

`include "FIR2.v"

module FIR2_tb();
	// declare file for writing data
	integer file;

	// Tolerance for difference between GoldData and output data
	integer tol = 2;
	
	// input data to send
	reg [15:0] inputData [0:117];

	// Golden data
	reg [15:0] goldenData [0:118];

	// clk, rst signals
	reg clk = 0;
    reg reset;

	// testbench signals
    reg [11:0] X;

	// Data counters
	reg [9:0] outputDataCounter = 16'b0;
	reg [9:0] inputDataCounter = 16'b0;

	// Outut as signed and goldenData as signed
	wire signed [13:0] Y;
	wire signed [13:0] GoldData;
	assign GoldData = goldenData[outputDataCounter][13:0];

	// toggle clock
	always #10 clk <= (clk === 1'b0);

	// Read input data
	initial $readmemh("input.txt", inputData);

	// Read golden data
	initial $readmemh("GoldenDataHex.txt", goldenData);

	// open file for writting
	initial begin
		$printtimescale(FIR2_tb);
		file = $fopen("output.txt","w");
		if (file) $display("File was opened successfully : %0d", file);
    	else $display("File was NOT opened successfully : %0d", file);
	end

	// Send input data
	always @ (posedge clk) begin
		if (reset == 1'b1) begin //Reset == 0
			X <= 0;
			inputDataCounter <= 0;
		end
		else begin
			X <= inputData[inputDataCounter][11:0];
			inputDataCounter <= inputDataCounter + 1'b1;
		end
	end

	// Collect output data
	always @ (posedge clk) begin
		if (reset != 1'b1) begin
			$fwriteh(file, "%h\n" ,Y);
			if ( (Y - GoldData > tol) || (Y - GoldData < -tol)) begin
				$display("%c[1;31m",27);
				$display ("Monitor: Test FIR2_tb failed!!! Read data was %h, but should be %h. At counter = %d", 
				Y, goldenData[outputDataCounter][13:0], outputDataCounter);
				$display("%c[0m",27);
				$fclose(file); 
				$finish;
			end
			outputDataCounter <= outputDataCounter + 1'b1;
		end
	end

	// Max number of cycles
	initial begin
		$dumpfile("FIR2_tb.vcd");
		$dumpvars(0, FIR2_tb);

		repeat (10) begin
			repeat (100) @(posedge clk);
			$display("+100 cycles");
		end
		$display("%c[1;31m",27);
		$display ("Monitor: Test FIR2_tb Failed!!! Timeout.");
		$display("%c[0m",27);
		$fclose(file); 
		$finish;
	end

	// Check if enough data was send, and if so terminate test
	initial begin
		wait(outputDataCounter == 118); 
		$display("%c[1;32m",27);
		$display("Monitor: Test FIR2_tb passed.");
		$display("%c[0m",27);
		$fclose(file); 
		$finish;
	end

	// Release reset
	initial begin
		reset <= 1'b1;
		#43;
		reset <= 1'b0;
	end
	
	// DUT
	FIR2 i1 (
		.X(X),
		.Y(Y),
		.clk(clk),
		.reset(reset)
	);
endmodule
`default_nettype wire
