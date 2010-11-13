//
// Generated by Bluespec Compiler, version 2010.10.beta1 (build 22431, 2010-10-28)
//
// On Sat Nov 13 15:25:32 EST 2010
//
//
// Ports:
// Name                         I/O  size props
// RDY_pmem_put                   O     1
// monId                          I     8
// CLK                            I     1 clock
// RST_N                          I     1 reset
// wciO0_MCmd                     I     3 reg
// wciO0_MAddrSpace               I     1 reg
// wciO0_MByteEn                  I     4 reg
// wciO0_MAddr                    I    20 reg
// wciO0_MData                    I    32 reg
// wciO0_SResp                    I     2 reg
// wciO0_SData                    I    32 reg
// wciO0_SFlag                    I     2 reg
// wciO0_MFlag                    I     2 reg
// pmem_put                       I    33
// wciO0_SThreadBusy              I     1 reg
// EN_pmem_put                    I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkWciOcpMonitor(monId,
		       CLK,
		       RST_N,

		       wciO0_MCmd,

		       wciO0_MAddrSpace,

		       wciO0_MByteEn,

		       wciO0_MAddr,

		       wciO0_MData,

		       wciO0_SResp,

		       wciO0_SData,

		       wciO0_SThreadBusy,

		       wciO0_SFlag,

		       wciO0_MFlag,

		       pmem_put,
		       EN_pmem_put,
		       RDY_pmem_put);
  input  [7 : 0] monId;
  input  CLK;
  input  RST_N;

  // action method wciO0_mCmd
  input  [2 : 0] wciO0_MCmd;

  // action method wciO0_mAddrSpace
  input  wciO0_MAddrSpace;

  // action method wciO0_mByteEn
  input  [3 : 0] wciO0_MByteEn;

  // action method wciO0_mAddr
  input  [19 : 0] wciO0_MAddr;

  // action method wciO0_mData
  input  [31 : 0] wciO0_MData;

  // action method wciO0_sResp
  input  [1 : 0] wciO0_SResp;

  // action method wciO0_sData
  input  [31 : 0] wciO0_SData;

  // action method wciO0_sThreadBusy
  input  wciO0_SThreadBusy;

  // action method wciO0_sFlag
  input  [1 : 0] wciO0_SFlag;

  // action method wciO0_mFlag
  input  [1 : 0] wciO0_MFlag;

  // action method pmem_put
  input  [32 : 0] pmem_put;
  input  EN_pmem_put;
  output RDY_pmem_put;

  // signals for module outputs
  wire RDY_pmem_put;

  // inlined wires
  wire observer_eCmd_1$wget,
       observer_eCmd_1$whas,
       observer_r_sThreadBusy_1$wget,
       observer_r_sThreadBusy_1$whas;

  // register observer_eCmd
  reg observer_eCmd;
  wire observer_eCmd$D_IN, observer_eCmd$EN;

  // register observer_r_mAddr
  reg [19 : 0] observer_r_mAddr;
  wire [19 : 0] observer_r_mAddr$D_IN;
  wire observer_r_mAddr$EN;

  // register observer_r_mAddrSpace
  reg observer_r_mAddrSpace;
  wire observer_r_mAddrSpace$D_IN, observer_r_mAddrSpace$EN;

  // register observer_r_mByteEn
  reg [3 : 0] observer_r_mByteEn;
  wire [3 : 0] observer_r_mByteEn$D_IN;
  wire observer_r_mByteEn$EN;

  // register observer_r_mCmd
  reg [2 : 0] observer_r_mCmd;
  wire [2 : 0] observer_r_mCmd$D_IN;
  wire observer_r_mCmd$EN;

  // register observer_r_mCmdD
  reg [2 : 0] observer_r_mCmdD;
  wire [2 : 0] observer_r_mCmdD$D_IN;
  wire observer_r_mCmdD$EN;

  // register observer_r_mData
  reg [31 : 0] observer_r_mData;
  wire [31 : 0] observer_r_mData$D_IN;
  wire observer_r_mData$EN;

  // register observer_r_mFlag
  reg [1 : 0] observer_r_mFlag;
  wire [1 : 0] observer_r_mFlag$D_IN;
  wire observer_r_mFlag$EN;

  // register observer_r_sData
  reg [31 : 0] observer_r_sData;
  wire [31 : 0] observer_r_sData$D_IN;
  wire observer_r_sData$EN;

  // register observer_r_sFlag
  reg [1 : 0] observer_r_sFlag;
  wire [1 : 0] observer_r_sFlag$D_IN;
  wire observer_r_sFlag$EN;

  // register observer_r_sResp
  reg [1 : 0] observer_r_sResp;
  wire [1 : 0] observer_r_sResp$D_IN;
  wire observer_r_sResp$EN;

  // register observer_r_sThreadBusy
  reg observer_r_sThreadBusy;
  wire observer_r_sThreadBusy$D_IN, observer_r_sThreadBusy$EN;

  // register pmemgen_dwRemain
  reg [1 : 0] pmemgen_dwRemain;
  wire [1 : 0] pmemgen_dwRemain$D_IN;
  wire pmemgen_dwRemain$EN;

  // register pmemgen_srcTag
  reg [7 : 0] pmemgen_srcTag;
  wire [7 : 0] pmemgen_srcTag$D_IN;
  wire pmemgen_srcTag$EN;

  // ports of submodule pmemgen_evF
  wire [73 : 0] pmemgen_evF$D_IN, pmemgen_evF$D_OUT;
  wire pmemgen_evF$CLR,
       pmemgen_evF$DEQ,
       pmemgen_evF$EMPTY_N,
       pmemgen_evF$ENQ,
       pmemgen_evF$FULL_N;

  // ports of submodule pmemgen_pmemF
  reg [32 : 0] pmemgen_pmemF$D_IN;
  wire pmemgen_pmemF$CLR,
       pmemgen_pmemF$DEQ,
       pmemgen_pmemF$ENQ,
       pmemgen_pmemF$FULL_N;

  // rule scheduling signals
  wire CAN_FIRE_RL_event_cmd,
       CAN_FIRE_RL_foop2,
       CAN_FIRE_RL_observer_cmd_start,
       CAN_FIRE_RL_observer_eCmd__dreg_update,
       CAN_FIRE_RL_observer_foop,
       CAN_FIRE_RL_observer_mCmd_state,
       CAN_FIRE_RL_observer_r_sThreadBusy__dreg_update,
       CAN_FIRE_RL_pmemgen_foop4,
       CAN_FIRE_RL_pmemgen_gen_message_body,
       CAN_FIRE_RL_pmemgen_gen_message_head,
       CAN_FIRE_pmem_put,
       CAN_FIRE_wciO0_mAddr,
       CAN_FIRE_wciO0_mAddrSpace,
       CAN_FIRE_wciO0_mByteEn,
       CAN_FIRE_wciO0_mCmd,
       CAN_FIRE_wciO0_mData,
       CAN_FIRE_wciO0_mFlag,
       CAN_FIRE_wciO0_sData,
       CAN_FIRE_wciO0_sFlag,
       CAN_FIRE_wciO0_sResp,
       CAN_FIRE_wciO0_sThreadBusy,
       WILL_FIRE_RL_event_cmd,
       WILL_FIRE_RL_foop2,
       WILL_FIRE_RL_observer_cmd_start,
       WILL_FIRE_RL_observer_eCmd__dreg_update,
       WILL_FIRE_RL_observer_foop,
       WILL_FIRE_RL_observer_mCmd_state,
       WILL_FIRE_RL_observer_r_sThreadBusy__dreg_update,
       WILL_FIRE_RL_pmemgen_foop4,
       WILL_FIRE_RL_pmemgen_gen_message_body,
       WILL_FIRE_RL_pmemgen_gen_message_head,
       WILL_FIRE_pmem_put,
       WILL_FIRE_wciO0_mAddr,
       WILL_FIRE_wciO0_mAddrSpace,
       WILL_FIRE_wciO0_mByteEn,
       WILL_FIRE_wciO0_mCmd,
       WILL_FIRE_wciO0_mData,
       WILL_FIRE_wciO0_mFlag,
       WILL_FIRE_wciO0_sData,
       WILL_FIRE_wciO0_sFlag,
       WILL_FIRE_wciO0_sResp,
       WILL_FIRE_wciO0_sThreadBusy;

  // inputs to muxes for submodule ports
  reg [1 : 0] MUX_pmemgen_dwRemain$write_1__VAL_2;
  wire [32 : 0] MUX_pmemgen_pmemF$enq_1__VAL_2,
		MUX_pmemgen_pmemF$enq_1__VAL_3;
  wire [1 : 0] MUX_pmemgen_dwRemain$write_1__VAL_1;

  // remaining internal signals
  reg [63 : 0] v__h1758, v__h1842, v__h924, v__h966;
  reg [31 : 0] CASE_pmemgen_evFD_OUT_BITS_73_TO_72_d610_0_0__ETC__q1;
  reg [7 : 0] x__h1568;
  wire [31 : 0] d__h1610;

  // action method wciO0_mCmd
  assign CAN_FIRE_wciO0_mCmd = 1'd1 ;
  assign WILL_FIRE_wciO0_mCmd = 1'd1 ;

  // action method wciO0_mAddrSpace
  assign CAN_FIRE_wciO0_mAddrSpace = 1'd1 ;
  assign WILL_FIRE_wciO0_mAddrSpace = 1'd1 ;

  // action method wciO0_mByteEn
  assign CAN_FIRE_wciO0_mByteEn = 1'd1 ;
  assign WILL_FIRE_wciO0_mByteEn = 1'd1 ;

  // action method wciO0_mAddr
  assign CAN_FIRE_wciO0_mAddr = 1'd1 ;
  assign WILL_FIRE_wciO0_mAddr = 1'd1 ;

  // action method wciO0_mData
  assign CAN_FIRE_wciO0_mData = 1'd1 ;
  assign WILL_FIRE_wciO0_mData = 1'd1 ;

  // action method wciO0_sResp
  assign CAN_FIRE_wciO0_sResp = 1'd1 ;
  assign WILL_FIRE_wciO0_sResp = 1'd1 ;

  // action method wciO0_sData
  assign CAN_FIRE_wciO0_sData = 1'd1 ;
  assign WILL_FIRE_wciO0_sData = 1'd1 ;

  // action method wciO0_sThreadBusy
  assign CAN_FIRE_wciO0_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_wciO0_sThreadBusy = wciO0_SThreadBusy ;

  // action method wciO0_sFlag
  assign CAN_FIRE_wciO0_sFlag = 1'd1 ;
  assign WILL_FIRE_wciO0_sFlag = 1'd1 ;

  // action method wciO0_mFlag
  assign CAN_FIRE_wciO0_mFlag = 1'd1 ;
  assign WILL_FIRE_wciO0_mFlag = 1'd1 ;

  // action method pmem_put
  assign RDY_pmem_put = pmemgen_pmemF$FULL_N ;
  assign CAN_FIRE_pmem_put = pmemgen_pmemF$FULL_N ;
  assign WILL_FIRE_pmem_put = EN_pmem_put ;

  // submodule pmemgen_evF
  FIFO2 #(.width(32'd74), .guarded(32'd1)) pmemgen_evF(.RST_N(RST_N),
						       .CLK(CLK),
						       .D_IN(pmemgen_evF$D_IN),
						       .ENQ(pmemgen_evF$ENQ),
						       .DEQ(pmemgen_evF$DEQ),
						       .CLR(pmemgen_evF$CLR),
						       .D_OUT(pmemgen_evF$D_OUT),
						       .FULL_N(pmemgen_evF$FULL_N),
						       .EMPTY_N(pmemgen_evF$EMPTY_N));

  // submodule pmemgen_pmemF
  FIFO2 #(.width(32'd33), .guarded(32'd1)) pmemgen_pmemF(.RST_N(RST_N),
							 .CLK(CLK),
							 .D_IN(pmemgen_pmemF$D_IN),
							 .ENQ(pmemgen_pmemF$ENQ),
							 .DEQ(pmemgen_pmemF$DEQ),
							 .CLR(pmemgen_pmemF$CLR),
							 .D_OUT(),
							 .FULL_N(pmemgen_pmemF$FULL_N),
							 .EMPTY_N());

  // rule RL_observer_cmd_start
  assign CAN_FIRE_RL_observer_cmd_start =
	     observer_r_mCmdD == 3'd0 && observer_r_mCmd != 3'd0 ;
  assign WILL_FIRE_RL_observer_cmd_start = CAN_FIRE_RL_observer_cmd_start ;

  // rule RL_observer_mCmd_state
  assign CAN_FIRE_RL_observer_mCmd_state = 1'd1 ;
  assign WILL_FIRE_RL_observer_mCmd_state = 1'd1 ;

  // rule RL_event_cmd
  assign CAN_FIRE_RL_event_cmd = pmemgen_evF$FULL_N && observer_eCmd ;
  assign WILL_FIRE_RL_event_cmd = CAN_FIRE_RL_event_cmd ;

  // rule RL_foop2
  assign CAN_FIRE_RL_foop2 = 1'd1 ;
  assign WILL_FIRE_RL_foop2 = 1'd1 ;

  // rule RL_observer_foop
  assign CAN_FIRE_RL_observer_foop = 1'd1 ;
  assign WILL_FIRE_RL_observer_foop = 1'd1 ;

  // rule RL_observer_r_sThreadBusy__dreg_update
  assign CAN_FIRE_RL_observer_r_sThreadBusy__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_observer_r_sThreadBusy__dreg_update = 1'd1 ;

  // rule RL_observer_eCmd__dreg_update
  assign CAN_FIRE_RL_observer_eCmd__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_observer_eCmd__dreg_update = 1'd1 ;

  // rule RL_pmemgen_gen_message_head
  assign CAN_FIRE_RL_pmemgen_gen_message_head =
	     pmemgen_evF$EMPTY_N && pmemgen_pmemF$FULL_N &&
	     pmemgen_dwRemain == 2'd0 ;
  assign WILL_FIRE_RL_pmemgen_gen_message_head =
	     CAN_FIRE_RL_pmemgen_gen_message_head && !EN_pmem_put ;

  // rule RL_pmemgen_gen_message_body
  assign CAN_FIRE_RL_pmemgen_gen_message_body =
	     pmemgen_evF$EMPTY_N && pmemgen_pmemF$FULL_N &&
	     pmemgen_dwRemain != 2'd0 ;
  assign WILL_FIRE_RL_pmemgen_gen_message_body =
	     CAN_FIRE_RL_pmemgen_gen_message_body && !EN_pmem_put ;

  // rule RL_pmemgen_foop4
  assign CAN_FIRE_RL_pmemgen_foop4 = 1'd1 ;
  assign WILL_FIRE_RL_pmemgen_foop4 = 1'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_pmemgen_dwRemain$write_1__VAL_1 = pmemgen_dwRemain - 2'd1 ;
  always@(pmemgen_evF$D_OUT)
  begin
    case (pmemgen_evF$D_OUT[73:72])
      2'd0, 2'd1:
	  MUX_pmemgen_dwRemain$write_1__VAL_2 = pmemgen_evF$D_OUT[73:72];
      default: MUX_pmemgen_dwRemain$write_1__VAL_2 = 2'd2;
    endcase
  end
  assign MUX_pmemgen_pmemF$enq_1__VAL_2 =
	     { 1'd0, monId, 8'd0, pmemgen_srcTag, x__h1568 } ;
  assign MUX_pmemgen_pmemF$enq_1__VAL_3 =
	     { 1'd1, CASE_pmemgen_evFD_OUT_BITS_73_TO_72_d610_0_0__ETC__q1 } ;

  // inlined wires
  assign observer_r_sThreadBusy_1$wget = 1'b1 ;
  assign observer_r_sThreadBusy_1$whas = wciO0_SThreadBusy ;
  assign observer_eCmd_1$wget = 1'd1 ;
  assign observer_eCmd_1$whas = CAN_FIRE_RL_observer_cmd_start ;

  // register observer_eCmd
  assign observer_eCmd$D_IN = CAN_FIRE_RL_observer_cmd_start ;
  assign observer_eCmd$EN = 1'd1 ;

  // register observer_r_mAddr
  assign observer_r_mAddr$D_IN = wciO0_MAddr ;
  assign observer_r_mAddr$EN = 1'd1 ;

  // register observer_r_mAddrSpace
  assign observer_r_mAddrSpace$D_IN = wciO0_MAddrSpace ;
  assign observer_r_mAddrSpace$EN = 1'd1 ;

  // register observer_r_mByteEn
  assign observer_r_mByteEn$D_IN = wciO0_MByteEn ;
  assign observer_r_mByteEn$EN = 1'd1 ;

  // register observer_r_mCmd
  assign observer_r_mCmd$D_IN = wciO0_MCmd ;
  assign observer_r_mCmd$EN = 1'd1 ;

  // register observer_r_mCmdD
  assign observer_r_mCmdD$D_IN = observer_r_mCmd ;
  assign observer_r_mCmdD$EN = 1'd1 ;

  // register observer_r_mData
  assign observer_r_mData$D_IN = wciO0_MData ;
  assign observer_r_mData$EN = 1'd1 ;

  // register observer_r_mFlag
  assign observer_r_mFlag$D_IN = wciO0_MFlag ;
  assign observer_r_mFlag$EN = 1'd1 ;

  // register observer_r_sData
  assign observer_r_sData$D_IN = wciO0_SData ;
  assign observer_r_sData$EN = 1'd1 ;

  // register observer_r_sFlag
  assign observer_r_sFlag$D_IN = wciO0_SFlag ;
  assign observer_r_sFlag$EN = 1'd1 ;

  // register observer_r_sResp
  assign observer_r_sResp$D_IN = wciO0_SResp ;
  assign observer_r_sResp$EN = 1'd1 ;

  // register observer_r_sThreadBusy
  assign observer_r_sThreadBusy$D_IN = wciO0_SThreadBusy ;
  assign observer_r_sThreadBusy$EN = 1'd1 ;

  // register pmemgen_dwRemain
  assign pmemgen_dwRemain$D_IN =
	     WILL_FIRE_RL_pmemgen_gen_message_body ?
	       MUX_pmemgen_dwRemain$write_1__VAL_1 :
	       MUX_pmemgen_dwRemain$write_1__VAL_2 ;
  assign pmemgen_dwRemain$EN =
	     WILL_FIRE_RL_pmemgen_gen_message_body ||
	     WILL_FIRE_RL_pmemgen_gen_message_head ;

  // register pmemgen_srcTag
  assign pmemgen_srcTag$D_IN = pmemgen_srcTag + 8'd1 ;
  assign pmemgen_srcTag$EN = WILL_FIRE_RL_pmemgen_gen_message_head ;

  // submodule pmemgen_evF
  assign pmemgen_evF$D_IN = 74'h0AAAAAAAAAAAAAAAA69 ;
  assign pmemgen_evF$ENQ = CAN_FIRE_RL_event_cmd ;
  assign pmemgen_evF$DEQ =
	     WILL_FIRE_RL_pmemgen_gen_message_head &&
	     pmemgen_evF$D_OUT[73:72] == 2'd0 ||
	     WILL_FIRE_RL_pmemgen_gen_message_body &&
	     pmemgen_dwRemain == 2'd1 ;
  assign pmemgen_evF$CLR = 1'b0 ;

  // submodule pmemgen_pmemF
  always@(EN_pmem_put or
	  pmem_put or
	  WILL_FIRE_RL_pmemgen_gen_message_head or
	  MUX_pmemgen_pmemF$enq_1__VAL_2 or
	  WILL_FIRE_RL_pmemgen_gen_message_body or
	  MUX_pmemgen_pmemF$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      EN_pmem_put: pmemgen_pmemF$D_IN = pmem_put;
      WILL_FIRE_RL_pmemgen_gen_message_head:
	  pmemgen_pmemF$D_IN = MUX_pmemgen_pmemF$enq_1__VAL_2;
      WILL_FIRE_RL_pmemgen_gen_message_body:
	  pmemgen_pmemF$D_IN = MUX_pmemgen_pmemF$enq_1__VAL_3;
      default: pmemgen_pmemF$D_IN = 33'h0AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign pmemgen_pmemF$ENQ =
	     EN_pmem_put || WILL_FIRE_RL_pmemgen_gen_message_head ||
	     WILL_FIRE_RL_pmemgen_gen_message_body ;
  assign pmemgen_pmemF$DEQ = 1'b0 ;
  assign pmemgen_pmemF$CLR = 1'b0 ;

  // remaining internal signals
  assign d__h1610 =
	     (pmemgen_dwRemain == 2'd1) ?
	       pmemgen_evF$D_OUT[63:32] :
	       pmemgen_evF$D_OUT[31:0] ;
  always@(pmemgen_evF$D_OUT)
  begin
    case (pmemgen_evF$D_OUT[73:72])
      2'd0: x__h1568 = 8'd1;
      2'd1: x__h1568 = 8'd2;
      default: x__h1568 = 8'd3;
    endcase
  end
  always@(pmemgen_evF$D_OUT or d__h1610)
  begin
    case (pmemgen_evF$D_OUT[73:72])
      2'd0: CASE_pmemgen_evFD_OUT_BITS_73_TO_72_d610_0_0__ETC__q1 = 32'd0;
      2'd1:
	  CASE_pmemgen_evFD_OUT_BITS_73_TO_72_d610_0_0__ETC__q1 =
	      pmemgen_evF$D_OUT[31:0];
      default: CASE_pmemgen_evFD_OUT_BITS_73_TO_72_d610_0_0__ETC__q1 =
		   d__h1610;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        observer_eCmd <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_r_mAddr <= `BSV_ASSIGNMENT_DELAY 20'd0;
	observer_r_mAddrSpace <= `BSV_ASSIGNMENT_DELAY 1'd0;
	observer_r_mByteEn <= `BSV_ASSIGNMENT_DELAY 4'd0;
	observer_r_mCmd <= `BSV_ASSIGNMENT_DELAY 3'd0;
	observer_r_mCmdD <= `BSV_ASSIGNMENT_DELAY 3'd0;
	observer_r_mData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	observer_r_mFlag <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sData <= `BSV_ASSIGNMENT_DELAY 32'd0;
	observer_r_sFlag <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sResp <= `BSV_ASSIGNMENT_DELAY 2'd0;
	observer_r_sThreadBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	pmemgen_dwRemain <= `BSV_ASSIGNMENT_DELAY 2'd0;
	pmemgen_srcTag <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (observer_eCmd$EN)
	  observer_eCmd <= `BSV_ASSIGNMENT_DELAY observer_eCmd$D_IN;
	if (observer_r_mAddr$EN)
	  observer_r_mAddr <= `BSV_ASSIGNMENT_DELAY observer_r_mAddr$D_IN;
	if (observer_r_mAddrSpace$EN)
	  observer_r_mAddrSpace <= `BSV_ASSIGNMENT_DELAY
	      observer_r_mAddrSpace$D_IN;
	if (observer_r_mByteEn$EN)
	  observer_r_mByteEn <= `BSV_ASSIGNMENT_DELAY observer_r_mByteEn$D_IN;
	if (observer_r_mCmd$EN)
	  observer_r_mCmd <= `BSV_ASSIGNMENT_DELAY observer_r_mCmd$D_IN;
	if (observer_r_mCmdD$EN)
	  observer_r_mCmdD <= `BSV_ASSIGNMENT_DELAY observer_r_mCmdD$D_IN;
	if (observer_r_mData$EN)
	  observer_r_mData <= `BSV_ASSIGNMENT_DELAY observer_r_mData$D_IN;
	if (observer_r_mFlag$EN)
	  observer_r_mFlag <= `BSV_ASSIGNMENT_DELAY observer_r_mFlag$D_IN;
	if (observer_r_sData$EN)
	  observer_r_sData <= `BSV_ASSIGNMENT_DELAY observer_r_sData$D_IN;
	if (observer_r_sFlag$EN)
	  observer_r_sFlag <= `BSV_ASSIGNMENT_DELAY observer_r_sFlag$D_IN;
	if (observer_r_sResp$EN)
	  observer_r_sResp <= `BSV_ASSIGNMENT_DELAY observer_r_sResp$D_IN;
	if (observer_r_sThreadBusy$EN)
	  observer_r_sThreadBusy <= `BSV_ASSIGNMENT_DELAY
	      observer_r_sThreadBusy$D_IN;
	if (pmemgen_dwRemain$EN)
	  pmemgen_dwRemain <= `BSV_ASSIGNMENT_DELAY pmemgen_dwRemain$D_IN;
	if (pmemgen_srcTag$EN)
	  pmemgen_srcTag <= `BSV_ASSIGNMENT_DELAY pmemgen_srcTag$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    observer_eCmd = 1'h0;
    observer_r_mAddr = 20'hAAAAA;
    observer_r_mAddrSpace = 1'h0;
    observer_r_mByteEn = 4'hA;
    observer_r_mCmd = 3'h2;
    observer_r_mCmdD = 3'h2;
    observer_r_mData = 32'hAAAAAAAA;
    observer_r_mFlag = 2'h2;
    observer_r_sData = 32'hAAAAAAAA;
    observer_r_sFlag = 2'h2;
    observer_r_sResp = 2'h2;
    observer_r_sThreadBusy = 1'h0;
    pmemgen_dwRemain = 2'h2;
    pmemgen_srcTag = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (WILL_FIRE_RL_observer_cmd_start)
	begin
	  v__h924 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_observer_cmd_start)
	$display("[%0d]: %m: WCI mcmd %0x", v__h924, observer_r_mCmd);
    begin
      v__h1842 = $time;
      #0;
    end
    $display("[%0d]: %m: foop2", v__h1842);
    begin
      v__h966 = $time;
      #0;
    end
    $display("[%0d]: %m: foop", v__h966);
    if (RST_N)
      if (WILL_FIRE_RL_pmemgen_gen_message_body &&
	  pmemgen_evF$D_OUT[73:72] == 2'd0)
	$display("Error");
    begin
      v__h1758 = $time;
      #0;
    end
    $display("[%0d]: %m: foop4", v__h1758);
  end
  // synopsys translate_on
endmodule  // mkWciOcpMonitor

