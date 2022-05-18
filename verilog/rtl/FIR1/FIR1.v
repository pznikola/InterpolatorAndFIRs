module FIR1_MultiplyBlock (
  X,
  Y1,
  Y2,
  Y3,
  Y4,
  Y5,
  Y6,
  Y7,
  Y8,
  Y9,
  Y10,
  Y11,
  Y12,
  Y13,
  Y14,
  Y15,
  Y16,
  Y17,
  Y18,
  Y19,
	Y20,
	Y21,
	Y22,
	Y23
);

  // Port mode declaratins:
  input signed   [13:0] X;  
  output signed [13:0] Y2, Y4, Y6, Y8, Y10, Y14, Y16, Y18, Y20, Y22;
  output signed [17:0] Y1, Y23;
  output signed [20:0] Y3, Y21;
  output signed [22:0] Y5, Y19;
  output signed [23:0] Y7, Y17;
  output signed [25:0] Y9, Y15;
  output signed [27:0] Y11, Y12, Y13;

  wire signed [13:0] W1, W3, W5, W7, W9, W13, W15, W17, W19, W21;
  wire signed [17:0] W0, W22;
  wire signed [20:0] W2, W20;
  wire signed [22:0] W4, W18;
  wire signed [23:0] W6, W16;
  wire signed [25:0] W8, W14;
  wire signed [27:0] W10, W11, W12;

  assign Y1 = W0;
  assign Y2 = W1;
  assign Y3 = W2;
  assign Y4 = W3;
  assign Y5 = W4;
  assign Y6 = W5;
  assign Y7 = W6;
  assign Y8 = W7;
  assign Y9 = W8;
  assign Y10 = W9;
  assign Y11 = W10;
  assign Y12 = W11;
  assign Y13 = W12;
  assign Y14 = W13;
  assign Y15 = W14;
  assign Y16 = W15;
  assign Y17 = W16;
  assign Y18 = W17;
  assign Y19 = W18;
  assign Y20 = W19;
  assign Y21 = W20;
  assign Y22 = W21;
  assign Y23 = W22;

  //Multipliers:
  wire signed [13:0] w0, w1;
  wire signed [15:0] w3, w4;
  wire signed [17:0] w12, w12_;
  wire signed [18:0] w21, w24;
  wire signed [19:0] w63, w64;
  wire signed [20:0] w84;
  wire signed [21:0] w252;
  wire signed [22:0] w315, w336, w337, w337_;
  wire signed [23:0] w1008;
  wire signed [25:0] w2693, w2693_, w2696;
  wire signed [26:0] w5071, w5386;
  wire signed [27:0] w10142, w16384;

  assign w1 = X;
  assign w0 = 0;
  assign w1008 = w63 << 4; 
  assign w10142 = w5071 << 1; 
  assign w12 = w3 << 2; 
  assign w12_ = -1 * w12; 
  assign w16384 = w1 << 14; 
  assign w21 = w24 - w3; 
  assign w24 = w3 << 3; 
  assign w252 = w63 << 2; 
  assign w2693 = w2696 - w3; 
  assign w2693_ = -1 * w2693;
  assign w2696 = w337 << 3; 
  assign w3 = w4 - w1; 
  assign w315 = w63 + w252;
  assign w336 = w21 << 4;
  assign w337 = w1 + w336;
  assign w337_ = -1 * w337;
  assign w4 = w1 << 2;
  assign w5071 = w5386 - w315;
  assign w5386 = w2693 << 1;
  assign w63 = w64 - w1;
  assign w64 = w1 << 6;
  assign w84 = w21 << 2;

  assign W0 = w12_; 
  assign W1 = w0; 
  assign W2 = w84; 
  assign W3 = w0; 
  assign W4 = w337_; 
  assign W5 = w0;
  assign W6 = w1008;
  assign W7 = w0;
  assign W8 = w2693_;
  assign W9 = w0;
  assign W10 = w10142;
  assign W11 = w16384;
  assign W12 = w10142;
  assign W13 = w0;
  assign W14 = w2693_;
  assign W15 = w0;
  assign W16 = w1008;
  assign W17 = w0;
  assign W18 = w337_;
  assign W19 = w0;
  assign W20 = w84;
  assign W21 = w0;
  assign W22 = w12_;
endmodule

