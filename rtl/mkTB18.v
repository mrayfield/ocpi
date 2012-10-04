//
// Generated by Bluespec Compiler, version 2012.09.beta1 (build 29570, 2012-09.11)
//
// On Wed Oct  3 15:54:06 EDT 2012
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

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTB18(CLK,
	      RST_N);
  input  CLK;
  input  RST_N;

  // register simCycle
  reg [15 : 0] simCycle;
  wire [15 : 0] simCycle$D_IN;
  wire simCycle$EN;

  // ports of submodule bias
  wire [31 : 0] bias$wciS0_MAddr,
		bias$wciS0_MData,
		bias$wciS0_SData,
		bias$wsiM0_MData,
		bias$wsiS0_MData;
  wire [11 : 0] bias$wsiM0_MBurstLength, bias$wsiS0_MBurstLength;
  wire [7 : 0] bias$wsiM0_MReqInfo, bias$wsiS0_MReqInfo;
  wire [3 : 0] bias$wciS0_MByteEn, bias$wsiM0_MByteEn, bias$wsiS0_MByteEn;
  wire [2 : 0] bias$wciS0_MCmd, bias$wsiM0_MCmd, bias$wsiS0_MCmd;
  wire [1 : 0] bias$wciS0_MFlag, bias$wciS0_SFlag, bias$wciS0_SResp;
  wire bias$wciS0_MAddrSpace,
       bias$wciS0_SThreadBusy,
       bias$wsiM0_MBurstPrecise,
       bias$wsiM0_MReqLast,
       bias$wsiM0_MReset_n,
       bias$wsiM0_SReset_n,
       bias$wsiM0_SThreadBusy,
       bias$wsiS0_MBurstPrecise,
       bias$wsiS0_MReqLast,
       bias$wsiS0_MReset_n,
       bias$wsiS0_SReset_n,
       bias$wsiS0_SThreadBusy;

  // ports of submodule cap0
  wire [63 : 0] cap0$wtiS0_MData;
  wire [31 : 0] cap0$wciS0_MAddr,
		cap0$wciS0_MData,
		cap0$wciS0_SData,
		cap0$wsiS0_MData;
  wire [11 : 0] cap0$wsiS0_MBurstLength;
  wire [7 : 0] cap0$wsiS0_MReqInfo;
  wire [3 : 0] cap0$wciS0_MByteEn, cap0$wsiS0_MByteEn;
  wire [2 : 0] cap0$wciS0_MCmd, cap0$wsiS0_MCmd, cap0$wtiS0_MCmd;
  wire [1 : 0] cap0$wciS0_MFlag, cap0$wciS0_SFlag, cap0$wciS0_SResp;
  wire cap0$wciS0_MAddrSpace,
       cap0$wciS0_SThreadBusy,
       cap0$wsiS0_MBurstPrecise,
       cap0$wsiS0_MReqLast,
       cap0$wsiS0_MReset_n,
       cap0$wsiS0_SReset_n,
       cap0$wsiS0_SThreadBusy;

  // ports of submodule cp
  wire [511 : 0] cp$uuid_arg;
  wire [58 : 0] cp$server_request_put;
  wire [39 : 0] cp$server_response_get;
  wire [31 : 0] cp$wci_Vm_0_SData,
		cp$wci_Vm_10_SData,
		cp$wci_Vm_11_SData,
		cp$wci_Vm_12_SData,
		cp$wci_Vm_13_SData,
		cp$wci_Vm_14_SData,
		cp$wci_Vm_1_SData,
		cp$wci_Vm_2_MAddr,
		cp$wci_Vm_2_MData,
		cp$wci_Vm_2_SData,
		cp$wci_Vm_3_MAddr,
		cp$wci_Vm_3_MData,
		cp$wci_Vm_3_SData,
		cp$wci_Vm_4_MAddr,
		cp$wci_Vm_4_MData,
		cp$wci_Vm_4_SData,
		cp$wci_Vm_5_SData,
		cp$wci_Vm_6_SData,
		cp$wci_Vm_7_SData,
		cp$wci_Vm_8_SData,
		cp$wci_Vm_9_SData;
  wire [3 : 0] cp$wci_Vm_2_MByteEn, cp$wci_Vm_3_MByteEn, cp$wci_Vm_4_MByteEn;
  wire [2 : 0] cp$switch_x,
	       cp$wci_Vm_2_MCmd,
	       cp$wci_Vm_3_MCmd,
	       cp$wci_Vm_4_MCmd;
  wire [1 : 0] cp$wci_Vm_0_SFlag,
	       cp$wci_Vm_0_SResp,
	       cp$wci_Vm_10_SFlag,
	       cp$wci_Vm_10_SResp,
	       cp$wci_Vm_11_SFlag,
	       cp$wci_Vm_11_SResp,
	       cp$wci_Vm_12_SFlag,
	       cp$wci_Vm_12_SResp,
	       cp$wci_Vm_13_SFlag,
	       cp$wci_Vm_13_SResp,
	       cp$wci_Vm_14_SFlag,
	       cp$wci_Vm_14_SResp,
	       cp$wci_Vm_1_SFlag,
	       cp$wci_Vm_1_SResp,
	       cp$wci_Vm_2_MFlag,
	       cp$wci_Vm_2_SFlag,
	       cp$wci_Vm_2_SResp,
	       cp$wci_Vm_3_MFlag,
	       cp$wci_Vm_3_SFlag,
	       cp$wci_Vm_3_SResp,
	       cp$wci_Vm_4_MFlag,
	       cp$wci_Vm_4_SFlag,
	       cp$wci_Vm_4_SResp,
	       cp$wci_Vm_5_SFlag,
	       cp$wci_Vm_5_SResp,
	       cp$wci_Vm_6_SFlag,
	       cp$wci_Vm_6_SResp,
	       cp$wci_Vm_7_SFlag,
	       cp$wci_Vm_7_SResp,
	       cp$wci_Vm_8_SFlag,
	       cp$wci_Vm_8_SResp,
	       cp$wci_Vm_9_SFlag,
	       cp$wci_Vm_9_SResp;
  wire cp$EN_server_request_put,
       cp$EN_server_response_get,
       cp$RDY_server_request_put,
       cp$RDY_server_response_get,
       cp$RST_N_wci_Vm_2,
       cp$RST_N_wci_Vm_3,
       cp$RST_N_wci_Vm_4,
       cp$gps_ppsSyncIn_x,
       cp$wci_Vm_0_SThreadBusy,
       cp$wci_Vm_10_SThreadBusy,
       cp$wci_Vm_11_SThreadBusy,
       cp$wci_Vm_12_SThreadBusy,
       cp$wci_Vm_13_SThreadBusy,
       cp$wci_Vm_14_SThreadBusy,
       cp$wci_Vm_1_SThreadBusy,
       cp$wci_Vm_2_MAddrSpace,
       cp$wci_Vm_2_SThreadBusy,
       cp$wci_Vm_3_MAddrSpace,
       cp$wci_Vm_3_SThreadBusy,
       cp$wci_Vm_4_MAddrSpace,
       cp$wci_Vm_4_SThreadBusy,
       cp$wci_Vm_5_SThreadBusy,
       cp$wci_Vm_6_SThreadBusy,
       cp$wci_Vm_7_SThreadBusy,
       cp$wci_Vm_8_SThreadBusy,
       cp$wci_Vm_9_SThreadBusy;

  // ports of submodule pat0
  wire [31 : 0] pat0$wciS0_MAddr,
		pat0$wciS0_MData,
		pat0$wciS0_SData,
		pat0$wsiM0_MData;
  wire [11 : 0] pat0$wsiM0_MBurstLength;
  wire [7 : 0] pat0$wsiM0_MReqInfo;
  wire [3 : 0] pat0$wciS0_MByteEn, pat0$wsiM0_MByteEn;
  wire [2 : 0] pat0$wciS0_MCmd, pat0$wsiM0_MCmd;
  wire [1 : 0] pat0$wciS0_MFlag, pat0$wciS0_SFlag, pat0$wciS0_SResp;
  wire pat0$wciS0_MAddrSpace,
       pat0$wciS0_SThreadBusy,
       pat0$wsiM0_MBurstPrecise,
       pat0$wsiM0_MReqLast,
       pat0$wsiM0_MReset_n,
       pat0$wsiM0_SReset_n,
       pat0$wsiM0_SThreadBusy;

  // ports of submodule simDCP
  wire [58 : 0] simDCP$client_request_get;
  wire [39 : 0] simDCP$client_response_put;
  wire [7 : 0] simDCP$host_request_put, simDCP$host_response_get;
  wire simDCP$EN_client_request_get,
       simDCP$EN_client_response_put,
       simDCP$EN_host_request_put,
       simDCP$EN_host_response_get,
       simDCP$RDY_client_request_get,
       simDCP$RDY_client_response_put,
       simDCP$RDY_host_request_put,
       simDCP$RDY_host_response_get;

  // ports of submodule simIO
  wire [7 : 0] simIO$host_request_get, simIO$host_response_put;
  wire simIO$EN_host_request_get,
       simIO$EN_host_response_put,
       simIO$RDY_host_request_get,
       simIO$RDY_host_response_put;

  // submodule bias
  mkBiasWorker4B #(.hasDebugLogic(1'd1)) bias(.wciS0_Clk(CLK),
					      .wciS0_MReset_n(cp$RST_N_wci_Vm_3),
					      .wciS0_MAddr(bias$wciS0_MAddr),
					      .wciS0_MAddrSpace(bias$wciS0_MAddrSpace),
					      .wciS0_MByteEn(bias$wciS0_MByteEn),
					      .wciS0_MCmd(bias$wciS0_MCmd),
					      .wciS0_MData(bias$wciS0_MData),
					      .wciS0_MFlag(bias$wciS0_MFlag),
					      .wsiS0_MBurstLength(bias$wsiS0_MBurstLength),
					      .wsiS0_MByteEn(bias$wsiS0_MByteEn),
					      .wsiS0_MCmd(bias$wsiS0_MCmd),
					      .wsiS0_MData(bias$wsiS0_MData),
					      .wsiS0_MReqInfo(bias$wsiS0_MReqInfo),
					      .wsiS0_MReqLast(bias$wsiS0_MReqLast),
					      .wsiS0_MBurstPrecise(bias$wsiS0_MBurstPrecise),
					      .wsiS0_MReset_n(bias$wsiS0_MReset_n),
					      .wsiM0_SThreadBusy(bias$wsiM0_SThreadBusy),
					      .wsiM0_SReset_n(bias$wsiM0_SReset_n),
					      .wciS0_SResp(bias$wciS0_SResp),
					      .wciS0_SData(bias$wciS0_SData),
					      .wciS0_SThreadBusy(bias$wciS0_SThreadBusy),
					      .wciS0_SFlag(bias$wciS0_SFlag),
					      .wsiS0_SThreadBusy(bias$wsiS0_SThreadBusy),
					      .wsiS0_SReset_n(bias$wsiS0_SReset_n),
					      .wsiM0_MCmd(bias$wsiM0_MCmd),
					      .wsiM0_MReqLast(bias$wsiM0_MReqLast),
					      .wsiM0_MBurstPrecise(bias$wsiM0_MBurstPrecise),
					      .wsiM0_MBurstLength(bias$wsiM0_MBurstLength),
					      .wsiM0_MData(bias$wsiM0_MData),
					      .wsiM0_MByteEn(bias$wsiM0_MByteEn),
					      .wsiM0_MReqInfo(bias$wsiM0_MReqInfo),
					      .wsiM0_MReset_n(bias$wsiM0_MReset_n));

  // submodule cap0
  mkWSICaptureWorker4B #(.hasDebugLogic(1'd1)) cap0(.wciS0_Clk(CLK),
						    .wciS0_MReset_n(cp$RST_N_wci_Vm_4),
						    .wciS0_MAddr(cap0$wciS0_MAddr),
						    .wciS0_MAddrSpace(cap0$wciS0_MAddrSpace),
						    .wciS0_MByteEn(cap0$wciS0_MByteEn),
						    .wciS0_MCmd(cap0$wciS0_MCmd),
						    .wciS0_MData(cap0$wciS0_MData),
						    .wciS0_MFlag(cap0$wciS0_MFlag),
						    .wsiS0_MBurstLength(cap0$wsiS0_MBurstLength),
						    .wsiS0_MByteEn(cap0$wsiS0_MByteEn),
						    .wsiS0_MCmd(cap0$wsiS0_MCmd),
						    .wsiS0_MData(cap0$wsiS0_MData),
						    .wsiS0_MReqInfo(cap0$wsiS0_MReqInfo),
						    .wtiS0_MCmd(cap0$wtiS0_MCmd),
						    .wtiS0_MData(cap0$wtiS0_MData),
						    .wsiS0_MReqLast(cap0$wsiS0_MReqLast),
						    .wsiS0_MBurstPrecise(cap0$wsiS0_MBurstPrecise),
						    .wsiS0_MReset_n(cap0$wsiS0_MReset_n),
						    .wciS0_SResp(cap0$wciS0_SResp),
						    .wciS0_SData(cap0$wciS0_SData),
						    .wciS0_SThreadBusy(cap0$wciS0_SThreadBusy),
						    .wciS0_SFlag(cap0$wciS0_SFlag),
						    .wsiS0_SThreadBusy(cap0$wsiS0_SThreadBusy),
						    .wsiS0_SReset_n(cap0$wsiS0_SReset_n),
						    .wtiS0_SThreadBusy(),
						    .wtiS0_SReset_n());

  // submodule cp
  mkOCCP cp(.pciDevice(16'hAAAA),
	    .CLK_time_clk(CLK),
	    .RST_N_time_rst(RST_N),
	    .CLK(CLK),
	    .RST_N(RST_N),
	    .gps_ppsSyncIn_x(cp$gps_ppsSyncIn_x),
	    .server_request_put(cp$server_request_put),
	    .switch_x(cp$switch_x),
	    .uuid_arg(cp$uuid_arg),
	    .wci_Vm_0_SData(cp$wci_Vm_0_SData),
	    .wci_Vm_0_SFlag(cp$wci_Vm_0_SFlag),
	    .wci_Vm_0_SResp(cp$wci_Vm_0_SResp),
	    .wci_Vm_10_SData(cp$wci_Vm_10_SData),
	    .wci_Vm_10_SFlag(cp$wci_Vm_10_SFlag),
	    .wci_Vm_10_SResp(cp$wci_Vm_10_SResp),
	    .wci_Vm_11_SData(cp$wci_Vm_11_SData),
	    .wci_Vm_11_SFlag(cp$wci_Vm_11_SFlag),
	    .wci_Vm_11_SResp(cp$wci_Vm_11_SResp),
	    .wci_Vm_12_SData(cp$wci_Vm_12_SData),
	    .wci_Vm_12_SFlag(cp$wci_Vm_12_SFlag),
	    .wci_Vm_12_SResp(cp$wci_Vm_12_SResp),
	    .wci_Vm_13_SData(cp$wci_Vm_13_SData),
	    .wci_Vm_13_SFlag(cp$wci_Vm_13_SFlag),
	    .wci_Vm_13_SResp(cp$wci_Vm_13_SResp),
	    .wci_Vm_14_SData(cp$wci_Vm_14_SData),
	    .wci_Vm_14_SFlag(cp$wci_Vm_14_SFlag),
	    .wci_Vm_14_SResp(cp$wci_Vm_14_SResp),
	    .wci_Vm_1_SData(cp$wci_Vm_1_SData),
	    .wci_Vm_1_SFlag(cp$wci_Vm_1_SFlag),
	    .wci_Vm_1_SResp(cp$wci_Vm_1_SResp),
	    .wci_Vm_2_SData(cp$wci_Vm_2_SData),
	    .wci_Vm_2_SFlag(cp$wci_Vm_2_SFlag),
	    .wci_Vm_2_SResp(cp$wci_Vm_2_SResp),
	    .wci_Vm_3_SData(cp$wci_Vm_3_SData),
	    .wci_Vm_3_SFlag(cp$wci_Vm_3_SFlag),
	    .wci_Vm_3_SResp(cp$wci_Vm_3_SResp),
	    .wci_Vm_4_SData(cp$wci_Vm_4_SData),
	    .wci_Vm_4_SFlag(cp$wci_Vm_4_SFlag),
	    .wci_Vm_4_SResp(cp$wci_Vm_4_SResp),
	    .wci_Vm_5_SData(cp$wci_Vm_5_SData),
	    .wci_Vm_5_SFlag(cp$wci_Vm_5_SFlag),
	    .wci_Vm_5_SResp(cp$wci_Vm_5_SResp),
	    .wci_Vm_6_SData(cp$wci_Vm_6_SData),
	    .wci_Vm_6_SFlag(cp$wci_Vm_6_SFlag),
	    .wci_Vm_6_SResp(cp$wci_Vm_6_SResp),
	    .wci_Vm_7_SData(cp$wci_Vm_7_SData),
	    .wci_Vm_7_SFlag(cp$wci_Vm_7_SFlag),
	    .wci_Vm_7_SResp(cp$wci_Vm_7_SResp),
	    .wci_Vm_8_SData(cp$wci_Vm_8_SData),
	    .wci_Vm_8_SFlag(cp$wci_Vm_8_SFlag),
	    .wci_Vm_8_SResp(cp$wci_Vm_8_SResp),
	    .wci_Vm_9_SData(cp$wci_Vm_9_SData),
	    .wci_Vm_9_SFlag(cp$wci_Vm_9_SFlag),
	    .wci_Vm_9_SResp(cp$wci_Vm_9_SResp),
	    .EN_server_request_put(cp$EN_server_request_put),
	    .EN_server_response_get(cp$EN_server_response_get),
	    .wci_Vm_0_SThreadBusy(cp$wci_Vm_0_SThreadBusy),
	    .wci_Vm_1_SThreadBusy(cp$wci_Vm_1_SThreadBusy),
	    .wci_Vm_2_SThreadBusy(cp$wci_Vm_2_SThreadBusy),
	    .wci_Vm_3_SThreadBusy(cp$wci_Vm_3_SThreadBusy),
	    .wci_Vm_4_SThreadBusy(cp$wci_Vm_4_SThreadBusy),
	    .wci_Vm_5_SThreadBusy(cp$wci_Vm_5_SThreadBusy),
	    .wci_Vm_6_SThreadBusy(cp$wci_Vm_6_SThreadBusy),
	    .wci_Vm_7_SThreadBusy(cp$wci_Vm_7_SThreadBusy),
	    .wci_Vm_8_SThreadBusy(cp$wci_Vm_8_SThreadBusy),
	    .wci_Vm_9_SThreadBusy(cp$wci_Vm_9_SThreadBusy),
	    .wci_Vm_10_SThreadBusy(cp$wci_Vm_10_SThreadBusy),
	    .wci_Vm_11_SThreadBusy(cp$wci_Vm_11_SThreadBusy),
	    .wci_Vm_12_SThreadBusy(cp$wci_Vm_12_SThreadBusy),
	    .wci_Vm_13_SThreadBusy(cp$wci_Vm_13_SThreadBusy),
	    .wci_Vm_14_SThreadBusy(cp$wci_Vm_14_SThreadBusy),
	    .RDY_server_request_put(cp$RDY_server_request_put),
	    .server_response_get(cp$server_response_get),
	    .RDY_server_response_get(cp$RDY_server_response_get),
	    .wci_Vm_0_MCmd(),
	    .wci_Vm_0_MAddrSpace(),
	    .wci_Vm_0_MByteEn(),
	    .wci_Vm_0_MAddr(),
	    .wci_Vm_0_MData(),
	    .wci_Vm_0_MFlag(),
	    .wci_Vm_1_MCmd(),
	    .wci_Vm_1_MAddrSpace(),
	    .wci_Vm_1_MByteEn(),
	    .wci_Vm_1_MAddr(),
	    .wci_Vm_1_MData(),
	    .wci_Vm_1_MFlag(),
	    .wci_Vm_2_MCmd(cp$wci_Vm_2_MCmd),
	    .wci_Vm_2_MAddrSpace(cp$wci_Vm_2_MAddrSpace),
	    .wci_Vm_2_MByteEn(cp$wci_Vm_2_MByteEn),
	    .wci_Vm_2_MAddr(cp$wci_Vm_2_MAddr),
	    .wci_Vm_2_MData(cp$wci_Vm_2_MData),
	    .wci_Vm_2_MFlag(cp$wci_Vm_2_MFlag),
	    .wci_Vm_3_MCmd(cp$wci_Vm_3_MCmd),
	    .wci_Vm_3_MAddrSpace(cp$wci_Vm_3_MAddrSpace),
	    .wci_Vm_3_MByteEn(cp$wci_Vm_3_MByteEn),
	    .wci_Vm_3_MAddr(cp$wci_Vm_3_MAddr),
	    .wci_Vm_3_MData(cp$wci_Vm_3_MData),
	    .wci_Vm_3_MFlag(cp$wci_Vm_3_MFlag),
	    .wci_Vm_4_MCmd(cp$wci_Vm_4_MCmd),
	    .wci_Vm_4_MAddrSpace(cp$wci_Vm_4_MAddrSpace),
	    .wci_Vm_4_MByteEn(cp$wci_Vm_4_MByteEn),
	    .wci_Vm_4_MAddr(cp$wci_Vm_4_MAddr),
	    .wci_Vm_4_MData(cp$wci_Vm_4_MData),
	    .wci_Vm_4_MFlag(cp$wci_Vm_4_MFlag),
	    .wci_Vm_5_MCmd(),
	    .wci_Vm_5_MAddrSpace(),
	    .wci_Vm_5_MByteEn(),
	    .wci_Vm_5_MAddr(),
	    .wci_Vm_5_MData(),
	    .wci_Vm_5_MFlag(),
	    .wci_Vm_6_MCmd(),
	    .wci_Vm_6_MAddrSpace(),
	    .wci_Vm_6_MByteEn(),
	    .wci_Vm_6_MAddr(),
	    .wci_Vm_6_MData(),
	    .wci_Vm_6_MFlag(),
	    .wci_Vm_7_MCmd(),
	    .wci_Vm_7_MAddrSpace(),
	    .wci_Vm_7_MByteEn(),
	    .wci_Vm_7_MAddr(),
	    .wci_Vm_7_MData(),
	    .wci_Vm_7_MFlag(),
	    .wci_Vm_8_MCmd(),
	    .wci_Vm_8_MAddrSpace(),
	    .wci_Vm_8_MByteEn(),
	    .wci_Vm_8_MAddr(),
	    .wci_Vm_8_MData(),
	    .wci_Vm_8_MFlag(),
	    .wci_Vm_9_MCmd(),
	    .wci_Vm_9_MAddrSpace(),
	    .wci_Vm_9_MByteEn(),
	    .wci_Vm_9_MAddr(),
	    .wci_Vm_9_MData(),
	    .wci_Vm_9_MFlag(),
	    .wci_Vm_10_MCmd(),
	    .wci_Vm_10_MAddrSpace(),
	    .wci_Vm_10_MByteEn(),
	    .wci_Vm_10_MAddr(),
	    .wci_Vm_10_MData(),
	    .wci_Vm_10_MFlag(),
	    .wci_Vm_11_MCmd(),
	    .wci_Vm_11_MAddrSpace(),
	    .wci_Vm_11_MByteEn(),
	    .wci_Vm_11_MAddr(),
	    .wci_Vm_11_MData(),
	    .wci_Vm_11_MFlag(),
	    .wci_Vm_12_MCmd(),
	    .wci_Vm_12_MAddrSpace(),
	    .wci_Vm_12_MByteEn(),
	    .wci_Vm_12_MAddr(),
	    .wci_Vm_12_MData(),
	    .wci_Vm_12_MFlag(),
	    .wci_Vm_13_MCmd(),
	    .wci_Vm_13_MAddrSpace(),
	    .wci_Vm_13_MByteEn(),
	    .wci_Vm_13_MAddr(),
	    .wci_Vm_13_MData(),
	    .wci_Vm_13_MFlag(),
	    .wci_Vm_14_MCmd(),
	    .wci_Vm_14_MAddrSpace(),
	    .wci_Vm_14_MByteEn(),
	    .wci_Vm_14_MAddr(),
	    .wci_Vm_14_MData(),
	    .wci_Vm_14_MFlag(),
	    .cpNow(),
	    .RDY_cpNow(),
	    .gps_ppsSyncOut(),
	    .led(),
	    .RST_N_wci_Vm_0(),
	    .RST_N_wci_Vm_1(),
	    .RST_N_wci_Vm_2(cp$RST_N_wci_Vm_2),
	    .RST_N_wci_Vm_3(cp$RST_N_wci_Vm_3),
	    .RST_N_wci_Vm_4(cp$RST_N_wci_Vm_4),
	    .RST_N_wci_Vm_5(),
	    .RST_N_wci_Vm_6(),
	    .RST_N_wci_Vm_7(),
	    .RST_N_wci_Vm_8(),
	    .RST_N_wci_Vm_9(),
	    .RST_N_wci_Vm_10(),
	    .RST_N_wci_Vm_11(),
	    .RST_N_wci_Vm_12(),
	    .RST_N_wci_Vm_13(),
	    .RST_N_wci_Vm_14());

  // submodule pat0
  mkWSIPatternWorker4B #(.hasDebugLogic(1'd1)) pat0(.wciS0_Clk(CLK),
						    .wciS0_MReset_n(cp$RST_N_wci_Vm_2),
						    .wciS0_MAddr(pat0$wciS0_MAddr),
						    .wciS0_MAddrSpace(pat0$wciS0_MAddrSpace),
						    .wciS0_MByteEn(pat0$wciS0_MByteEn),
						    .wciS0_MCmd(pat0$wciS0_MCmd),
						    .wciS0_MData(pat0$wciS0_MData),
						    .wciS0_MFlag(pat0$wciS0_MFlag),
						    .wsiM0_SThreadBusy(pat0$wsiM0_SThreadBusy),
						    .wsiM0_SReset_n(pat0$wsiM0_SReset_n),
						    .wciS0_SResp(pat0$wciS0_SResp),
						    .wciS0_SData(pat0$wciS0_SData),
						    .wciS0_SThreadBusy(pat0$wciS0_SThreadBusy),
						    .wciS0_SFlag(pat0$wciS0_SFlag),
						    .wsiM0_MCmd(pat0$wsiM0_MCmd),
						    .wsiM0_MReqLast(pat0$wsiM0_MReqLast),
						    .wsiM0_MBurstPrecise(pat0$wsiM0_MBurstPrecise),
						    .wsiM0_MBurstLength(pat0$wsiM0_MBurstLength),
						    .wsiM0_MData(pat0$wsiM0_MData),
						    .wsiM0_MByteEn(pat0$wsiM0_MByteEn),
						    .wsiM0_MReqInfo(pat0$wsiM0_MReqInfo),
						    .wsiM0_MReset_n(pat0$wsiM0_MReset_n));

  // submodule simDCP
  mkSimDCP simDCP(.CLK(CLK),
		  .RST_N(RST_N),
		  .client_response_put(simDCP$client_response_put),
		  .host_request_put(simDCP$host_request_put),
		  .EN_host_request_put(simDCP$EN_host_request_put),
		  .EN_host_response_get(simDCP$EN_host_response_get),
		  .EN_client_request_get(simDCP$EN_client_request_get),
		  .EN_client_response_put(simDCP$EN_client_response_put),
		  .RDY_host_request_put(simDCP$RDY_host_request_put),
		  .host_response_get(simDCP$host_response_get),
		  .RDY_host_response_get(simDCP$RDY_host_response_get),
		  .client_request_get(simDCP$client_request_get),
		  .RDY_client_request_get(simDCP$RDY_client_request_get),
		  .RDY_client_response_put(simDCP$RDY_client_response_put));

  // submodule simIO
  mkSimIO simIO(.CLK(CLK),
		.RST_N(RST_N),
		.host_response_put(simIO$host_response_put),
		.EN_host_request_get(simIO$EN_host_request_get),
		.EN_host_response_put(simIO$EN_host_response_put),
		.host_request_get(simIO$host_request_get),
		.RDY_host_request_get(simIO$RDY_host_request_get),
		.RDY_host_response_put(simIO$RDY_host_response_put));

  // register simCycle
  assign simCycle$D_IN = simCycle + 16'd1 ;
  assign simCycle$EN = 1'd1 ;

  // submodule bias
  assign bias$wciS0_MAddr = cp$wci_Vm_3_MAddr ;
  assign bias$wciS0_MAddrSpace = cp$wci_Vm_3_MAddrSpace ;
  assign bias$wciS0_MByteEn = cp$wci_Vm_3_MByteEn ;
  assign bias$wciS0_MCmd = cp$wci_Vm_3_MCmd ;
  assign bias$wciS0_MData = cp$wci_Vm_3_MData ;
  assign bias$wciS0_MFlag = cp$wci_Vm_3_MFlag ;
  assign bias$wsiS0_MBurstLength = pat0$wsiM0_MBurstLength ;
  assign bias$wsiS0_MByteEn = pat0$wsiM0_MByteEn ;
  assign bias$wsiS0_MCmd = pat0$wsiM0_MCmd ;
  assign bias$wsiS0_MData = pat0$wsiM0_MData ;
  assign bias$wsiS0_MReqInfo = pat0$wsiM0_MReqInfo ;
  assign bias$wsiS0_MReqLast = pat0$wsiM0_MReqLast ;
  assign bias$wsiS0_MBurstPrecise = pat0$wsiM0_MBurstPrecise ;
  assign bias$wsiS0_MReset_n = pat0$wsiM0_MReset_n ;
  assign bias$wsiM0_SThreadBusy = cap0$wsiS0_SThreadBusy ;
  assign bias$wsiM0_SReset_n = cap0$wsiS0_SReset_n ;

  // submodule cap0
  assign cap0$wciS0_MAddr = cp$wci_Vm_4_MAddr ;
  assign cap0$wciS0_MAddrSpace = cp$wci_Vm_4_MAddrSpace ;
  assign cap0$wciS0_MByteEn = cp$wci_Vm_4_MByteEn ;
  assign cap0$wciS0_MCmd = cp$wci_Vm_4_MCmd ;
  assign cap0$wciS0_MData = cp$wci_Vm_4_MData ;
  assign cap0$wciS0_MFlag = cp$wci_Vm_4_MFlag ;
  assign cap0$wsiS0_MBurstLength = bias$wsiM0_MBurstLength ;
  assign cap0$wsiS0_MByteEn = bias$wsiM0_MByteEn ;
  assign cap0$wsiS0_MCmd = bias$wsiM0_MCmd ;
  assign cap0$wsiS0_MData = bias$wsiM0_MData ;
  assign cap0$wsiS0_MReqInfo = bias$wsiM0_MReqInfo ;
  assign cap0$wtiS0_MCmd = 3'h0 ;
  assign cap0$wtiS0_MData = 64'h0 ;
  assign cap0$wsiS0_MReqLast = bias$wsiM0_MReqLast ;
  assign cap0$wsiS0_MBurstPrecise = bias$wsiM0_MBurstPrecise ;
  assign cap0$wsiS0_MReset_n = bias$wsiM0_MReset_n ;

  // submodule cp
  assign cp$gps_ppsSyncIn_x = 1'b0 ;
  assign cp$server_request_put = simDCP$client_request_get ;
  assign cp$switch_x = 3'h0 ;
  assign cp$uuid_arg = 512'h0 ;
  assign cp$wci_Vm_0_SData = 32'h0 ;
  assign cp$wci_Vm_0_SFlag = 2'h0 ;
  assign cp$wci_Vm_0_SResp = 2'h0 ;
  assign cp$wci_Vm_10_SData = 32'h0 ;
  assign cp$wci_Vm_10_SFlag = 2'h0 ;
  assign cp$wci_Vm_10_SResp = 2'h0 ;
  assign cp$wci_Vm_11_SData = 32'h0 ;
  assign cp$wci_Vm_11_SFlag = 2'h0 ;
  assign cp$wci_Vm_11_SResp = 2'h0 ;
  assign cp$wci_Vm_12_SData = 32'h0 ;
  assign cp$wci_Vm_12_SFlag = 2'h0 ;
  assign cp$wci_Vm_12_SResp = 2'h0 ;
  assign cp$wci_Vm_13_SData = 32'h0 ;
  assign cp$wci_Vm_13_SFlag = 2'h0 ;
  assign cp$wci_Vm_13_SResp = 2'h0 ;
  assign cp$wci_Vm_14_SData = 32'h0 ;
  assign cp$wci_Vm_14_SFlag = 2'h0 ;
  assign cp$wci_Vm_14_SResp = 2'h0 ;
  assign cp$wci_Vm_1_SData = 32'h0 ;
  assign cp$wci_Vm_1_SFlag = 2'h0 ;
  assign cp$wci_Vm_1_SResp = 2'h0 ;
  assign cp$wci_Vm_2_SData = pat0$wciS0_SData ;
  assign cp$wci_Vm_2_SFlag = pat0$wciS0_SFlag ;
  assign cp$wci_Vm_2_SResp = pat0$wciS0_SResp ;
  assign cp$wci_Vm_3_SData = bias$wciS0_SData ;
  assign cp$wci_Vm_3_SFlag = bias$wciS0_SFlag ;
  assign cp$wci_Vm_3_SResp = bias$wciS0_SResp ;
  assign cp$wci_Vm_4_SData = cap0$wciS0_SData ;
  assign cp$wci_Vm_4_SFlag = cap0$wciS0_SFlag ;
  assign cp$wci_Vm_4_SResp = cap0$wciS0_SResp ;
  assign cp$wci_Vm_5_SData = 32'h0 ;
  assign cp$wci_Vm_5_SFlag = 2'h0 ;
  assign cp$wci_Vm_5_SResp = 2'h0 ;
  assign cp$wci_Vm_6_SData = 32'h0 ;
  assign cp$wci_Vm_6_SFlag = 2'h0 ;
  assign cp$wci_Vm_6_SResp = 2'h0 ;
  assign cp$wci_Vm_7_SData = 32'h0 ;
  assign cp$wci_Vm_7_SFlag = 2'h0 ;
  assign cp$wci_Vm_7_SResp = 2'h0 ;
  assign cp$wci_Vm_8_SData = 32'h0 ;
  assign cp$wci_Vm_8_SFlag = 2'h0 ;
  assign cp$wci_Vm_8_SResp = 2'h0 ;
  assign cp$wci_Vm_9_SData = 32'h0 ;
  assign cp$wci_Vm_9_SFlag = 2'h0 ;
  assign cp$wci_Vm_9_SResp = 2'h0 ;
  assign cp$EN_server_request_put =
	     simDCP$RDY_client_request_get && cp$RDY_server_request_put ;
  assign cp$EN_server_response_get =
	     simDCP$RDY_client_response_put && cp$RDY_server_response_get ;
  assign cp$wci_Vm_0_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_1_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_2_SThreadBusy = pat0$wciS0_SThreadBusy ;
  assign cp$wci_Vm_3_SThreadBusy = bias$wciS0_SThreadBusy ;
  assign cp$wci_Vm_4_SThreadBusy = cap0$wciS0_SThreadBusy ;
  assign cp$wci_Vm_5_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_6_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_7_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_8_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_9_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_10_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_11_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_12_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_13_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_14_SThreadBusy = 1'b0 ;

  // submodule pat0
  assign pat0$wciS0_MAddr = cp$wci_Vm_2_MAddr ;
  assign pat0$wciS0_MAddrSpace = cp$wci_Vm_2_MAddrSpace ;
  assign pat0$wciS0_MByteEn = cp$wci_Vm_2_MByteEn ;
  assign pat0$wciS0_MCmd = cp$wci_Vm_2_MCmd ;
  assign pat0$wciS0_MData = cp$wci_Vm_2_MData ;
  assign pat0$wciS0_MFlag = cp$wci_Vm_2_MFlag ;
  assign pat0$wsiM0_SThreadBusy = bias$wsiS0_SThreadBusy ;
  assign pat0$wsiM0_SReset_n = bias$wsiS0_SReset_n ;

  // submodule simDCP
  assign simDCP$client_response_put = cp$server_response_get ;
  assign simDCP$host_request_put = simIO$host_request_get ;
  assign simDCP$EN_host_request_put =
	     simDCP$RDY_host_request_put && simIO$RDY_host_request_get ;
  assign simDCP$EN_host_response_get =
	     simDCP$RDY_host_response_get && simIO$RDY_host_response_put ;
  assign simDCP$EN_client_request_get =
	     simDCP$RDY_client_request_get && cp$RDY_server_request_put ;
  assign simDCP$EN_client_response_put =
	     simDCP$RDY_client_response_put && cp$RDY_server_response_get ;

  // submodule simIO
  assign simIO$host_response_put = simDCP$host_response_get ;
  assign simIO$EN_host_request_get =
	     simDCP$RDY_host_request_put && simIO$RDY_host_request_get ;
  assign simIO$EN_host_response_put =
	     simDCP$RDY_host_response_get && simIO$RDY_host_response_put ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        simCycle <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (simCycle$EN) simCycle <= `BSV_ASSIGNMENT_DELAY simCycle$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    simCycle = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkTB18

