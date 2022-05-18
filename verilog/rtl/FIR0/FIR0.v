`default_nettype wire

module FIR0_MultiplyBlock (
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
  Y15
);

  // Port mode declarations:
  input signed   [13:0] X;
  output signed  [13:0]
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
  Y15;

  wire [13:0] Y [0:14];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];
  assign Y9 = Y[8];
  assign Y10 = Y[9];
  assign Y11 = Y[10];
  assign Y12 = Y[11];
  assign Y13 = Y[12];
  assign Y14 = Y[13];
  assign Y15 = Y[14];

  //Multipliers:

  wire signed [13:0]
    w1,
    w0,
    w4,
    w3,
    w128,
    w127,
    w24,
    w27,
    w64,
    w61,
    w488,
    w615,
    w6,
    w6_,
    w54,
    w254,
    w254_,
    w1230,
    w2048;

  assign w1 = X;
  assign w0 = 0;
  assign w1230 = w615 << 1;
  assign w127 = w128 - w1;
  assign w128 = w1 << 7;
  assign w2048 = w1 << 11;
  assign w24 = w3 << 3;
  assign w254 = w127 << 1;
  assign w254_ = -1 * w254;
  assign w27 = w3 + w24;
  assign w3 = w4 - w1;
  assign w4 = w1 << 2;
  assign w488 = w61 << 3;
  assign w54 = w27 << 1;
  assign w6 = w3 << 1;
  assign w61 = w64 - w3;
  assign w615 = w127 + w488;
  assign w64 = w1 << 6;
  assign w6_ = -1 * w6;

  assign Y[0] = w6_;
  assign Y[1] = w0;
  assign Y[2] = w54;
  assign Y[3] = w0;
  assign Y[4] = w254_;
  assign Y[5] = w0;
  assign Y[6] = w1230;
  assign Y[7] = w2048;
  assign Y[8] = w1230;
  assign Y[9] = w0;
  assign Y[10] = w254_;
  assign Y[11] = w0;
  assign Y[12] = w54;
  assign Y[13] = w0;
  assign Y[14] = w6_;
endmodule //FIR0_MultiplyBlock


module FIR0 (
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
  wire [13:0] Y_in;

  always@(posedge clk or posedge reset) begin
    if(reset) begin
      Y <= 14'h0000;
    end  else begin
      Y <= Y_in;
    end
  end

  wire [13:0] multProducts [0:14];

  FIR0_MultiplyBlock fir_multiply(
    .X(X),
    .Y1(multProducts[0]),
    .Y2(multProducts[1]),
    .Y3(multProducts[2]),
    .Y4(multProducts[3]),
    .Y5(multProducts[4]),
    .Y6(multProducts[5]),
    .Y7(multProducts[6]),
    .Y8(multProducts[7]),
    .Y9(multProducts[8]),
    .Y10(multProducts[9]),
    .Y11(multProducts[10]),
    .Y12(multProducts[11]),
    .Y13(multProducts[12]),
    .Y14(multProducts[13]),
    .Y15(multProducts[14])
  );

  reg [13:0] firStep[0:13];

  always@(posedge clk or posedge reset) begin	// or posedge reset
    if(reset) begin
      firStep[0]  <= 14'h0000;
      firStep[1]  <= 14'h0000;
      firStep[2]  <= 14'h0000;
      firStep[3]  <= 14'h0000;
      firStep[4]  <= 14'h0000;
      firStep[5]  <= 14'h0000;
      firStep[6]  <= 14'h0000;
      firStep[7]  <= 14'h0000;
      firStep[8]  <= 14'h0000;
      firStep[9]  <= 14'h0000;
      firStep[10] <= 14'h0000;
      firStep[11] <= 14'h0000;
      firStep[12] <= 14'h0000;
      firStep[13] <= 14'h0000;
    end
    else begin
      firStep[0]  <=  multProducts[0];
      firStep[1]  <=  firStep[0] + multProducts[1];
      firStep[2]  <=  firStep[1] + multProducts[2];
      firStep[3]  <=  firStep[2] + multProducts[3];
      firStep[4]  <=  firStep[3] + multProducts[4];
      firStep[5]  <=  firStep[4] + multProducts[5];
      firStep[6]  <=  firStep[5] + multProducts[6];
      firStep[7]  <=  firStep[6] + multProducts[7];
      firStep[8]  <=  firStep[7] + multProducts[8];
      firStep[9]  <=  firStep[8] + multProducts[9];
      firStep[10] <=  firStep[9] + multProducts[10];
      firStep[11] <=  firStep[10] + multProducts[11];
      firStep[12] <=  firStep[11] + multProducts[12];
      firStep[13] <=  firStep[12] + multProducts[13];
    end
  end

  assign Y_in = firStep[13]+ multProducts[14];
endmodule //FIR0