module FIR1 (
    X,
    clk,
    Y,
    reset
);

  // Port mode declarations:
  input   [13:0] X;
  input    clk;
  output  [13:0] Y;
  input    reset;

  //registerOut
  reg [13:0] Y;
  wire [29:0] Y_in;

  always@(posedge clk or posedge reset) begin
    if(reset) begin
      Y <= 14'h0000;
    end  else begin
      Y <= Y_in[29:16];
    end
  end

  wire signed [13:0] multProducts1, multProducts3, multProducts5, multProducts7, multProducts9, multProducts13, multProducts15, multProducts17, multProducts19, multProducts21;
  wire signed [17:0] multProducts0, multProducts22;
  wire signed [20:0] multProducts2, multProducts20;
  wire signed [22:0] multProducts4, multProducts18;
  wire signed [23:0] multProducts6, multProducts16;
  wire signed [25:0] multProducts8, multProducts14;
  wire signed [27:0] multProducts10, multProducts11, multProducts12;


  FIR1_MultiplyBlock fir_multiply(
    .X(X),
    .Y1(multProducts0),
    .Y2(multProducts1),
    .Y3(multProducts2),
    .Y4(multProducts3),
    .Y5(multProducts4),
    .Y6(multProducts5),
    .Y7(multProducts6),
    .Y8(multProducts7),
    .Y9(multProducts8),
    .Y10(multProducts9),
    .Y11(multProducts10),
    .Y12(multProducts11),
    .Y13(multProducts12),
    .Y14(multProducts13),
    .Y15(multProducts14),
    .Y16(multProducts15),
    .Y17(multProducts16),
    .Y18(multProducts17),
    .Y19(multProducts18),
    .Y20(multProducts19),
    .Y21(multProducts20),
    .Y22(multProducts21),
    .Y23(multProducts22)
  );

  reg signed [17:0] firStep0, firStep1;
  reg signed [20:0] firStep2, firStep3;
  reg signed [22:0] firStep4, firStep5;
  reg signed [23:0] firStep6, firStep7;
  reg signed [25:0] firStep8, firStep9;
  reg signed [27:0] firStep10;
  reg signed [28:0] firStep11;
  reg signed [29:0] firStep12, firStep13, firStep14, firStep15, firStep16, firStep17, firStep18, firStep19, firStep20, firStep21;

  always@(posedge clk or posedge reset) begin
    if(reset) begin
      firStep0  <= 18'h00000;
      firStep1  <= 18'h00000;
      firStep2  <= 21'h000000;
      firStep3  <= 21'h000000;
      firStep4  <= 23'h000000;
      firStep5  <= 23'h000000;
      firStep6  <= 24'h000000;
      firStep7  <= 24'h000000;
      firStep8  <= 26'h0000000;
      firStep9  <= 26'h0000000;
      firStep10 <= 28'h0000000;
      firStep11 <= 29'h00000000;
      firStep12 <= 30'h00000000;
      firStep13 <= 30'h00000000;
      firStep14 <= 30'h00000000;
      firStep15 <= 30'h00000000;
      firStep16 <= 30'h00000000;
      firStep17 <= 30'h00000000;
      firStep18 <= 30'h00000000;
      firStep19 <= 30'h00000000;
	    firStep20 <= 30'h00000000;
	    firStep21 <= 30'h00000000;
    end
    else begin
      firStep0  <=  multProducts0;
      firStep1  <=  firStep0 + multProducts1;
      firStep2  <=  firStep1 + multProducts2;
      firStep3  <=  firStep2 + multProducts3;
      firStep4  <=  firStep3 + multProducts4;
      firStep5  <=  firStep4 + multProducts5;
      firStep6  <=  firStep5 + multProducts6;
      firStep7  <=  firStep6 + multProducts7;
      firStep8  <=  firStep7 + multProducts8;
      firStep9  <=  firStep8 + multProducts9;
      firStep10 <=  firStep9 + multProducts10;
      firStep11 <=  firStep10 + multProducts11;
      firStep12 <=  firStep11 + multProducts12;
      firStep13 <=  firStep12 + multProducts13;
      firStep14 <=  firStep13 + multProducts14;
      firStep15 <=  firStep14 + multProducts15;
      firStep16 <=  firStep15 + multProducts16;
      firStep17 <=  firStep16 + multProducts17;
	    firStep18 <=  firStep17 + multProducts18;
	    firStep19 <=  firStep18 + multProducts19;
	    firStep20 <=  firStep19 + multProducts20;
	    firStep21 <=  firStep20 + multProducts21;
    end
  end

  assign Y_in = firStep21+ multProducts22;
endmodule
