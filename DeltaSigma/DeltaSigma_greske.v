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
reg signed [13:0] feedback;
     
always@(posedge clk or posedge reset) begin
    if(reset == 1) begin
    	data_out <= 4'b0000;
        acc1 <= 14'b00000000000000;
        acc2 <= 14'b00000000000000;
        feedback <= 14'b00000000000000;        
        
    end else begin

    	acc2 <= acc1 + feedback + acc2;
        acc1 <= data_in + feedback + acc1;
        data_out[3:0] <= acc2[13:10];
        
        if(acc2 > 0) begin
        	//feedback_flag = 1;
        	feedback <= 14'b01111111111111;  //najpozitivniji
                
        end else begin
        	//feedback_flag = 0;
        	feedback <= 14'b11111111111111;  //najnegativniji
        end
        //if(feedback_flag == 1) begin
        //	feedback <= 14'b01111111111111;  //najpozitivniji
       // end else begin
        //	feedback <= 14'b11111111111111;  //najnegativniji
       // end
        
     end
     
end

endmodule