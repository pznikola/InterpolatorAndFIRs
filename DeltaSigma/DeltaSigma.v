`default_nettype wire

module DeltaSigma
	(
		data_in,
		clk,
		data_out,
		reset
	);

	input [13:0] data_in;
	input clk;
	output [3:0]data_out;
	input reset;

reg signed [3:0]data_out;
//reg feedback_flag;
reg signed [13:0]acc1;		//prekoracenje moze biti problem
reg signed [13:0]acc2;
reg signed [13:0]acc3;		//prekoracenje moze biti problem
reg signed [13:0]acc4;
reg signed [3:0] feedback;

reg signed [13:0] out14;

wire a1 = 1;
wire a2 = -3.869;
wire a3 = 5.740134;
wire a4 = -0.0951982;
wire b1 = 1;
wire b2 = 0.524;
wire b3 = 0.302344;
wire b4 = -0.0951522;
wire b5 = 0.01271088;
wire g1 = 1;
     
always@(posedge clk or posedge reset) begin
    if(reset == 1) begin
    	data_out <= 4'b0000;
        acc1 <= 14'b00000000000000;
        acc2 <= 14'b00000000000000;
        acc3 <= 14'b00000000000000;
        acc4 <= 14'b00000000000000;
        feedback <= 4'b0000;   
        out14 <= 14'b00000000000000;     
        
    end else begin
        
        //out14 <= data_in - 2*feedback + acc1 + acc2;
        //IZMENA



        out14 <= b5*data_in + acc4;
        acc3 <= b3*data_in - a3*feedback + acc2 + acc3; 
        acc4 <= b4*data_in - a4*feedback + acc3 +acc4;
    	acc1 <= b1*data_in - a1*feedback + acc1 - g1*acc4;
    	acc2 <= b2*data_in - a2*feedback + acc1 + acc2;


    	// SIGNED MAGNITUDE
    	if(out14 > -1) begin
    		data_out[3] <= 0;
    	end

    	if(out14 < 0) begin
    		out14 <= -out14;
    		data_out[3] <= 1;
    	end
    	data_out[2:0] <= out14[12:10];
    	feedback <= data_out;
        
     end
     
end

endmodule