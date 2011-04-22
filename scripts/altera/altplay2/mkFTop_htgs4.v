//
// Generated by Bluespec Compiler, version 2011.03.beta1 (build 23381, 2011-03-08)
//
// On Thu Apr 21 14:03:18 EDT 2011
//
//
// Ports:
// Name                         I/O  size props
// led                            O     8
// p200clk                        O     1
// CLK_GATE_p200clk               O     1 const
// p200rst                        O     1
// sys0_clk                       I     1
// sys0_rstn                      I     1
// usr_sw_i                       I     8 reg
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkFTop_htgs4(sys0_clk,
		    sys0_rstn,

		    usr_sw_i,

		    led,

		    p200clk,
		    CLK_GATE_p200clk,

		    p200rst);
  input  sys0_clk;
  input  sys0_rstn;

  // action method usr_sw
  input  [7 : 0] usr_sw_i;

  // value method led
  output [7 : 0] led;

  // oscillator and gates for output clock p200clk
  output p200clk;
  output CLK_GATE_p200clk;

  // output resets
  output p200rst;

  // signals for module outputs
  wire [7 : 0] led;
  wire CLK_GATE_p200clk, p200clk, p200rst;

  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;

  // register swReg
  reg [7 : 0] swReg;
  wire [7 : 0] swReg$D_IN;
  wire swReg$EN;

  // remaining internal signals
  wire swParity__h134, z__h225, z__h232, z__h239, z__h246, z__h253, z__h260;

  // oscillator and gates for output clock p200clk
  assign p200clk = sys0_clk ;
  assign CLK_GATE_p200clk = 1'd1 ;

  // output resets
  assign p200rst = sys0_rstn ;

  // value method led
  assign led = { ~swParity__h134, swParity__h134, freeCnt[31:26] } ;

  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;

  // register swReg
  assign swReg$D_IN = usr_sw_i ;
  assign swReg$EN = 1'd1 ;

  // remaining internal signals
  assign swParity__h134 = z__h260 ^ swReg[7] ;
  assign z__h225 = swReg[0] ^ swReg[1] ;
  assign z__h232 = z__h225 ^ swReg[2] ;
  assign z__h239 = z__h232 ^ swReg[3] ;
  assign z__h246 = z__h239 ^ swReg[4] ;
  assign z__h253 = z__h246 ^ swReg[5] ;
  assign z__h260 = z__h253 ^ swReg[6] ;

  // handling of inlined registers

  always@(posedge sys0_clk)
  begin
    if (!sys0_rstn)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	swReg <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (swReg$EN) swReg <= `BSV_ASSIGNMENT_DELAY swReg$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    swReg = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkFTop_htgs4

