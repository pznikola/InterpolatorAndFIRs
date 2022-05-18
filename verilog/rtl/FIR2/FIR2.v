module FIR2_MultiplyBlock (
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
   Y23,
   Y24,
   Y25,
   Y26,
   Y27,
   Y28,
   Y29,
   Y30,
   Y31,
   Y32,
   Y33,
   Y34,
   Y35,
   Y36,
   Y37,
   Y38,
   Y39,
   Y40,
   Y41,
   Y42,
   Y43,
   Y44,
   Y45,
   Y46,
   Y47,
   Y48,
   Y49,
   Y50,
   Y51,
   Y52,
   Y53,
   Y54,
   Y55,
   Y56,
   Y57,
   Y58,
   Y59
);

   // Port mode declarations:
   input signed   [11:0] X;
  
   output signed [11:0] Y2,  Y4,  Y6,  Y8,  Y10, Y12, Y14, Y16, Y18, Y20, Y22, Y24, Y26, Y28,
                       Y32, Y34, Y36, Y38, Y40, Y42, Y44, Y46, Y48, Y50, Y52, Y54, Y56, Y58;
   output signed [14:0] Y1, Y59;
   output signed [16:0] Y3, Y57;
   output signed [17:0] Y5, Y55;
   output signed [18:0] Y7, Y53;
   output signed [19:0] Y9, Y51;
   output signed [20:0] Y11, Y49;
   output signed [21:0] Y13, Y47;
   output signed [22:0] Y15, Y17, Y43, Y45;
   output signed [23:0] Y19, Y41;
   output signed [24:0] Y21, Y23, Y37, Y39;
   output signed [25:0] Y25, Y27, Y33, Y35;
   output signed [27:0] Y29, Y30, Y31;
  
   wire signed [11:0] W1,  W3,  W5,  W7,  W9, W11, W13, W15, W17, W19, W21, W23, W25, W27,
                        W31, W33, W35, W37, W39, W41, W43, W45, W47, W49, W51, W53, W55, W57;
   wire signed [14:0] W0, W58;
   wire signed [16:0] W2, W56;
   wire signed [17:0] W4, W54;
   wire signed [18:0] W6, W52;
   wire signed [19:0] W8, W50;
   wire signed [20:0] W10, W48;
   wire signed [21:0] W12, W46;
   wire signed [22:0] W14, W16, W42, W44;
   wire signed [23:0] W18, W40;
   wire signed [24:0] W20, W22, W36, W38;
   wire signed [25:0] W24, W26, W32, W34;
   wire signed [27:0] W28, W29, W30;

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
   assign Y24 = W23;
   assign Y25 = W24;
   assign Y26 = W25;
   assign Y27 = W26;
   assign Y28 = W27;
   assign Y29 = W28;
   assign Y30 = W29;
   assign Y31 = W30;
   assign Y32 = W31;
   assign Y33 = W32;
   assign Y34 = W33;
   assign Y35 = W34;
   assign Y36 = W35;
   assign Y37 = W36;
   assign Y38 = W37;
   assign Y39 = W38;
   assign Y40 = W39;
   assign Y41 = W40;
   assign Y42 = W41;
   assign Y43 = W42;
   assign Y44 = W43;
   assign Y45 = W44;
   assign Y46 = W45;
   assign Y47 = W46;
   assign Y48 = W47;
   assign Y49 = W48;
   assign Y50 = W49;
   assign Y51 = W50;
   assign Y52 = W51;
   assign Y53 = W52;
   assign Y54 = W53;
   assign Y55 = W54;
   assign Y56 = W55;
   assign Y57 = W56;
   assign Y58 = W57;
   assign Y59 = W58;
   

   //Multipliers:
   wire signed [11:0] w0, w1;
   wire signed [13:0] w3, w4;
   wire signed [14:0] w5, w7, w8;
   wire signed [15:0] w11, w16;
   wire signed [16:0] w17, w17_, w32;
   wire signed [17:0] w33, w44;
   wire signed [18:0] w96, w96_, w112;
   wire signed [19:0] w187, w192;
   wire signed [20:0] w264, w269, w272, w335, w335_, w352;
   wire signed [21:0] w453, w565, w640, w885, w896;
   wire signed [22:0] w906, w906_, w1401, w1408;
   wire signed [23:0] w2112, w2112_, w2260;
   wire signed [24:0] w3145, w4723, w4723_, w7080, w7168;
   wire signed [25:0] w7415, w8608, w13331, w13331_, w13595, w14160;
   wire signed [26:0] w20763;
   wire signed [27:0] w41526, w65536;

   assign w1 = X;
   assign w0 = 0;
   assign w11 = w3 + w8;
   assign w112 = w7 << 4;
   assign w13331 = w13595 - w264;
   assign w13331_ = -1 * w13331;
   assign w13595 = w14160 - w565;
   assign w1401 = w1408 - w7;
   assign w1408 = w11 << 7;
   assign w14160 = w885 << 4;
   assign w16 = w1 << 4;
   assign w17 = w1 + w16;
   assign w17_ = -1 * w17;
   assign w187 = w192 - w5;
   assign w192 = w3 << 6;
   assign w20763 = w13595 + w7168;
   assign w2112 = w33 << 6;
   assign w2112_ = -1 * w2112;
   assign w2260 = w565 << 2;
   assign w264 = w33 << 3;
   assign w269 = w272 - w3;
   assign w272 = w17 << 4;
   assign w3 = w4 - w1;
   assign w3145 = w885 + w2260;
   assign w32 = w1 << 5;
   assign w33 = w1 + w32;
   assign w335 = w352 - w17;
   assign w335_ = -1 * w335;
   assign w352 = w11 << 5;
   assign w4 = w1 << 2;
   assign w41526 = w20763 << 1;
   assign w44 = w11 << 2;
   assign w453 = w640 - w187;
   assign w4723 = w13331 - w8608;
   assign w4723_ = -1 * w4723;
   assign w5 = w1 + w4;
   assign w565 = w453 + w112;
   assign w640 = w5 << 7;
   assign w65536 = w1 << 16;
   assign w7 = w8 - w1;
   assign w7080 = w885 << 3;
   assign w7168 = w7 << 10;
   assign w7415 = w335 + w7080;
   assign w8 = w1 << 3;
   assign w8608 = w269 << 5;
   assign w885 = w896 - w11;
   assign w896 = w7 << 7;
   assign w906 = w453 << 1;
   assign w906_ = -1 * w906;
   assign w96 = w3 << 5;
   assign w96_ = -1 * w96;
   
   assign W0 = w5;
   assign W1 = w0;
   assign W2 = w17_;
   assign W3 = w0;
   assign W4 = w44;
   assign W5 = w0;
   assign W6 = w96_;
   assign W7 = w0;
   assign W8 = w187;
   assign W9 = w0;
   assign W10 = w335_;
   assign W11 = w0;
   assign W12 = w565;
   assign W13 = w0;
   assign W14 = w906_;
   assign W15 = w0;
   assign W16 = w1401;
   assign W17 = w0;
   assign W18 = w2112_;
   assign W19 = w0;
   assign W20 = w3145;
   assign W21 = w0;
   assign W22 = w4723_;
   assign W23 = w0;
   assign W24 = w7415; 
   assign W25 = w0;
   assign W26 = w13331_;
   assign W27 = w0;
   assign W28 = w41526;
   assign W29 = w65536;
   assign W30 = w41526;
   assign W31 = w0;
   assign W32 = w13331_;
   assign W33 = w0;
   assign W34 = w7415;
   assign W35 = w0;
   assign W36 = w4723_;
   assign W37 = w0;
   assign W38 = w3145;
   assign W39 = w0;
   assign W40 = w2112_;
   assign W41 = w0;
   assign W42 = w1401;
   assign W43 = w0;
   assign W44 = w906_;
   assign W45 = w0;
   assign W46 = w565;
   assign W47 = w0;
   assign W48 = w335_;
   assign W49 = w0;
   assign W50 = w187;
   assign W51 = w0;
   assign W52 = w96_;
   assign W53 = w0;
   assign W54 = w44;
   assign W55 = w0;
   assign W56 = w17_;
   assign W57 = w0;
   assign W58 = w5;
