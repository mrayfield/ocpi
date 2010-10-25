//
// Generated by Bluespec Compiler, version 2009.11.beta2 (build 18693, 2009-11-24)
//
// On Mon Oct 25 09:17:16 EDT 2010
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

module mkTB2(CLK,
	     RST_N);
  input  CLK;
  input  RST_N;

  // register cycle
  reg [15 : 0] cycle;
  wire [15 : 0] cycle$D_IN;
  wire cycle$EN;

  // ports of submodule cm0
  wire [152 : 0] cm0$c_request_get,
		 cm0$c_response_put,
		 cm0$s0_request_put,
		 cm0$s0_response_get,
		 cm0$s1_request_put,
		 cm0$s1_response_get;
  wire cm0$EN_c_request_get,
       cm0$EN_c_response_put,
       cm0$EN_s0_request_put,
       cm0$EN_s0_response_get,
       cm0$EN_s1_request_put,
       cm0$EN_s1_response_get,
       cm0$RDY_c_request_get,
       cm0$RDY_c_response_put,
       cm0$RDY_s0_request_put,
       cm0$RDY_s0_response_get,
       cm0$RDY_s1_request_put,
       cm0$RDY_s1_response_get;

  // ports of submodule ctop
  wire [152 : 0] ctop$server_request_put, ctop$server_response_get;
  wire [127 : 0] ctop$wmemiM_SData;
  wire [31 : 0] ctop$wci_m_0_SData,
		ctop$wci_m_1_SData,
		ctop$wci_m_2_SData,
		ctop$wci_m_3_SData,
		ctop$wci_m_4_SData,
		ctop$wsi_s_adc_MData;
  wire [11 : 0] ctop$wsi_s_adc_MBurstLength;
  wire [7 : 0] ctop$wsi_s_adc_MReqInfo;
  wire [3 : 0] ctop$wsi_s_adc_MByteEn;
  wire [2 : 0] ctop$switch_x, ctop$wsi_s_adc_MCmd;
  wire [1 : 0] ctop$wci_m_0_SFlag,
	       ctop$wci_m_0_SResp,
	       ctop$wci_m_1_SFlag,
	       ctop$wci_m_1_SResp,
	       ctop$wci_m_2_SFlag,
	       ctop$wci_m_2_SResp,
	       ctop$wci_m_3_SFlag,
	       ctop$wci_m_3_SResp,
	       ctop$wci_m_4_SFlag,
	       ctop$wci_m_4_SResp,
	       ctop$wmemiM_SResp;
  wire ctop$EN_server_request_put,
       ctop$EN_server_response_get,
       ctop$RDY_server_request_put,
       ctop$RDY_server_response_get,
       ctop$gps_ppsSyncIn_x,
       ctop$wci_m_0_SThreadBusy,
       ctop$wci_m_1_SThreadBusy,
       ctop$wci_m_2_SThreadBusy,
       ctop$wci_m_3_SThreadBusy,
       ctop$wci_m_4_SThreadBusy,
       ctop$wmemiM_SCmdAccept,
       ctop$wmemiM_SDataAccept,
       ctop$wmemiM_SRespLast,
       ctop$wsi_m_dac_SReset_n,
       ctop$wsi_m_dac_SThreadBusy,
       ctop$wsi_s_adc_MBurstPrecise,
       ctop$wsi_s_adc_MReqLast,
       ctop$wsi_s_adc_MReset_n;

  // ports of submodule tg
  wire [152 : 0] tg$client_request_get, tg$client_response_put;
  wire tg$EN_client_request_get,
       tg$EN_client_response_put,
       tg$RDY_client_request_get,
       tg$RDY_client_response_put;

  // rule scheduling signals
  wire CAN_FIRE_RL_ClientServerRequest,
       CAN_FIRE_RL_ClientServerRequest_1,
       CAN_FIRE_RL_ClientServerResponse,
       CAN_FIRE_RL_ClientServerResponse_1,
       CAN_FIRE_RL_cycleCount,
       CAN_FIRE_RL_mkConnectionGetPut,
       CAN_FIRE_RL_terminate,
       WILL_FIRE_RL_ClientServerRequest,
       WILL_FIRE_RL_ClientServerRequest_1,
       WILL_FIRE_RL_ClientServerResponse,
       WILL_FIRE_RL_ClientServerResponse_1,
       WILL_FIRE_RL_cycleCount,
       WILL_FIRE_RL_mkConnectionGetPut,
       WILL_FIRE_RL_terminate;

  // remaining internal signals
  reg [63 : 0] v__h829;

  // submodule cm0
  mkTLPCM cm0(.pfk(14'd6911),
	      .CLK(CLK),
	      .RST_N(RST_N),
	      .c_response_put(cm0$c_response_put),
	      .s0_request_put(cm0$s0_request_put),
	      .s1_request_put(cm0$s1_request_put),
	      .EN_c_request_get(cm0$EN_c_request_get),
	      .EN_c_response_put(cm0$EN_c_response_put),
	      .EN_s0_request_put(cm0$EN_s0_request_put),
	      .EN_s0_response_get(cm0$EN_s0_response_get),
	      .EN_s1_request_put(cm0$EN_s1_request_put),
	      .EN_s1_response_get(cm0$EN_s1_response_get),
	      .c_request_get(cm0$c_request_get),
	      .RDY_c_request_get(cm0$RDY_c_request_get),
	      .RDY_c_response_put(cm0$RDY_c_response_put),
	      .RDY_s0_request_put(cm0$RDY_s0_request_put),
	      .s0_response_get(cm0$s0_response_get),
	      .RDY_s0_response_get(cm0$RDY_s0_response_get),
	      .RDY_s1_request_put(cm0$RDY_s1_request_put),
	      .s1_response_get(cm0$s1_response_get),
	      .RDY_s1_response_get(cm0$RDY_s1_response_get));

  // submodule ctop
  mkCTop ctop(.pciDevice(16'd0),
	      .CLK_sys0_clk(CLK),
	      .RST_N_sys0_rst(RST_N),
	      .CLK(CLK),
	      .RST_N(RST_N),
	      .gps_ppsSyncIn_x(ctop$gps_ppsSyncIn_x),
	      .server_request_put(ctop$server_request_put),
	      .switch_x(ctop$switch_x),
	      .wci_m_0_SData(ctop$wci_m_0_SData),
	      .wci_m_0_SFlag(ctop$wci_m_0_SFlag),
	      .wci_m_0_SResp(ctop$wci_m_0_SResp),
	      .wci_m_1_SData(ctop$wci_m_1_SData),
	      .wci_m_1_SFlag(ctop$wci_m_1_SFlag),
	      .wci_m_1_SResp(ctop$wci_m_1_SResp),
	      .wci_m_2_SData(ctop$wci_m_2_SData),
	      .wci_m_2_SFlag(ctop$wci_m_2_SFlag),
	      .wci_m_2_SResp(ctop$wci_m_2_SResp),
	      .wci_m_3_SData(ctop$wci_m_3_SData),
	      .wci_m_3_SFlag(ctop$wci_m_3_SFlag),
	      .wci_m_3_SResp(ctop$wci_m_3_SResp),
	      .wci_m_4_SData(ctop$wci_m_4_SData),
	      .wci_m_4_SFlag(ctop$wci_m_4_SFlag),
	      .wci_m_4_SResp(ctop$wci_m_4_SResp),
	      .wmemiM_SData(ctop$wmemiM_SData),
	      .wmemiM_SResp(ctop$wmemiM_SResp),
	      .wsi_s_adc_MBurstLength(ctop$wsi_s_adc_MBurstLength),
	      .wsi_s_adc_MByteEn(ctop$wsi_s_adc_MByteEn),
	      .wsi_s_adc_MCmd(ctop$wsi_s_adc_MCmd),
	      .wsi_s_adc_MData(ctop$wsi_s_adc_MData),
	      .wsi_s_adc_MReqInfo(ctop$wsi_s_adc_MReqInfo),
	      .EN_server_request_put(ctop$EN_server_request_put),
	      .EN_server_response_get(ctop$EN_server_response_get),
	      .wci_m_0_SThreadBusy(ctop$wci_m_0_SThreadBusy),
	      .wci_m_1_SThreadBusy(ctop$wci_m_1_SThreadBusy),
	      .wci_m_2_SThreadBusy(ctop$wci_m_2_SThreadBusy),
	      .wci_m_3_SThreadBusy(ctop$wci_m_3_SThreadBusy),
	      .wci_m_4_SThreadBusy(ctop$wci_m_4_SThreadBusy),
	      .wsi_s_adc_MReqLast(ctop$wsi_s_adc_MReqLast),
	      .wsi_s_adc_MBurstPrecise(ctop$wsi_s_adc_MBurstPrecise),
	      .wsi_s_adc_MReset_n(ctop$wsi_s_adc_MReset_n),
	      .wsi_m_dac_SThreadBusy(ctop$wsi_m_dac_SThreadBusy),
	      .wsi_m_dac_SReset_n(ctop$wsi_m_dac_SReset_n),
	      .wmemiM_SRespLast(ctop$wmemiM_SRespLast),
	      .wmemiM_SCmdAccept(ctop$wmemiM_SCmdAccept),
	      .wmemiM_SDataAccept(ctop$wmemiM_SDataAccept),
	      .RDY_server_request_put(ctop$RDY_server_request_put),
	      .server_response_get(ctop$server_response_get),
	      .RDY_server_response_get(ctop$RDY_server_response_get),
	      .led(),
	      .wci_m_0_MCmd(),
	      .wci_m_0_MAddrSpace(),
	      .wci_m_0_MByteEn(),
	      .wci_m_0_MAddr(),
	      .wci_m_0_MData(),
	      .wci_m_0_MFlag(),
	      .wci_m_1_MCmd(),
	      .wci_m_1_MAddrSpace(),
	      .wci_m_1_MByteEn(),
	      .wci_m_1_MAddr(),
	      .wci_m_1_MData(),
	      .wci_m_1_MFlag(),
	      .wci_m_2_MCmd(),
	      .wci_m_2_MAddrSpace(),
	      .wci_m_2_MByteEn(),
	      .wci_m_2_MAddr(),
	      .wci_m_2_MData(),
	      .wci_m_2_MFlag(),
	      .wci_m_3_MCmd(),
	      .wci_m_3_MAddrSpace(),
	      .wci_m_3_MByteEn(),
	      .wci_m_3_MAddr(),
	      .wci_m_3_MData(),
	      .wci_m_3_MFlag(),
	      .wci_m_4_MCmd(),
	      .wci_m_4_MAddrSpace(),
	      .wci_m_4_MByteEn(),
	      .wci_m_4_MAddr(),
	      .wci_m_4_MData(),
	      .wci_m_4_MFlag(),
	      .cpNow(),
	      .RDY_cpNow(),
	      .wsi_s_adc_SThreadBusy(),
	      .wsi_s_adc_SReset_n(),
	      .wsi_m_dac_MCmd(),
	      .wsi_m_dac_MReqLast(),
	      .wsi_m_dac_MBurstPrecise(),
	      .wsi_m_dac_MBurstLength(),
	      .wsi_m_dac_MData(),
	      .wsi_m_dac_MByteEn(),
	      .wsi_m_dac_MReqInfo(),
	      .wsi_m_dac_MReset_n(),
	      .wmemiM_MCmd(),
	      .wmemiM_MReqLast(),
	      .wmemiM_MAddr(),
	      .wmemiM_MBurstLength(),
	      .wmemiM_MDataValid(),
	      .wmemiM_MDataLast(),
	      .wmemiM_MData(),
	      .wmemiM_MDataByteEn(),
	      .wmemiM_MReset_n(),
	      .gps_ppsSyncOut(),
	      .RST_N_wci_m_0_mReset_n(),
	      .RST_N_wci_m_1_mReset_n(),
	      .RST_N_wci_m_2_mReset_n(),
	      .RST_N_wci_m_3_mReset_n(),
	      .RST_N_wci_m_4_mReset_n());

  // submodule tg
  mkOCTG_genchk tg(.CLK(CLK),
		   .RST_N(RST_N),
		   .client_response_put(tg$client_response_put),
		   .EN_client_request_get(tg$EN_client_request_get),
		   .EN_client_response_put(tg$EN_client_response_put),
		   .client_request_get(tg$client_request_get),
		   .RDY_client_request_get(tg$RDY_client_request_get),
		   .RDY_client_response_put(tg$RDY_client_response_put));

  // rule RL_mkConnectionGetPut
  assign CAN_FIRE_RL_mkConnectionGetPut =
	     cm0$RDY_s1_response_get && cm0$RDY_s1_request_put ;
  assign WILL_FIRE_RL_mkConnectionGetPut = CAN_FIRE_RL_mkConnectionGetPut ;

  // rule RL_ClientServerRequest_1
  assign CAN_FIRE_RL_ClientServerRequest_1 =
	     cm0$RDY_c_request_get && ctop$RDY_server_request_put ;
  assign WILL_FIRE_RL_ClientServerRequest_1 =
	     CAN_FIRE_RL_ClientServerRequest_1 ;

  // rule RL_ClientServerResponse_1
  assign CAN_FIRE_RL_ClientServerResponse_1 =
	     cm0$RDY_c_response_put && ctop$RDY_server_response_get ;
  assign WILL_FIRE_RL_ClientServerResponse_1 =
	     CAN_FIRE_RL_ClientServerResponse_1 ;

  // rule RL_ClientServerRequest
  assign CAN_FIRE_RL_ClientServerRequest =
	     cm0$RDY_s0_request_put && tg$RDY_client_request_get ;
  assign WILL_FIRE_RL_ClientServerRequest = CAN_FIRE_RL_ClientServerRequest ;

  // rule RL_ClientServerResponse
  assign CAN_FIRE_RL_ClientServerResponse =
	     cm0$RDY_s0_response_get && tg$RDY_client_response_put ;
  assign WILL_FIRE_RL_ClientServerResponse =
	     CAN_FIRE_RL_ClientServerResponse ;

  // rule RL_terminate
  assign CAN_FIRE_RL_terminate = cycle == 16'd5000 ;
  assign WILL_FIRE_RL_terminate = CAN_FIRE_RL_terminate ;

  // rule RL_cycleCount
  assign CAN_FIRE_RL_cycleCount = 1'd1 ;
  assign WILL_FIRE_RL_cycleCount = 1'd1 ;

  // register cycle
  assign cycle$D_IN = cycle + 16'd1 ;
  assign cycle$EN = 1'd1 ;

  // submodule cm0
  assign cm0$EN_c_request_get = CAN_FIRE_RL_ClientServerRequest_1 ;
  assign cm0$EN_s0_request_put = CAN_FIRE_RL_ClientServerRequest ;
  assign cm0$EN_c_response_put = CAN_FIRE_RL_ClientServerResponse_1 ;
  assign cm0$EN_s0_response_get = CAN_FIRE_RL_ClientServerResponse ;
  assign cm0$EN_s1_request_put = CAN_FIRE_RL_mkConnectionGetPut ;
  assign cm0$EN_s1_response_get = CAN_FIRE_RL_mkConnectionGetPut ;
  assign cm0$c_response_put = ctop$server_response_get ;
  assign cm0$s0_request_put = tg$client_request_get ;
  assign cm0$s1_request_put = cm0$s1_response_get ;

  // submodule ctop
  assign ctop$EN_server_request_put = CAN_FIRE_RL_ClientServerRequest_1 ;
  assign ctop$EN_server_response_get = CAN_FIRE_RL_ClientServerResponse_1 ;
  assign ctop$server_request_put = cm0$c_request_get ;
  assign ctop$switch_x = 3'h0 ;
  assign ctop$wci_m_0_SResp = 2'h0 ;
  assign ctop$wci_m_0_SData = 32'h0 ;
  assign ctop$wci_m_0_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_0_SFlag = 2'h0 ;
  assign ctop$wci_m_1_SResp = 2'h0 ;
  assign ctop$wci_m_1_SData = 32'h0 ;
  assign ctop$wci_m_1_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_1_SFlag = 2'h0 ;
  assign ctop$wci_m_2_SResp = 2'h0 ;
  assign ctop$wci_m_2_SData = 32'h0 ;
  assign ctop$wci_m_2_SFlag = 2'h0 ;
  assign ctop$wci_m_2_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_3_SResp = 2'h0 ;
  assign ctop$wci_m_3_SData = 32'h0 ;
  assign ctop$wci_m_3_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_3_SFlag = 2'h0 ;
  assign ctop$wci_m_4_SResp = 2'h0 ;
  assign ctop$wci_m_4_SData = 32'h0 ;
  assign ctop$wci_m_4_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_4_SFlag = 2'h0 ;
  assign ctop$wsi_s_adc_MCmd = 3'h0 ;
  assign ctop$wsi_s_adc_MReqLast = 1'b0 ;
  assign ctop$wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign ctop$wsi_s_adc_MBurstLength = 12'h0 ;
  assign ctop$wsi_s_adc_MData = 32'h0 ;
  assign ctop$wsi_s_adc_MByteEn = 4'h0 ;
  assign ctop$wsi_s_adc_MReqInfo = 8'h0 ;
  assign ctop$wsi_s_adc_MReset_n = 1'b0 ;
  assign ctop$wsi_m_dac_SThreadBusy = 1'b0 ;
  assign ctop$wmemiM_SResp = 2'h0 ;
  assign ctop$wsi_m_dac_SReset_n = 1'b0 ;
  assign ctop$wmemiM_SData = 128'h0 ;
  assign ctop$wmemiM_SRespLast = 1'b0 ;
  assign ctop$wmemiM_SCmdAccept = 1'b0 ;
  assign ctop$wmemiM_SDataAccept = 1'b0 ;
  assign ctop$gps_ppsSyncIn_x = 1'b0 ;

  // submodule tg
  assign tg$EN_client_request_get = CAN_FIRE_RL_ClientServerRequest ;
  assign tg$EN_client_response_put = CAN_FIRE_RL_ClientServerResponse ;
  assign tg$client_response_put = cm0$s0_response_get ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        cycle <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (cycle$EN) cycle <= `BSV_ASSIGNMENT_DELAY cycle$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cycle = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (WILL_FIRE_RL_terminate)
	begin
	  v__h829 = $time;
	  #0;
	end
    if (RST_N)
      if (WILL_FIRE_RL_terminate) $display("[%0d] %m termination", v__h829);
    if (RST_N) if (WILL_FIRE_RL_terminate) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTB2

