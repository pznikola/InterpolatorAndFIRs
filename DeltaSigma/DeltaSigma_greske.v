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
reg feedback_flag;
reg signed [13:0]acc1;		//prekoracenje moze biti problem
reg signed [13:0]acc2;
reg signed [13:0] feedback;
reg treci, drugi, prvi;

always@(posedge clk or posedge reset) begin
    if(reset == 0) begin
    //always = linearno, <= paralelno
        acc2 = acc1 + feedback + acc2;
        acc1 = data_in + feedback + acc1;
    end //else begin
     	//data_out = "0000";
        //acc1 = "00000000000000";
        //acc2 = "00000000000000";
        //feedback = "00000000000000";
     //end
end       
always@(posedge clk or posedge reset) begin
    if(reset == 0) begin        
        treci = acc2[12];
        drugi = acc2[8];
        prvi = acc2[4];
        
        if(acc2 > 0) begin
        	feedback_flag = "1";
        	data_out[3] = 0; //pozitivno
        
        	if(treci == "1") begin
        		data_out[2] = "1";
        	end else begin
        		data_out[2] = "0";
        	end
        	if(drugi == "1") begin
        		data_out[1] = "1";
        	end else begin
        		data_out[1] = "0";
        	end
        	if(prvi == 1) begin
        		data_out[0] = "1";
        	end else begin
        		data_out[0] = "0"; //acc[0] je greska pri racunu 1 bit znak, 3*4=12, 1 bit greska, suma 14
        	end
        
        end else begin
        	feedback_flag = "0";
        	data_out[3] = 1; //negativno
        
        	if(treci == 1) begin
        		data_out[2] = "1";
        	end else begin
        		data_out[2] = "0";
        	end
        	if(drugi == 1) begin
        		data_out[1] = "1";
        	end else begin
        		data_out[1] = "0";
        	end
        	if(prvi == 1) begin
        		data_out[0] = "1";
        	end else begin
        		data_out[0] = "0";
        	end
        end
        if(feedback_flag == 1) begin
        	feedback = 14'b01111111111111;  //najpozitivniji
        end else begin
        	feedback = 14'b11111111111111;  //najnegativniji
        end
    end else begin
        data_out = "0000";
        acc1 = "00000000000000";
        acc2 = "00000000000000";
        feedback = "00000000000000";
     end
     
end

endmodule