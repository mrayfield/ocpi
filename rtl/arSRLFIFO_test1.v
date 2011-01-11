//
// Generated by Bluespec Compiler, version 2010.10.beta1 (build 22431, 2010-10-28)
//
// On Tue Jan 11 12:45:51 EST 2011
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module arSRLFIFO_test1(CLK,
		       RST_N);
  input  CLK;
  input  RST_N;

  // ports of submodule i
  wire [7 : 0] i$D_IN;
  wire i$CLR, i$DEQ, i$ENQ;

  // submodule i
  arSRLFIFO #(.width(32'd8), .l2depth(32'd5), .depth(32'd32)) i(.CLK(CLK),
								.RST_N(RST_N),
								.D_IN(i$D_IN),
								.DEQ(i$DEQ),
								.ENQ(i$ENQ),
								.CLR(i$CLR),
								.D_OUT(),
								.EMPTY_N(),
								.FULL_N());

  // submodule i
  assign i$D_IN = 8'h0 ;
  assign i$DEQ = 1'b0 ;
  assign i$ENQ = 1'b0 ;
  assign i$CLR = 1'b0 ;
endmodule  // arSRLFIFO_test1