endmodule


module FIR2 (
   X,
   clk,
   Y,
   reset
);

   // Port mode declarations:
   input  [11:0] X;
   input  clk;
   output [13:0] Y;
   input  reset;

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

 
   wire signed [11:0] multProducts1,  multProducts3,  multProducts5,  multProducts7,  multProducts9, 
                      multProducts11, multProducts13, multProducts15, multProducts17, multProducts19, 
                      multProducts21, multProducts23, multProducts25, multProducts27, multProducts31, 
                      multProducts33, multProducts35, multProducts37, multProducts39, multProducts41, 
                      multProducts43, multProducts45, multProducts47, multProducts49, multProducts51, 
                      multProducts53, multProducts55, multProducts57;
   wire signed [14:0] multProducts0,  multProducts58;
   wire signed [16:0] multProducts2,  multProducts56;
   wire signed [17:0] multProducts4,  multProducts54;
   wire signed [18:0] multProducts6,  multProducts52;
   wire signed [19:0] multProducts8,  multProducts50;
   wire signed [20:0] multProducts10, multProducts48;
   wire signed [21:0] multProducts12, multProducts46;
   wire signed [22:0] multProducts14, multProducts16, multProducts42, multProducts44;
   wire signed [23:0] multProducts18, multProducts40;
   wire signed [24:0] multProducts20, multProducts22, multProducts36, multProducts38;
   wire signed [25:0] multProducts24, multProducts26, multProducts32, multProducts34;
   wire signed [27:0] multProducts28, multProducts29, multProducts30;

   FIR2_MultiplyBlock fir_multiply(
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
      .Y23(multProducts22),
      .Y24(multProducts23),
      .Y25(multProducts24),
      .Y26(multProducts25),
      .Y27(multProducts26),
      .Y28(multProducts27),
      .Y29(multProducts28),
      .Y30(multProducts29),
      .Y31(multProducts30),
      .Y32(multProducts31),
      .Y33(multProducts32),
      .Y34(multProducts33),
      .Y35(multProducts34),
      .Y36(multProducts35),
      .Y37(multProducts36),
      .Y38(multProducts37),
      .Y39(multProducts38),
      .Y40(multProducts39),
      .Y41(multProducts40),
      .Y42(multProducts41),
      .Y43(multProducts42),
      .Y44(multProducts43),
      .Y45(multProducts44),
      .Y46(multProducts45),
      .Y47(multProducts46),
      .Y48(multProducts47),
      .Y49(multProducts48),
      .Y50(multProducts49),
      .Y51(multProducts50),
      .Y52(multProducts51),
      .Y53(multProducts52),
      .Y54(multProducts53),
      .Y55(multProducts54),
      .Y56(multProducts55),
      .Y57(multProducts56),
      .Y58(multProducts57),
      .Y59(multProducts58)
  );
  

   reg signed [14:0] firStep0, firStep1;
   reg signed [16:0] firStep2, firStep3;
   reg signed [17:0] firStep4, firStep5;
   reg signed [18:0] firStep6, firStep7;
   reg signed [19:0] firStep8, firStep9;
   reg signed [20:0] firStep10, firStep11;
   reg signed [21:0] firStep12, firStep13, firStep14, firStep15;
   reg signed [22:0] firStep16, firStep17;
   reg signed [23:0] firStep18, firStep19, firStep20, firStep21;
   reg signed [24:0] firStep22, firStep23, firStep24, firStep25;
   reg signed [25:0] firStep26, firStep27;
   reg signed [27:0] firStep28;
   reg signed [28:0] firStep29;
   reg signed [29:0] firStep30, firStep31, firStep32, firStep33, firStep34, firStep35, firStep36, firStep37,
                     firStep38, firStep39, firStep40, firStep41, firStep42, firStep43, firStep44, firStep45,
                     firStep46, firStep47, firStep48, firStep49, firStep50, firStep51, firStep52, firStep53,
                     firStep54, firStep55, firStep56, firStep57;

   always@(posedge clk or posedge reset) begin
      if(reset) begin
         firStep0  <= 15'h0000;
         firStep1  <= 15'h0000;
         firStep2  <= 17'h00000;
         firStep3  <= 17'h00000;
         firStep4  <= 18'h00000;
         firStep5  <= 18'h00000;
         firStep6  <= 19'h00000;
         firStep7  <= 19'h00000;
         firStep8  <= 20'h00000;
         firStep9  <= 20'h00000;
         firStep10 <= 21'h000000;
         firStep11 <= 21'h000000;
         firStep12 <= 22'h000000;
         firStep13 <= 22'h000000;
         firStep14 <= 22'h000000;
         firStep15 <= 22'h000000;
         firStep16 <= 23'h000000;
         firStep17 <= 23'h000000;
         firStep18 <= 24'h000000;
         firStep19 <= 24'h000000;
         firStep20 <= 24'h000000;
         firStep21 <= 24'h000000;
         firStep22 <= 25'h0000000;
         firStep23 <= 25'h0000000;
         firStep24 <= 25'h0000000;
         firStep25 <= 25'h0000000;
         firStep26 <= 26'h0000000;
         firStep27 <= 26'h0000000;
         firStep28 <= 28'h0000000;
         firStep29 <= 29'h00000000;
         firStep30 <= 30'h00000000;
         firStep31 <= 30'h00000000;
         firStep32 <= 30'h00000000;
         firStep33 <= 30'h00000000;
         firStep34 <= 30'h00000000;
         firStep35 <= 30'h00000000;
         firStep36 <= 30'h00000000;
         firStep37 <= 30'h00000000;
         firStep38 <= 30'h00000000;
         firStep39 <= 30'h00000000;
         firStep40 <= 30'h00000000;
         firStep41 <= 30'h00000000;
         firStep42 <= 30'h00000000;
         firStep43 <= 30'h00000000;
         firStep44 <= 30'h00000000;
         firStep45 <= 30'h00000000;
         firStep46 <= 30'h00000000;
         firStep47 <= 30'h00000000;
         firStep48 <= 30'h00000000;
         firStep49 <= 30'h00000000;
         firStep50 <= 30'h00000000;
         firStep51 <= 30'h00000000;
         firStep52 <= 30'h00000000;
         firStep53 <= 30'h00000000;
         firStep54 <= 30'h00000000;
         firStep55 <= 30'h00000000;
         firStep56 <= 30'h00000000;
         firStep57 <= 30'h00000000;
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
         firStep22 <=  firStep21 + multProducts22;
         firStep23 <=  firStep22 + multProducts23;
         firStep24 <=  firStep23 + multProducts24;
         firStep25 <=  firStep24 + multProducts25;
         firStep26 <=  firStep25 + multProducts26;
         firStep27 <=  firStep26 + multProducts27;
         firStep28 <=  firStep27 + multProducts28;
         firStep29 <=  firStep28 + multProducts29;
         firStep30 <=  firStep29 + multProducts30;
         firStep31 <=  firStep30 + multProducts31;
         firStep32 <=  firStep31 + multProducts32;
         firStep33 <=  firStep32 + multProducts33;
         firStep34 <=  firStep33 + multProducts34;
         firStep35 <=  firStep34 + multProducts35;
         firStep36 <=  firStep35 + multProducts36;
         firStep37 <=  firStep36 + multProducts37;
         firStep38 <=  firStep37 + multProducts38;
         firStep39 <=  firStep38 + multProducts39;
         firStep40 <=  firStep39 + multProducts40;
         firStep41 <=  firStep40 + multProducts41;
         firStep42 <=  firStep41 + multProducts42;
         firStep43 <=  firStep42 + multProducts43;
         firStep44 <=  firStep43 + multProducts44;
         firStep45 <=  firStep44 + multProducts45;
         firStep46 <=  firStep45 + multProducts46;
         firStep47 <=  firStep46 + multProducts47;
         firStep48 <=  firStep47 + multProducts48;
         firStep49 <=  firStep48 + multProducts49;
         firStep50 <=  firStep49 + multProducts50;
         firStep51 <=  firStep50 + multProducts51;
         firStep52 <=  firStep51 + multProducts52;
         firStep53 <=  firStep52 + multProducts53;
         firStep54 <=  firStep53 + multProducts54;
         firStep55 <=  firStep54 + multProducts55;
         firStep56 <=  firStep55 + multProducts56;
         firStep57 <=  firStep56 + multProducts57;

      end
   end

   assign Y_in = firStep57+ multProducts58;
endmodule
