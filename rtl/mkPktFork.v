//
// Generated by Bluespec Compiler, version 2012.09.beta1 (build 29570, 2012-09.11)
//
// On Sun Oct  7 14:21:22 EDT 2012
//
//
// Ports:
// Name                         I/O  size props
// RDY_iport_put                  O     1 reg
// oport0_get                     O   153 reg
// RDY_oport0_get                 O     1 reg
// oport1_get                     O   153 reg
// RDY_oport1_get                 O     1 reg
// pfk                            I    14
// CLK                            I     1 clock
// RST_N                          I     1 reset
// iport_put                      I   153 reg
// EN_iport_put                   I     1
// EN_oport0_get                  I     1
// EN_oport1_get                  I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkPktFork(pfk,
		 CLK,
		 RST_N,

		 iport_put,
		 EN_iport_put,
		 RDY_iport_put,

		 EN_oport0_get,
		 oport0_get,
		 RDY_oport0_get,

		 EN_oport1_get,
		 oport1_get,
		 RDY_oport1_get);
  input  [13 : 0] pfk;
  input  CLK;
  input  RST_N;

  // action method iport_put
  input  [152 : 0] iport_put;
  input  EN_iport_put;
  output RDY_iport_put;

  // actionvalue method oport0_get
  input  EN_oport0_get;
  output [152 : 0] oport0_get;
  output RDY_oport0_get;

  // actionvalue method oport1_get
  input  EN_oport1_get;
  output [152 : 0] oport1_get;
  output RDY_oport1_get;

  // signals for module outputs
  wire [152 : 0] oport0_get, oport1_get;
  wire RDY_iport_put, RDY_oport0_get, RDY_oport1_get;

  // register f0Active
  reg f0Active;
  wire f0Active$D_IN, f0Active$EN;

  // register f1Active
  reg f1Active;
  wire f1Active$D_IN, f1Active$EN;

  // ports of submodule fi
  wire [152 : 0] fi$D_IN, fi$D_OUT;
  wire fi$CLR, fi$DEQ, fi$EMPTY_N, fi$ENQ, fi$FULL_N;

  // ports of submodule fo0
  wire [152 : 0] fo0$D_IN, fo0$D_OUT;
  wire fo0$CLR, fo0$DEQ, fo0$EMPTY_N, fo0$ENQ, fo0$FULL_N;

  // ports of submodule fo1
  wire [152 : 0] fo1$D_IN, fo1$D_OUT;
  wire fo1$CLR, fo1$DEQ, fo1$EMPTY_N, fo1$ENQ, fo1$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_fo0_advance,
       WILL_FIRE_RL_fo1_advance,
       WILL_FIRE_RL_select;

  // inputs to muxes for submodule ports
  wire MUX_f0Active$write_1__SEL_1, MUX_f1Active$write_1__SEL_1;

  // remaining internal signals
  reg IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59;
  wire [6 : 0] y__h729, y__h954;
  wire IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d31,
       IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d40,
       fi_first_BITS_63_TO_56_3_EQ_pfk_BITS_7_TO_0_4___d56,
       fi_i_notEmpty_AND_IF_IF_pfk_BITS_13_TO_12_3_EQ_ETC___d45;

  // action method iport_put
  assign RDY_iport_put = fi$FULL_N ;

  // actionvalue method oport0_get
  assign oport0_get = fo0$D_OUT ;
  assign RDY_oport0_get = fo0$EMPTY_N ;

  // actionvalue method oport1_get
  assign oport1_get = fo1$D_OUT ;
  assign RDY_oport1_get = fo1$EMPTY_N ;

  // submodule fi
  FIFO2 #(.width(32'd153), .guarded(32'd1)) fi(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(fi$D_IN),
					       .ENQ(fi$ENQ),
					       .DEQ(fi$DEQ),
					       .CLR(fi$CLR),
					       .D_OUT(fi$D_OUT),
					       .FULL_N(fi$FULL_N),
					       .EMPTY_N(fi$EMPTY_N));

  // submodule fo0
  FIFO2 #(.width(32'd153), .guarded(32'd1)) fo0(.RST(RST_N),
						.CLK(CLK),
						.D_IN(fo0$D_IN),
						.ENQ(fo0$ENQ),
						.DEQ(fo0$DEQ),
						.CLR(fo0$CLR),
						.D_OUT(fo0$D_OUT),
						.FULL_N(fo0$FULL_N),
						.EMPTY_N(fo0$EMPTY_N));

  // submodule fo1
  FIFO2 #(.width(32'd153), .guarded(32'd1)) fo1(.RST(RST_N),
						.CLK(CLK),
						.D_IN(fo1$D_IN),
						.ENQ(fo1$ENQ),
						.DEQ(fo1$DEQ),
						.CLR(fo1$CLR),
						.D_OUT(fo1$D_OUT),
						.FULL_N(fo1$FULL_N),
						.EMPTY_N(fo1$EMPTY_N));

  // rule RL_fo0_advance
  assign WILL_FIRE_RL_fo0_advance = fi$EMPTY_N && fo0$FULL_N && f0Active ;

  // rule RL_fo1_advance
  assign WILL_FIRE_RL_fo1_advance =
	     fi$EMPTY_N && fo1$FULL_N && f1Active &&
	     !WILL_FIRE_RL_fo0_advance ;

  // rule RL_select
  assign WILL_FIRE_RL_select =
	     fi_i_notEmpty_AND_IF_IF_pfk_BITS_13_TO_12_3_EQ_ETC___d45 &&
	     !f0Active &&
	     !f1Active ;

  // inputs to muxes for submodule ports
  assign MUX_f0Active$write_1__SEL_1 =
	     WILL_FIRE_RL_select &&
	     IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ;
  assign MUX_f1Active$write_1__SEL_1 =
	     WILL_FIRE_RL_select &&
	     !IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ;

  // register f0Active
  assign f0Active$D_IN =
	     MUX_f0Active$write_1__SEL_1 ? !fi$D_OUT[151] : !fi$D_OUT[151] ;
  assign f0Active$EN =
	     WILL_FIRE_RL_select &&
	     IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ||
	     WILL_FIRE_RL_fo0_advance ;

  // register f1Active
  assign f1Active$D_IN =
	     MUX_f1Active$write_1__SEL_1 ? !fi$D_OUT[151] : !fi$D_OUT[151] ;
  assign f1Active$EN =
	     WILL_FIRE_RL_select &&
	     !IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ||
	     WILL_FIRE_RL_fo1_advance ;

  // submodule fi
  assign fi$D_IN = iport_put ;
  assign fi$ENQ = EN_iport_put ;
  assign fi$DEQ =
	     WILL_FIRE_RL_select || WILL_FIRE_RL_fo1_advance ||
	     WILL_FIRE_RL_fo0_advance ;
  assign fi$CLR = 1'b0 ;

  // submodule fo0
  assign fo0$D_IN = fi$D_OUT ;
  assign fo0$ENQ =
	     WILL_FIRE_RL_select &&
	     IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ||
	     WILL_FIRE_RL_fo0_advance ;
  assign fo0$DEQ = EN_oport0_get ;
  assign fo0$CLR = 1'b0 ;

  // submodule fo1
  assign fo1$D_IN = fi$D_OUT ;
  assign fo1$ENQ =
	     WILL_FIRE_RL_select &&
	     !IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ||
	     WILL_FIRE_RL_fo1_advance ;
  assign fo1$DEQ = EN_oport1_get ;
  assign fo1$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d31 =
	     (fi$D_OUT[124:120] == 5'b01010) ?
	       fi$D_OUT[50:48] == pfk[2:0] :
	       fi$D_OUT[150:144] == y__h954 && pfk[3] == fi$D_OUT[47] ;
  assign IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d40 =
	     (fi$D_OUT[124:120] == 5'b01010) ?
	       fi_first_BITS_63_TO_56_3_EQ_pfk_BITS_7_TO_0_4___d56 :
	       pfk[11:8] == fi$D_OUT[60:57] ;
  assign fi_first_BITS_63_TO_56_3_EQ_pfk_BITS_7_TO_0_4___d56 =
	     fi$D_OUT[63:56] == pfk[7:0] ;
  assign fi_i_notEmpty_AND_IF_IF_pfk_BITS_13_TO_12_3_EQ_ETC___d45 =
	     fi$EMPTY_N &&
	     (IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 ?
		fo0$FULL_N :
		fo1$FULL_N) ;
  assign y__h729 = 7'd1 << pfk[2:0] ;
  assign y__h954 = 7'd1 << pfk[6:4] ;
  always@(pfk or
	  IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d40 or
	  fi$D_OUT or
	  y__h729 or
	  fi_first_BITS_63_TO_56_3_EQ_pfk_BITS_7_TO_0_4___d56 or
	  IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d31)
  begin
    case (pfk[13:12])
      2'd0:
	  IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 =
	      fi$D_OUT[150:144] == y__h729;
      2'd1:
	  IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 =
	      fi_first_BITS_63_TO_56_3_EQ_pfk_BITS_7_TO_0_4___d56 &&
	      fi$D_OUT[124:120] == 5'b01010;
      2'd2:
	  IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 =
	      IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d31;
      2'd3:
	  IF_pfk_BITS_13_TO_12_3_EQ_0_4_THEN_fi_first_BI_ETC___d59 =
	      IF_fi_first_BITS_124_TO_120_0_EQ_0b1010_1_THEN_ETC___d40;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        f0Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
	f1Active <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (f0Active$EN) f0Active <= `BSV_ASSIGNMENT_DELAY f0Active$D_IN;
	if (f1Active$EN) f1Active <= `BSV_ASSIGNMENT_DELAY f1Active$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    f0Active = 1'h0;
    f1Active = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkPktFork

