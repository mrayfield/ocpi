//
// Generated by Bluespec Compiler, version 2009.11.beta2 (build 18693, 2009-11-24)
//
// On Mon Oct 25 10:53:55 EDT 2010
//
//
// Ports:
// Name                         I/O  size props
// wsiS1_SThreadBusy              O     1
// wsiS1_SReset_n                 O     1
// wsiM1_MCmd                     O     3
// wsiM1_MReqLast                 O     1
// wsiM1_MBurstPrecise            O     1
// wsiM1_MBurstLength             O    12
// wsiM1_MData                    O    32 reg
// wsiM1_MByteEn                  O     4 reg
// wsiM1_MReqInfo                 O     8
// wsiM1_MReset_n                 O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// wsiS1_MCmd                     I     3
// wsiS1_MBurstLength             I    12
// wsiS1_MData                    I   128
// wsiS1_MByteEn                  I    16
// wsiS1_MReqInfo                 I     8
// wsiS1_MReqLast                 I     1
// wsiS1_MBurstPrecise            I     1
// wsiS1_MReset_n                 I     1 reg
// wsiM1_SThreadBusy              I     1 reg
// wsiM1_SReset_n                 I     1 reg
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkWsiAdapter16B4B(CLK,
			 RST_N,

			 wsiS1_MCmd,

			 wsiS1_MReqLast,

			 wsiS1_MBurstPrecise,

			 wsiS1_MBurstLength,

			 wsiS1_MData,

			 wsiS1_MByteEn,

			 wsiS1_MReqInfo,

			 wsiS1_SThreadBusy,

			 wsiS1_SReset_n,

			 wsiS1_MReset_n,

			 wsiM1_MCmd,

			 wsiM1_MReqLast,

			 wsiM1_MBurstPrecise,

			 wsiM1_MBurstLength,

			 wsiM1_MData,

			 wsiM1_MByteEn,

			 wsiM1_MReqInfo,

			 wsiM1_SThreadBusy,

			 wsiM1_MReset_n,

			 wsiM1_SReset_n);
  input  CLK;
  input  RST_N;

  // action method wsiS1_mCmd
  input  [2 : 0] wsiS1_MCmd;

  // action method wsiS1_mReqLast
  input  wsiS1_MReqLast;

  // action method wsiS1_mBurstPrecise
  input  wsiS1_MBurstPrecise;

  // action method wsiS1_mBurstLength
  input  [11 : 0] wsiS1_MBurstLength;

  // action method wsiS1_mData
  input  [127 : 0] wsiS1_MData;

  // action method wsiS1_mByteEn
  input  [15 : 0] wsiS1_MByteEn;

  // action method wsiS1_mReqInfo
  input  [7 : 0] wsiS1_MReqInfo;

  // action method wsiS1_mDataInfo

  // value method wsiS1_sThreadBusy
  output wsiS1_SThreadBusy;

  // value method wsiS1_sReset_n
  output wsiS1_SReset_n;

  // action method wsiS1_mReset_n
  input  wsiS1_MReset_n;

  // value method wsiM1_mCmd
  output [2 : 0] wsiM1_MCmd;

  // value method wsiM1_mReqLast
  output wsiM1_MReqLast;

  // value method wsiM1_mBurstPrecise
  output wsiM1_MBurstPrecise;

  // value method wsiM1_mBurstLength
  output [11 : 0] wsiM1_MBurstLength;

  // value method wsiM1_mData
  output [31 : 0] wsiM1_MData;

  // value method wsiM1_mByteEn
  output [3 : 0] wsiM1_MByteEn;

  // value method wsiM1_mReqInfo
  output [7 : 0] wsiM1_MReqInfo;

  // value method wsiM1_mDataInfo

  // action method wsiM1_sThreadBusy
  input  wsiM1_SThreadBusy;

  // value method wsiM1_mReset_n
  output wsiM1_MReset_n;

  // action method wsiM1_sReset_n
  input  wsiM1_SReset_n;

  // signals for module outputs
  wire [31 : 0] wsiM1_MData;
  wire [11 : 0] wsiM1_MBurstLength;
  wire [7 : 0] wsiM1_MReqInfo;
  wire [3 : 0] wsiM1_MByteEn;
  wire [2 : 0] wsiM1_MCmd;
  wire wsiM1_MBurstPrecise,
       wsiM1_MReqLast,
       wsiM1_MReset_n,
       wsiS1_SReset_n,
       wsiS1_SThreadBusy;

  // inlined wires
  wire [168 : 0] wsiS_wsiReq$wget;
  wire [127 : 0] wsi_Es_mData_w$wget;
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget;
  wire [15 : 0] wsi_Es_mByteEn_w$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [2 : 0] wsi_Es_mCmd_w$wget;
  wire wsiM_operateD_1$wget,
       wsiM_operateD_1$whas,
       wsiM_peerIsReady_1$wget,
       wsiM_peerIsReady_1$whas,
       wsiM_reqFifo_dequeueing$whas,
       wsiM_reqFifo_enqueueing$whas,
       wsiM_reqFifo_x_wire$whas,
       wsiM_sThreadBusy_pw$whas,
       wsiS_operateD_1$wget,
       wsiS_operateD_1$whas,
       wsiS_peerIsReady_1$wget,
       wsiS_peerIsReady_1$whas,
       wsiS_reqFifo_doResetClr$whas,
       wsiS_reqFifo_doResetDeq$whas,
       wsiS_reqFifo_doResetEnq$whas,
       wsiS_reqFifo_r_clr$whas,
       wsiS_reqFifo_r_deq$whas,
       wsiS_reqFifo_r_enq$whas,
       wsiS_sThreadBusy_dw$wget,
       wsiS_sThreadBusy_dw$whas,
       wsiS_wsiReq$whas,
       wsi_Es_mBurstLength_w$whas,
       wsi_Es_mBurstPrecise_w$whas,
       wsi_Es_mByteEn_w$whas,
       wsi_Es_mCmd_w$whas,
       wsi_Es_mDataInfo_w$whas,
       wsi_Es_mData_w$whas,
       wsi_Es_mReqInfo_w$whas,
       wsi_Es_mReqLast_w$whas;

  // register isEmpty
  reg isEmpty;
  wire isEmpty$D_IN, isEmpty$EN;

  // register isLast
  reg isLast;
  wire isLast$D_IN, isLast$EN;

  // register pos
  reg [1 : 0] pos;
  wire [1 : 0] pos$D_IN;
  wire pos$EN;

  // register req16
  reg [168 : 0] req16;
  wire [168 : 0] req16$D_IN;
  wire req16$EN;

  // register wsiM_burstKind
  reg [1 : 0] wsiM_burstKind;
  wire [1 : 0] wsiM_burstKind$D_IN;
  wire wsiM_burstKind$EN;

  // register wsiM_errorSticky
  reg wsiM_errorSticky;
  wire wsiM_errorSticky$D_IN, wsiM_errorSticky$EN;

  // register wsiM_iMesgCount
  reg [31 : 0] wsiM_iMesgCount;
  wire [31 : 0] wsiM_iMesgCount$D_IN;
  wire wsiM_iMesgCount$EN;

  // register wsiM_operateD
  reg wsiM_operateD;
  wire wsiM_operateD$D_IN, wsiM_operateD$EN;

  // register wsiM_pMesgCount
  reg [31 : 0] wsiM_pMesgCount;
  wire [31 : 0] wsiM_pMesgCount$D_IN;
  wire wsiM_pMesgCount$EN;

  // register wsiM_peerIsReady
  reg wsiM_peerIsReady;
  wire wsiM_peerIsReady$D_IN, wsiM_peerIsReady$EN;

  // register wsiM_reqFifo_c_r
  reg [1 : 0] wsiM_reqFifo_c_r;
  wire [1 : 0] wsiM_reqFifo_c_r$D_IN;
  wire wsiM_reqFifo_c_r$EN;

  // register wsiM_reqFifo_q_0
  reg [60 : 0] wsiM_reqFifo_q_0;
  reg [60 : 0] wsiM_reqFifo_q_0$D_IN;
  wire wsiM_reqFifo_q_0$EN;

  // register wsiM_reqFifo_q_1
  reg [60 : 0] wsiM_reqFifo_q_1;
  reg [60 : 0] wsiM_reqFifo_q_1$D_IN;
  wire wsiM_reqFifo_q_1$EN;

  // register wsiM_sThreadBusy_d
  reg wsiM_sThreadBusy_d;
  wire wsiM_sThreadBusy_d$D_IN, wsiM_sThreadBusy_d$EN;

  // register wsiM_statusR
  reg [7 : 0] wsiM_statusR;
  wire [7 : 0] wsiM_statusR$D_IN;
  wire wsiM_statusR$EN;

  // register wsiM_tBusyCount
  reg [31 : 0] wsiM_tBusyCount;
  wire [31 : 0] wsiM_tBusyCount$D_IN;
  wire wsiM_tBusyCount$EN;

  // register wsiM_trafficSticky
  reg wsiM_trafficSticky;
  wire wsiM_trafficSticky$D_IN, wsiM_trafficSticky$EN;

  // register wsiS_burstKind
  reg [1 : 0] wsiS_burstKind;
  wire [1 : 0] wsiS_burstKind$D_IN;
  wire wsiS_burstKind$EN;

  // register wsiS_errorSticky
  reg wsiS_errorSticky;
  wire wsiS_errorSticky$D_IN, wsiS_errorSticky$EN;

  // register wsiS_iMesgCount
  reg [31 : 0] wsiS_iMesgCount;
  wire [31 : 0] wsiS_iMesgCount$D_IN;
  wire wsiS_iMesgCount$EN;

  // register wsiS_mesgWordLength
  reg [11 : 0] wsiS_mesgWordLength;
  wire [11 : 0] wsiS_mesgWordLength$D_IN;
  wire wsiS_mesgWordLength$EN;

  // register wsiS_operateD
  reg wsiS_operateD;
  wire wsiS_operateD$D_IN, wsiS_operateD$EN;

  // register wsiS_pMesgCount
  reg [31 : 0] wsiS_pMesgCount;
  wire [31 : 0] wsiS_pMesgCount$D_IN;
  wire wsiS_pMesgCount$EN;

  // register wsiS_peerIsReady
  reg wsiS_peerIsReady;
  wire wsiS_peerIsReady$D_IN, wsiS_peerIsReady$EN;

  // register wsiS_reqFifo_countReg
  reg [1 : 0] wsiS_reqFifo_countReg;
  wire [1 : 0] wsiS_reqFifo_countReg$D_IN;
  wire wsiS_reqFifo_countReg$EN;

  // register wsiS_reqFifo_levelsValid
  reg wsiS_reqFifo_levelsValid;
  wire wsiS_reqFifo_levelsValid$D_IN, wsiS_reqFifo_levelsValid$EN;

  // register wsiS_statusR
  reg [7 : 0] wsiS_statusR;
  wire [7 : 0] wsiS_statusR$D_IN;
  wire wsiS_statusR$EN;

  // register wsiS_tBusyCount
  reg [31 : 0] wsiS_tBusyCount;
  wire [31 : 0] wsiS_tBusyCount$D_IN;
  wire wsiS_tBusyCount$EN;

  // register wsiS_trafficSticky
  reg wsiS_trafficSticky;
  wire wsiS_trafficSticky$D_IN, wsiS_trafficSticky$EN;

  // register wsiS_wordCount
  reg [11 : 0] wsiS_wordCount;
  wire [11 : 0] wsiS_wordCount$D_IN;
  wire wsiS_wordCount$EN;

  // ports of submodule wsiM_isReset
  wire wsiM_isReset$VAL;

  // ports of submodule wsiS_isReset
  wire wsiS_isReset$VAL;

  // ports of submodule wsiS_reqFifo
  wire [168 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_doRequestEgress,
       CAN_FIRE_RL_doRequestIngress,
       CAN_FIRE_RL_operating_actions,
       CAN_FIRE_RL_wsiM_ext_status_assign,
       CAN_FIRE_RL_wsiM_inc_tBusyCount,
       CAN_FIRE_RL_wsiM_operateD__dreg_update,
       CAN_FIRE_RL_wsiM_peerIsReady__dreg_update,
       CAN_FIRE_RL_wsiM_reqFifo_both,
       CAN_FIRE_RL_wsiM_reqFifo_decCtr,
       CAN_FIRE_RL_wsiM_reqFifo_deq,
       CAN_FIRE_RL_wsiM_reqFifo_incCtr,
       CAN_FIRE_RL_wsiM_sThreadBusy_reg,
       CAN_FIRE_RL_wsiM_update_statusR,
       CAN_FIRE_RL_wsiS_backpressure,
       CAN_FIRE_RL_wsiS_ext_status_assign,
       CAN_FIRE_RL_wsiS_inc_tBusyCount,
       CAN_FIRE_RL_wsiS_operateD__dreg_update,
       CAN_FIRE_RL_wsiS_peerIsReady__dreg_update,
       CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       CAN_FIRE_RL_wsiS_reqFifo_enq,
       CAN_FIRE_RL_wsiS_reqFifo_reset,
       CAN_FIRE_RL_wsiS_update_statusR,
       CAN_FIRE_RL_wsi_Es_doAlways,
       CAN_FIRE_wsiM1_sReset_n,
       CAN_FIRE_wsiM1_sThreadBusy,
       CAN_FIRE_wsiS1_mBurstLength,
       CAN_FIRE_wsiS1_mBurstPrecise,
       CAN_FIRE_wsiS1_mByteEn,
       CAN_FIRE_wsiS1_mCmd,
       CAN_FIRE_wsiS1_mData,
       CAN_FIRE_wsiS1_mDataInfo,
       CAN_FIRE_wsiS1_mReqInfo,
       CAN_FIRE_wsiS1_mReqLast,
       CAN_FIRE_wsiS1_mReset_n,
       WILL_FIRE_RL_doRequestEgress,
       WILL_FIRE_RL_doRequestIngress,
       WILL_FIRE_RL_operating_actions,
       WILL_FIRE_RL_wsiM_ext_status_assign,
       WILL_FIRE_RL_wsiM_inc_tBusyCount,
       WILL_FIRE_RL_wsiM_operateD__dreg_update,
       WILL_FIRE_RL_wsiM_peerIsReady__dreg_update,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiM_sThreadBusy_reg,
       WILL_FIRE_RL_wsiM_update_statusR,
       WILL_FIRE_RL_wsiS_backpressure,
       WILL_FIRE_RL_wsiS_ext_status_assign,
       WILL_FIRE_RL_wsiS_inc_tBusyCount,
       WILL_FIRE_RL_wsiS_operateD__dreg_update,
       WILL_FIRE_RL_wsiS_peerIsReady__dreg_update,
       WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset,
       WILL_FIRE_RL_wsiS_update_statusR,
       WILL_FIRE_RL_wsi_Es_doAlways,
       WILL_FIRE_wsiM1_sReset_n,
       WILL_FIRE_wsiM1_sThreadBusy,
       WILL_FIRE_wsiS1_mBurstLength,
       WILL_FIRE_wsiS1_mBurstPrecise,
       WILL_FIRE_wsiS1_mByteEn,
       WILL_FIRE_wsiS1_mCmd,
       WILL_FIRE_wsiS1_mData,
       WILL_FIRE_wsiS1_mDataInfo,
       WILL_FIRE_wsiS1_mReqInfo,
       WILL_FIRE_wsiS1_mReqLast,
       WILL_FIRE_wsiS1_mReset_n;

  // inputs to muxes for submodule ports
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
  wire [1 : 0] MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3;

  // remaining internal signals
  reg [31 : 0] x_data__h5554;
  reg [3 : 0] x_byteEn__h5555;
  wire wsiS_reqFifo_notFull__61_AND_wsiS_burstKind_41_ETC___d181;

  // action method wsiS1_mCmd
  assign CAN_FIRE_wsiS1_mCmd = 1'd1 ;
  assign WILL_FIRE_wsiS1_mCmd = 1'd1 ;

  // action method wsiS1_mReqLast
  assign CAN_FIRE_wsiS1_mReqLast = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReqLast = wsiS1_MReqLast ;

  // action method wsiS1_mBurstPrecise
  assign CAN_FIRE_wsiS1_mBurstPrecise = 1'd1 ;
  assign WILL_FIRE_wsiS1_mBurstPrecise = wsiS1_MBurstPrecise ;

  // action method wsiS1_mBurstLength
  assign CAN_FIRE_wsiS1_mBurstLength = 1'd1 ;
  assign WILL_FIRE_wsiS1_mBurstLength = 1'd1 ;

  // action method wsiS1_mData
  assign CAN_FIRE_wsiS1_mData = 1'd1 ;
  assign WILL_FIRE_wsiS1_mData = 1'd1 ;

  // action method wsiS1_mByteEn
  assign CAN_FIRE_wsiS1_mByteEn = 1'd1 ;
  assign WILL_FIRE_wsiS1_mByteEn = 1'd1 ;

  // action method wsiS1_mReqInfo
  assign CAN_FIRE_wsiS1_mReqInfo = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReqInfo = 1'd1 ;

  // action method wsiS1_mDataInfo
  assign CAN_FIRE_wsiS1_mDataInfo = 1'd1 ;
  assign WILL_FIRE_wsiS1_mDataInfo = 1'd1 ;

  // value method wsiS1_sThreadBusy
  assign wsiS1_SThreadBusy =
	     !CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget ;

  // value method wsiS1_sReset_n
  assign wsiS1_SReset_n = !wsiS_isReset$VAL && wsiS_operateD ;

  // action method wsiS1_mReset_n
  assign CAN_FIRE_wsiS1_mReset_n = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReset_n = wsiS1_MReset_n ;

  // value method wsiM1_mCmd
  assign wsiM1_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[60:58] ;

  // value method wsiM1_mReqLast
  assign wsiM1_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[57] ;

  // value method wsiM1_mBurstPrecise
  assign wsiM1_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[56] ;

  // value method wsiM1_mBurstLength
  assign wsiM1_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[55:44] ;

  // value method wsiM1_mData
  assign wsiM1_MData = wsiM_reqFifo_q_0[43:12] ;

  // value method wsiM1_mByteEn
  assign wsiM1_MByteEn = wsiM_reqFifo_q_0[11:8] ;

  // value method wsiM1_mReqInfo
  assign wsiM1_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;

  // action method wsiM1_sThreadBusy
  assign CAN_FIRE_wsiM1_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_wsiM1_sThreadBusy = wsiM1_SThreadBusy ;

  // value method wsiM1_mReset_n
  assign wsiM1_MReset_n = !wsiM_isReset$VAL && wsiM_operateD ;

  // action method wsiM1_sReset_n
  assign CAN_FIRE_wsiM1_sReset_n = 1'd1 ;
  assign WILL_FIRE_wsiM1_sReset_n = wsiM1_SReset_n ;

  // submodule wsiM_isReset
  ResetToBool wsiM_isReset(.RST(RST_N), .VAL(wsiM_isReset$VAL));

  // submodule wsiS_isReset
  ResetToBool wsiS_isReset(.RST(RST_N), .VAL(wsiS_isReset$VAL));

  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd169),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsiS_reqFifo(.RST_N(RST_N),
					    .CLK(CLK),
					    .D_IN(wsiS_reqFifo$D_IN),
					    .ENQ(wsiS_reqFifo$ENQ),
					    .DEQ(wsiS_reqFifo$DEQ),
					    .CLR(wsiS_reqFifo$CLR),
					    .D_OUT(wsiS_reqFifo$D_OUT),
					    .FULL_N(wsiS_reqFifo$FULL_N),
					    .EMPTY_N(wsiS_reqFifo$EMPTY_N));

  // rule RL_wsiS_backpressure
  assign CAN_FIRE_RL_wsiS_backpressure =
	     wsiS_reqFifo_levelsValid && wsiS_operateD && wsiS_peerIsReady ;
  assign WILL_FIRE_RL_wsiS_backpressure = CAN_FIRE_RL_wsiS_backpressure ;

  // rule RL_wsi_Es_doAlways
  assign CAN_FIRE_RL_wsi_Es_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_wsi_Es_doAlways = 1'd1 ;

  // rule RL_wsiS_update_statusR
  assign CAN_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_update_statusR = 1'd1 ;

  // rule RL_wsiS_ext_status_assign
  assign CAN_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;

  // rule RL_wsiS_inc_tBusyCount
  assign CAN_FIRE_RL_wsiS_inc_tBusyCount =
	     wsiS_operateD && wsiS_peerIsReady &&
	     (!CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget) ;
  assign WILL_FIRE_RL_wsiS_inc_tBusyCount = CAN_FIRE_RL_wsiS_inc_tBusyCount ;

  // rule RL_wsiS_reqFifo_enq
  assign CAN_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[168:166] == 3'd1 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_enq = CAN_FIRE_RL_wsiS_reqFifo_enq ;

  // rule RL_wsiS_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;

  // rule RL_wsiM_update_statusR
  assign CAN_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_update_statusR = 1'd1 ;

  // rule RL_wsiM_ext_status_assign
  assign CAN_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;

  // rule RL_wsiM_inc_tBusyCount
  assign CAN_FIRE_RL_wsiM_inc_tBusyCount =
	     wsiM_operateD && wsiM_peerIsReady && wsiM_sThreadBusy_d ;
  assign WILL_FIRE_RL_wsiM_inc_tBusyCount = CAN_FIRE_RL_wsiM_inc_tBusyCount ;

  // rule RL_wsiM_reqFifo_deq
  assign CAN_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;
  assign WILL_FIRE_RL_wsiM_reqFifo_deq = CAN_FIRE_RL_wsiM_reqFifo_deq ;

  // rule RL_wsiM_sThreadBusy_reg
  assign CAN_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;

  // rule RL_wsiM_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiM_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_peerIsReady__dreg_update = 1'd1 ;

  // rule RL_doRequestEgress
  assign CAN_FIRE_RL_doRequestEgress = wsiM_reqFifo_x_wire$whas ;
  assign WILL_FIRE_RL_doRequestEgress = wsiM_reqFifo_x_wire$whas ;

  // rule RL_wsiM_reqFifo_both
  assign CAN_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		wsiM_reqFifo_x_wire$whas :
		wsiM_reqFifo_c_r != 2'd2 || wsiM_reqFifo_x_wire$whas) &&
	     CAN_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_x_wire$whas ;
  assign WILL_FIRE_RL_wsiM_reqFifo_both = CAN_FIRE_RL_wsiM_reqFifo_both ;

  // rule RL_wsiM_reqFifo_decCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_decCtr =
	     CAN_FIRE_RL_wsiM_reqFifo_deq && !wsiM_reqFifo_x_wire$whas ;
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr = CAN_FIRE_RL_wsiM_reqFifo_decCtr ;

  // rule RL_wsiM_reqFifo_incCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		wsiM_reqFifo_x_wire$whas :
		wsiM_reqFifo_c_r != 2'd1 || wsiM_reqFifo_x_wire$whas) &&
	     wsiM_reqFifo_x_wire$whas &&
	     !CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr = CAN_FIRE_RL_wsiM_reqFifo_incCtr ;

  // rule RL_doRequestIngress
  assign CAN_FIRE_RL_doRequestIngress =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign WILL_FIRE_RL_doRequestIngress =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;

  // rule RL_wsiS_reqFifo_reset
  assign CAN_FIRE_RL_wsiS_reqFifo_reset =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ||
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_reset = CAN_FIRE_RL_wsiS_reqFifo_reset ;

  // rule RL_wsiS_reqFifo__updateLevelCounter
  assign CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 !=
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;

  // rule RL_operating_actions
  assign CAN_FIRE_RL_operating_actions = 1'd1 ;
  assign WILL_FIRE_RL_operating_actions = 1'd1 ;

  // rule RL_wsiS_operateD__dreg_update
  assign CAN_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;

  // rule RL_wsiM_operateD__dreg_update
  assign CAN_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 =
	     wsiS_reqFifo$EMPTY_N && isEmpty ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     { 3'd1,
	       isLast && pos == 2'd3,
	       req16[164:152],
	       x_data__h5554,
	       x_byteEn__h5555,
	       req16[7:0] } ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       61'h00000AAAAAAAAA00 ;

  // inlined wires
  assign wsiM_reqFifo_x_wire$whas = wsiM_reqFifo_c_r != 2'd2 && !isEmpty ;
  assign wsiM_reqFifo_enqueueing$whas = wsiM_reqFifo_x_wire$whas ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM1_SThreadBusy ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = 1'd1 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM1_SReset_n ;
  assign wsiS_wsiReq$wget =
	     { wsiS1_MCmd,
	       wsiS1_MReqLast,
	       wsiS1_MBurstPrecise,
	       wsiS1_MBurstLength,
	       wsiS1_MData,
	       wsiS1_MByteEn,
	       wsiS1_MReqInfo } ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_reqFifo_r_enq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;
  assign wsiS_reqFifo_r_deq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetDeq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign wsiS_operateD_1$wget = 1'd1 ;
  assign wsiS_operateD_1$whas = 1'd1 ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$whas = wsiS1_MReset_n ;
  assign wsiS_sThreadBusy_dw$wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiS_sThreadBusy_dw$whas = CAN_FIRE_RL_wsiS_backpressure ;
  assign wsi_Es_mCmd_w$wget = wsiS1_MCmd ;
  assign wsi_Es_mCmd_w$whas = 1'd1 ;
  assign wsi_Es_mReqLast_w$whas = wsiS1_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS1_MBurstPrecise ;
  assign wsi_Es_mBurstLength_w$wget = wsiS1_MBurstLength ;
  assign wsi_Es_mData_w$wget = wsiS1_MData ;
  assign wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es_mByteEn_w$wget = wsiS1_MByteEn ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$wget = wsiS1_MReqInfo ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_2 ;

  // register isEmpty
  assign isEmpty$D_IN = WILL_FIRE_RL_doRequestEgress && pos == 2'd3 ;
  assign isEmpty$EN =
	     WILL_FIRE_RL_doRequestEgress || WILL_FIRE_RL_doRequestIngress ;

  // register isLast
  assign isLast$D_IN = wsiS_reqFifo$D_OUT[165] ;
  assign isLast$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;

  // register pos
  assign pos$D_IN = pos + 2'd1 ;
  assign pos$EN = wsiM_reqFifo_x_wire$whas ;

  // register req16
  assign req16$D_IN = wsiS_reqFifo$D_OUT ;
  assign req16$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;

  // register wsiM_burstKind
  assign wsiM_burstKind$D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[57]) ;

  // register wsiM_errorSticky
  assign wsiM_errorSticky$D_IN = 1'b0 ;
  assign wsiM_errorSticky$EN = 1'b0 ;

  // register wsiM_iMesgCount
  assign wsiM_iMesgCount$D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[57] ;

  // register wsiM_operateD
  assign wsiM_operateD$D_IN = 1'b1 ;
  assign wsiM_operateD$EN = 1'd1 ;

  // register wsiM_pMesgCount
  assign wsiM_pMesgCount$D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[57] ;

  // register wsiM_peerIsReady
  assign wsiM_peerIsReady$D_IN = wsiM1_SReset_n ;
  assign wsiM_peerIsReady$EN = 1'd1 ;

  // register wsiM_reqFifo_c_r
  assign wsiM_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ?
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2 ;
  assign wsiM_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ;

  // register wsiM_reqFifo_q_0
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0$write_1__SEL_2:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end

  // register wsiM_reqFifo_q_1
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_1$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1$write_1__SEL_2:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN = 61'h00000AAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end

  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d$D_IN = wsiM1_SThreadBusy ;
  assign wsiM_sThreadBusy_d$EN = 1'd1 ;

  // register wsiM_statusR
  assign wsiM_statusR$D_IN =
	     { wsiM_isReset$VAL,
	       !wsiM_peerIsReady,
	       !wsiM_operateD,
	       wsiM_errorSticky,
	       wsiM_burstKind != 2'd0,
	       wsiM_sThreadBusy_d,
	       1'd0,
	       wsiM_trafficSticky } ;
  assign wsiM_statusR$EN = 1'd1 ;

  // register wsiM_tBusyCount
  assign wsiM_tBusyCount$D_IN = wsiM_tBusyCount + 32'd1 ;
  assign wsiM_tBusyCount$EN = CAN_FIRE_RL_wsiM_inc_tBusyCount ;

  // register wsiM_trafficSticky
  assign wsiM_trafficSticky$D_IN = 1'd1 ;
  assign wsiM_trafficSticky$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 ;

  // register wsiS_burstKind
  assign wsiS_burstKind$D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq$wget[164] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     wsiS_reqFifo_notFull__61_AND_wsiS_burstKind_41_ETC___d181 ;

  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'd1 ;
  assign wsiS_errorSticky$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && !wsiS_reqFifo$FULL_N ;

  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[165] ;

  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength$D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_wsiReq$wget[165] ;

  // register wsiS_operateD
  assign wsiS_operateD$D_IN = 1'b1 ;
  assign wsiS_operateD$EN = 1'd1 ;

  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[165] ;

  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS1_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;

  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;

  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ||
	     WILL_FIRE_RL_doRequestIngress ||
	     WILL_FIRE_RL_wsiS_reqFifo_reset ;

  // register wsiS_statusR
  assign wsiS_statusR$D_IN =
	     { wsiS_isReset$VAL,
	       !wsiS_peerIsReady,
	       !wsiS_operateD,
	       wsiS_errorSticky,
	       wsiS_burstKind != 2'd0,
	       !CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget,
	       1'd0,
	       wsiS_trafficSticky } ;
  assign wsiS_statusR$EN = 1'd1 ;

  // register wsiS_tBusyCount
  assign wsiS_tBusyCount$D_IN = wsiS_tBusyCount + 32'd1 ;
  assign wsiS_tBusyCount$EN = CAN_FIRE_RL_wsiS_inc_tBusyCount ;

  // register wsiS_trafficSticky
  assign wsiS_trafficSticky$D_IN = 1'd1 ;
  assign wsiS_trafficSticky$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;

  // register wsiS_wordCount
  assign wsiS_wordCount$D_IN =
	     wsiS_wsiReq$wget[165] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;

  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$DEQ = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign wsiS_reqFifo$ENQ = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;
  assign wsiS_reqFifo$CLR = 1'b0 ;

  // remaining internal signals
  assign wsiS_reqFifo_notFull__61_AND_wsiS_burstKind_41_ETC___d181 =
	     wsiS_reqFifo$FULL_N &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[165]) ;
  always@(pos or req16)
  begin
    case (pos)
      2'd0: x_data__h5554 = req16[55:24];
      2'd1: x_data__h5554 = req16[87:56];
      2'd2: x_data__h5554 = req16[119:88];
      2'd3: x_data__h5554 = req16[151:120];
    endcase
  end
  always@(pos or req16)
  begin
    case (pos)
      2'd0: x_byteEn__h5555 = req16[11:8];
      2'd1: x_byteEn__h5555 = req16[15:12];
      2'd2: x_byteEn__h5555 = req16[19:16];
      2'd3: x_byteEn__h5555 = req16[23:20];
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        isEmpty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	isLast <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pos <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY 61'h00000AAAAAAAAA00;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY 61'h00000AAAAAAAAA00;
	wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY 12'd1;
      end
    else
      begin
        if (isEmpty$EN) isEmpty <= `BSV_ASSIGNMENT_DELAY isEmpty$D_IN;
	if (isLast$EN) isLast <= `BSV_ASSIGNMENT_DELAY isLast$D_IN;
	if (pos$EN) pos <= `BSV_ASSIGNMENT_DELAY pos$D_IN;
	if (wsiM_burstKind$EN)
	  wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY wsiM_burstKind$D_IN;
	if (wsiM_errorSticky$EN)
	  wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiM_errorSticky$D_IN;
	if (wsiM_iMesgCount$EN)
	  wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_iMesgCount$D_IN;
	if (wsiM_operateD$EN)
	  wsiM_operateD <= `BSV_ASSIGNMENT_DELAY wsiM_operateD$D_IN;
	if (wsiM_pMesgCount$EN)
	  wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_pMesgCount$D_IN;
	if (wsiM_peerIsReady$EN)
	  wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiM_peerIsReady$D_IN;
	if (wsiM_reqFifo_c_r$EN)
	  wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_c_r$D_IN;
	if (wsiM_reqFifo_q_0$EN)
	  wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_0$D_IN;
	if (wsiM_reqFifo_q_1$EN)
	  wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_1$D_IN;
	if (wsiM_sThreadBusy_d$EN)
	  wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wsiM_sThreadBusy_d$D_IN;
	if (wsiM_tBusyCount$EN)
	  wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiM_tBusyCount$D_IN;
	if (wsiM_trafficSticky$EN)
	  wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiM_trafficSticky$D_IN;
	if (wsiS_burstKind$EN)
	  wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY wsiS_burstKind$D_IN;
	if (wsiS_errorSticky$EN)
	  wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiS_errorSticky$D_IN;
	if (wsiS_iMesgCount$EN)
	  wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_iMesgCount$D_IN;
	if (wsiS_operateD$EN)
	  wsiS_operateD <= `BSV_ASSIGNMENT_DELAY wsiS_operateD$D_IN;
	if (wsiS_pMesgCount$EN)
	  wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_pMesgCount$D_IN;
	if (wsiS_peerIsReady$EN)
	  wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiS_peerIsReady$D_IN;
	if (wsiS_reqFifo_countReg$EN)
	  wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_countReg$D_IN;
	if (wsiS_reqFifo_levelsValid$EN)
	  wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_levelsValid$D_IN;
	if (wsiS_tBusyCount$EN)
	  wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiS_tBusyCount$D_IN;
	if (wsiS_trafficSticky$EN)
	  wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiS_trafficSticky$D_IN;
	if (wsiS_wordCount$EN)
	  wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY wsiS_wordCount$D_IN;
      end
    if (req16$EN) req16 <= `BSV_ASSIGNMENT_DELAY req16$D_IN;
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
    if (wsiS_mesgWordLength$EN)
      wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY wsiS_mesgWordLength$D_IN;
    if (wsiS_statusR$EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    isEmpty = 1'h0;
    isLast = 1'h0;
    pos = 2'h2;
    req16 = 169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_c_r = 2'h2;
    wsiM_reqFifo_q_0 = 61'h0AAAAAAAAAAAAAAA;
    wsiM_reqFifo_q_1 = 61'h0AAAAAAAAAAAAAAA;
    wsiM_sThreadBusy_d = 1'h0;
    wsiM_statusR = 8'hAA;
    wsiM_tBusyCount = 32'hAAAAAAAA;
    wsiM_trafficSticky = 1'h0;
    wsiS_burstKind = 2'h2;
    wsiS_errorSticky = 1'h0;
    wsiS_iMesgCount = 32'hAAAAAAAA;
    wsiS_mesgWordLength = 12'hAAA;
    wsiS_operateD = 1'h0;
    wsiS_pMesgCount = 32'hAAAAAAAA;
    wsiS_peerIsReady = 1'h0;
    wsiS_reqFifo_countReg = 2'h2;
    wsiS_reqFifo_levelsValid = 1'h0;
    wsiS_statusR = 8'hAA;
    wsiS_tBusyCount = 32'hAAAAAAAA;
    wsiS_trafficSticky = 1'h0;
    wsiS_wordCount = 12'hAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkWsiAdapter16B4B

