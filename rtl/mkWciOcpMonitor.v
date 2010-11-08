//
// Generated by Bluespec Compiler, version 2010.10.beta1 (build 22431, 2010-10-28)
//
// On Mon Nov  8 13:27:59 EST 2010
//
//
// Ports:
// Name                         I/O  size props
// wciO0_Clk                      I     1 unused
// wciO0_MReset_n                 I     1 unused
// wciO0_MCmd                     I     3 unused
// wciO0_MAddrSpace               I     1 unused
// wciO0_MByteEn                  I     4 unused
// wciO0_MAddr                    I    20 unused
// wciO0_MData                    I    32 unused
// wciO0_SResp                    I     2 unused
// wciO0_SData                    I    32 unused
// wciO0_SFlag                    I     2 unused
// wciO0_MFlag                    I     2 unused
// wciO0_SThreadBusy              I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkWciOcpMonitor(wciO0_Clk,
		       wciO0_MReset_n,

		       wciO0_MCmd,

		       wciO0_MAddrSpace,

		       wciO0_MByteEn,

		       wciO0_MAddr,

		       wciO0_MData,

		       wciO0_SResp,

		       wciO0_SData,

		       wciO0_SThreadBusy,

		       wciO0_SFlag,

		       wciO0_MFlag);
  input  wciO0_Clk;
  input  wciO0_MReset_n;

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

  // rule scheduling signals
  wire CAN_FIRE_wciO0_mAddr,
       CAN_FIRE_wciO0_mAddrSpace,
       CAN_FIRE_wciO0_mByteEn,
       CAN_FIRE_wciO0_mCmd,
       CAN_FIRE_wciO0_mData,
       CAN_FIRE_wciO0_mFlag,
       CAN_FIRE_wciO0_sData,
       CAN_FIRE_wciO0_sFlag,
       CAN_FIRE_wciO0_sResp,
       CAN_FIRE_wciO0_sThreadBusy,
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
endmodule  // mkWciOcpMonitor
