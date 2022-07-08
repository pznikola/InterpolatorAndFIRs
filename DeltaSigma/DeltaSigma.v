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
	output data_out;
	input reset;

reg data_out;
reg signed [13:0]acc1;		//prekoracenje moze biti problem
reg signed [13:0]acc2;
reg signed [13:0] feedback;

always@(posedge clk or posedge reset) begin
    if(reset == 0) begin
        acc1 <= data_in + feedback + acc1;
        acc2 <= acc1 + feedback + acc2;
        if(acc2 > 0) begin
        data_out <= "1";
        end else begin
        data_out <= "0";
        end
        if(data_out == 1) begin
        feedback <= "01111111111111";  //najpozitivniji
        end else begin
        feedback <= "11111111111111";  //najnegativniji
        end
     end else begin
        acc1 <= "00000000000000";
        acc2 <= "00000000000000";
        feedback <= "00000000000000";
     end
end

endmodule