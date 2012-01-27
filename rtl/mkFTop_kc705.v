//
// Generated by Bluespec Compiler, version 2011.06.D (build 24470, 2011-06-30)
//
// On Fri Jan 27 16:41:59 EST 2012
//
//
// Ports:
// Name                         I/O  size props
// pcie_txp                       O     4
// pcie_txn                       O     4
// RDY_usr_sw                     O     1 const
// led                            O     8
// lcd_db                         O     4
// lcd_e                          O     1
// lcd_rs                         O     1
// lcd_rw                         O     1
// debug                          O    16 reg
// RDY_debug                      O     1 const
// p125clk                        O     1 clock
// CLK_GATE_p125clk               O     1 const
// p125rst                        O     1 reset
// sys0_clkp                      I     1 clock
// sys0_clkn                      I     1 clock
// sys0_rstn                      I     1 reset
// pci0_clkp                      I     1 clock
// pci0_clkn                      I     1 clock
// pci0_rstn                      I     1 reset
// pcie_rxp_i                     I     4
// pcie_rxn_i                     I     4
// usr_sw_i                       I     8 unused
// EN_usr_sw                      I     1 unused
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
`define BSV_ASSIGNMENT_DELAY
`endif

module mkFTop_kc705(sys0_clkp,
		    sys0_clkn,
		    sys0_rstn,
		    pci0_clkp,
		    pci0_clkn,
		    pci0_rstn,

		    pcie_rxp_i,

		    pcie_rxn_i,

		    pcie_txp,

		    pcie_txn,

		    usr_sw_i,
		    EN_usr_sw,
		    RDY_usr_sw,

		    led,

		    lcd_db,

		    lcd_e,

		    lcd_rs,

		    lcd_rw,

		    debug,
		    RDY_debug,

		    p125clk,
		    CLK_GATE_p125clk,

		    p125rst);
  input  sys0_clkp;
  input  sys0_clkn;
  input  sys0_rstn;
  input  pci0_clkp;
  input  pci0_clkn;
  input  pci0_rstn;

  // action method pcie_rxp
  input  [3 : 0] pcie_rxp_i;

  // action method pcie_rxn
  input  [3 : 0] pcie_rxn_i;

  // value method pcie_txp
  output [3 : 0] pcie_txp;

  // value method pcie_txn
  output [3 : 0] pcie_txn;

  // action method usr_sw
  input  [7 : 0] usr_sw_i;
  input  EN_usr_sw;
  output RDY_usr_sw;

  // value method led
  output [7 : 0] led;

  // value method lcd_db
  output [3 : 0] lcd_db;

  // value method lcd_e
  output lcd_e;

  // value method lcd_rs
  output lcd_rs;

  // value method lcd_rw
  output lcd_rw;

  // value method debug
  output [15 : 0] debug;
  output RDY_debug;

  // oscillator and gates for output clock p125clk
  output p125clk;
  output CLK_GATE_p125clk;

  // output resets
  output p125rst;

  // signals for module outputs
  wire [15 : 0] debug;
  wire [7 : 0] led;
  wire [3 : 0] lcd_db, pcie_txn, pcie_txp;
  wire CLK_GATE_p125clk,
       RDY_debug,
       RDY_usr_sw,
       lcd_e,
       lcd_rs,
       lcd_rw,
       p125clk,
       p125rst;

  // inlined wires
  wire [127 : 0] pciw_pci0_axiTxData$wget;
  wire [15 : 0] pciw_pci0_axiTxKeep$wget;
  wire [3 : 0] pciw_pci0_axiTxUser$wget;
  wire [1 : 0] infLed$wget;
  wire blinkLed$wget,
       pciw_pci0_axiTxData$whas,
       pciw_pci0_axiTxKeep$whas,
       pciw_pci0_axiTxLast$wget,
       pciw_pci0_axiTxLast$whas,
       pciw_pci0_axiTxUser$whas,
       pciw_pci0_axiTxValid$wget,
       pciw_pci0_axiTxValid$whas;

  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;

  // register needs_init
  reg needs_init;
  wire needs_init$D_IN, needs_init$EN;

  // register pciDevice
  reg [15 : 0] pciDevice;
  wire [15 : 0] pciDevice$D_IN;
  wire pciDevice$EN;

  // register pciw_pciDevice
  reg [15 : 0] pciw_pciDevice;
  wire [15 : 0] pciw_pciDevice$D_IN;
  wire pciw_pciDevice$EN;

  // ports of submodule ctop
  wire [152 : 0] ctop$server_request_put, ctop$server_response_get;
  wire [127 : 0] ctop$wmemiM0_SData;
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
  wire [1 : 0] ctop$led,
	       ctop$wci_m_0_SFlag,
	       ctop$wci_m_0_SResp,
	       ctop$wci_m_1_SFlag,
	       ctop$wci_m_1_SResp,
	       ctop$wci_m_2_SFlag,
	       ctop$wci_m_2_SResp,
	       ctop$wci_m_3_SFlag,
	       ctop$wci_m_3_SResp,
	       ctop$wci_m_4_SFlag,
	       ctop$wci_m_4_SResp,
	       ctop$wmemiM0_SResp;
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
       ctop$wmemiM0_SCmdAccept,
       ctop$wmemiM0_SDataAccept,
       ctop$wmemiM0_SRespLast,
       ctop$wsi_m_dac_SReset_n,
       ctop$wsi_m_dac_SThreadBusy,
       ctop$wsi_s_adc_MBurstPrecise,
       ctop$wsi_s_adc_MReqLast,
       ctop$wsi_s_adc_MReset_n;

  // ports of submodule lcd_ctrl
  wire [127 : 0] lcd_ctrl$setLine1_text, lcd_ctrl$setLine2_text;
  wire [3 : 0] lcd_ctrl$db;
  wire lcd_ctrl$EN_setLine1,
       lcd_ctrl$EN_setLine2,
       lcd_ctrl$e,
       lcd_ctrl$rs,
       lcd_ctrl$rw;

  // ports of submodule pciw_fI2P
  wire [152 : 0] pciw_fI2P$D_IN, pciw_fI2P$D_OUT;
  wire pciw_fI2P$CLR,
       pciw_fI2P$DEQ,
       pciw_fI2P$EMPTY_N,
       pciw_fI2P$ENQ,
       pciw_fI2P$FULL_N;

  // ports of submodule pciw_fP2I
  wire [152 : 0] pciw_fP2I$D_IN, pciw_fP2I$D_OUT;
  wire pciw_fP2I$CLR,
       pciw_fP2I$DEQ,
       pciw_fP2I$EMPTY_N,
       pciw_fP2I$ENQ,
       pciw_fP2I$FULL_N;

  // ports of submodule pciw_p125rst
  wire pciw_p125rst$OUT_RST_N;

  // ports of submodule pciw_pci0_axiRst125
  wire pciw_pci0_axiRst125$OUT_RST_N;

  // ports of submodule pciw_pci0_clk
  wire pciw_pci0_clk$O;

  // ports of submodule pciw_pci0_pcie_ep
  wire [127 : 0] pciw_pci0_pcie_ep$cfg_err_aer_headerlog,
		 pciw_pci0_pcie_ep$m_axis_rx_tdata,
		 pciw_pci0_pcie_ep$s_axis_tx_tdata;
  wire [63 : 0] pciw_pci0_pcie_ep$cfg_dsn;
  wire [47 : 0] pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header;
  wire [31 : 0] pciw_pci0_pcie_ep$cfg_mgmt_di;
  wire [21 : 0] pciw_pci0_pcie_ep$m_axis_rx_tuser;
  wire [15 : 0] pciw_pci0_pcie_ep$s_axis_tx_tkeep;
  wire [9 : 0] pciw_pci0_pcie_ep$cfg_mgmt_dwaddr;
  wire [7 : 0] pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_interrupt_di;
  wire [4 : 0] pciw_pci0_pcie_ep$cfg_device_number,
	       pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum;
  wire [3 : 0] pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN,
	       pciw_pci0_pcie_ep$cfg_mgmt_byte_en,
	       pciw_pci0_pcie_ep$pci_exp_rxn,
	       pciw_pci0_pcie_ep$pci_exp_rxp,
	       pciw_pci0_pcie_ep$pci_exp_txn,
	       pciw_pci0_pcie_ep$pci_exp_txp,
	       pciw_pci0_pcie_ep$s_axis_tx_tuser;
  wire [2 : 0] pciw_pci0_pcie_ep$cfg_function_number,
	       pciw_pci0_pcie_ep$fc_sel;
  wire [1 : 0] pciw_pci0_pcie_ep$cfg_pm_force_state,
	       pciw_pci0_pcie_ep$pl_directed_link_change,
	       pciw_pci0_pcie_ep$pl_directed_link_width;
  wire pciw_pci0_pcie_ep$PIPE_DCLK_IN,
       pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN,
       pciw_pci0_pcie_ep$PIPE_OOBCLK_IN,
       pciw_pci0_pcie_ep$PIPE_PCLK_IN,
       pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN,
       pciw_pci0_pcie_ep$PIPE_USERCLK1_IN,
       pciw_pci0_pcie_ep$PIPE_USERCLK2_IN,
       pciw_pci0_pcie_ep$cfg_err_acs,
       pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked,
       pciw_pci0_pcie_ep$cfg_err_cor,
       pciw_pci0_pcie_ep$cfg_err_cpl_abort,
       pciw_pci0_pcie_ep$cfg_err_cpl_timeout,
       pciw_pci0_pcie_ep$cfg_err_cpl_unexpect,
       pciw_pci0_pcie_ep$cfg_err_ecrc,
       pciw_pci0_pcie_ep$cfg_err_internal_cor,
       pciw_pci0_pcie_ep$cfg_err_internal_uncor,
       pciw_pci0_pcie_ep$cfg_err_locked,
       pciw_pci0_pcie_ep$cfg_err_malformed,
       pciw_pci0_pcie_ep$cfg_err_mc_blocked,
       pciw_pci0_pcie_ep$cfg_err_norecovery,
       pciw_pci0_pcie_ep$cfg_err_poisoned,
       pciw_pci0_pcie_ep$cfg_err_posted,
       pciw_pci0_pcie_ep$cfg_err_ur,
       pciw_pci0_pcie_ep$cfg_interrupt,
       pciw_pci0_pcie_ep$cfg_interrupt_assert,
       pciw_pci0_pcie_ep$cfg_interrupt_stat,
       pciw_pci0_pcie_ep$cfg_mgmt_rd_en,
       pciw_pci0_pcie_ep$cfg_mgmt_wr_en,
       pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly,
       pciw_pci0_pcie_ep$cfg_pm_force_state_en,
       pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s,
       pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1,
       pciw_pci0_pcie_ep$cfg_pm_wake,
       pciw_pci0_pcie_ep$cfg_trn_pending,
       pciw_pci0_pcie_ep$cfg_turnoff_ok,
       pciw_pci0_pcie_ep$m_axis_rx_tready,
       pciw_pci0_pcie_ep$m_axis_rx_tvalid,
       pciw_pci0_pcie_ep$pl_directed_link_auton,
       pciw_pci0_pcie_ep$pl_directed_link_speed,
       pciw_pci0_pcie_ep$pl_upstream_prefer_deemph,
       pciw_pci0_pcie_ep$rx_np_ok,
       pciw_pci0_pcie_ep$rx_np_req,
       pciw_pci0_pcie_ep$s_axis_tx_tlast,
       pciw_pci0_pcie_ep$s_axis_tx_tready,
       pciw_pci0_pcie_ep$s_axis_tx_tvalid,
       pciw_pci0_pcie_ep$tx_cfg_gnt,
       pciw_pci0_pcie_ep$user_clk_out,
       pciw_pci0_pcie_ep$user_lnk_up,
       pciw_pci0_pcie_ep$user_reset_out;

  // ports of submodule pciw_pci0_pcie_ep_reset
  wire pciw_pci0_pcie_ep_reset$RESET_OUT;

  // ports of submodule pciw_pci0_rxF
  wire [152 : 0] pciw_pci0_rxF$D_IN, pciw_pci0_rxF$D_OUT;
  wire pciw_pci0_rxF$CLR,
       pciw_pci0_rxF$DEQ,
       pciw_pci0_rxF$EMPTY_N,
       pciw_pci0_rxF$ENQ,
       pciw_pci0_rxF$FULL_N;

  // ports of submodule pciw_pci0_txF
  wire [152 : 0] pciw_pci0_txF$D_IN, pciw_pci0_txF$D_OUT;
  wire pciw_pci0_txF$CLR,
       pciw_pci0_txF$DEQ,
       pciw_pci0_txF$EMPTY_N,
       pciw_pci0_txF$ENQ,
       pciw_pci0_txF$FULL_N;

  // ports of submodule pciw_pci0_usr_rst_n
  wire pciw_pci0_usr_rst_n$RESET_OUT;

  // ports of submodule sys0_clk
  wire sys0_clk$O;

  // ports of submodule sys0_rst
  wire sys0_rst$OUT_RST_N;

  // remaining internal signals
  reg [15 : 0] CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1;
  wire [127 : 0] x_data__h1484;
  wire [15 : 0] IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d95,
		x_be__h1483;

  // oscillator and gates for output clock p125clk
  assign p125clk = pciw_pci0_pcie_ep$user_clk_out ;
  assign CLK_GATE_p125clk = 1'b1 ;

  // output resets
  assign p125rst = pciw_p125rst$OUT_RST_N ;

  // value method pcie_txp
  assign pcie_txp = pciw_pci0_pcie_ep$pci_exp_txp ;

  // value method pcie_txn
  assign pcie_txn = pciw_pci0_pcie_ep$pci_exp_txn ;

  // action method usr_sw
  assign RDY_usr_sw = 1'd1 ;

  // value method led
  assign led =
	     { freeCnt[25], 4'b0, ctop$led, pciw_pci0_pcie_ep$user_lnk_up } ;

  // value method lcd_db
  assign lcd_db = lcd_ctrl$db ;

  // value method lcd_e
  assign lcd_e = lcd_ctrl$e ;

  // value method lcd_rs
  assign lcd_rs = lcd_ctrl$rs ;

  // value method lcd_rw
  assign lcd_rw = lcd_ctrl$rw ;

  // value method debug
  assign debug = freeCnt[31:16] ;
  assign RDY_debug = 1'd1 ;

  // submodule ctop
  mkCTop4B ctop(.pciDevice(pciDevice),
		.CLK_sys0_clk(sys0_clk$O),
		.RST_N_sys0_rst(sys0_rst$OUT_RST_N),
		.CLK(pciw_pci0_pcie_ep$user_clk_out),
		.RST_N(pciw_p125rst$OUT_RST_N),
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
		.wmemiM0_SData(ctop$wmemiM0_SData),
		.wmemiM0_SResp(ctop$wmemiM0_SResp),
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
		.wmemiM0_SRespLast(ctop$wmemiM0_SRespLast),
		.wmemiM0_SCmdAccept(ctop$wmemiM0_SCmdAccept),
		.wmemiM0_SDataAccept(ctop$wmemiM0_SDataAccept),
		.RDY_server_request_put(ctop$RDY_server_request_put),
		.server_response_get(ctop$server_response_get),
		.RDY_server_response_get(ctop$RDY_server_response_get),
		.led(ctop$led),
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
		.wmemiM0_MCmd(),
		.wmemiM0_MReqLast(),
		.wmemiM0_MAddr(),
		.wmemiM0_MBurstLength(),
		.wmemiM0_MDataValid(),
		.wmemiM0_MDataLast(),
		.wmemiM0_MData(),
		.wmemiM0_MDataByteEn(),
		.wmemiM0_MReset_n(),
		.gps_ppsSyncOut(),
		.RST_N_wci_m_0(),
		.RST_N_wci_m_1(),
		.RST_N_wci_m_2(),
		.RST_N_wci_m_3(),
		.RST_N_wci_m_4());

  // submodule lcd_ctrl
  mkLCDController lcd_ctrl(.CLK(sys0_clk$O),
			   .RST_N(sys0_rst$OUT_RST_N),
			   .setLine1_text(lcd_ctrl$setLine1_text),
			   .setLine2_text(lcd_ctrl$setLine2_text),
			   .EN_setLine1(lcd_ctrl$EN_setLine1),
			   .EN_setLine2(lcd_ctrl$EN_setLine2),
			   .db(lcd_ctrl$db),
			   .e(lcd_ctrl$e),
			   .rs(lcd_ctrl$rs),
			   .rw(lcd_ctrl$rw));

  // submodule pciw_fI2P
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_fI2P(.RST_N(pciw_p125rst$OUT_RST_N),
				     .CLK(pciw_pci0_pcie_ep$user_clk_out),
				     .D_IN(pciw_fI2P$D_IN),
				     .ENQ(pciw_fI2P$ENQ),
				     .DEQ(pciw_fI2P$DEQ),
				     .CLR(pciw_fI2P$CLR),
				     .D_OUT(pciw_fI2P$D_OUT),
				     .FULL_N(pciw_fI2P$FULL_N),
				     .EMPTY_N(pciw_fI2P$EMPTY_N));

  // submodule pciw_fP2I
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_fP2I(.RST_N(pciw_p125rst$OUT_RST_N),
				     .CLK(pciw_pci0_pcie_ep$user_clk_out),
				     .D_IN(pciw_fP2I$D_IN),
				     .ENQ(pciw_fP2I$ENQ),
				     .DEQ(pciw_fP2I$DEQ),
				     .CLR(pciw_fP2I$CLR),
				     .D_OUT(pciw_fP2I$D_OUT),
				     .FULL_N(pciw_fP2I$FULL_N),
				     .EMPTY_N(pciw_fP2I$EMPTY_N));

  // submodule pciw_p125rst
  SyncResetA #(.RSTDELAY(32'd0)) pciw_p125rst(.CLK(pciw_pci0_pcie_ep$user_clk_out),
					      .IN_RST_N(pciw_pci0_usr_rst_n$RESET_OUT),
					      .OUT_RST_N(pciw_p125rst$OUT_RST_N));

  // submodule pciw_pci0_axiRst125
  SyncResetA #(.RSTDELAY(32'd1)) pciw_pci0_axiRst125(.CLK(pciw_pci0_pcie_ep$user_clk_out),
						     .IN_RST_N(pciw_pci0_usr_rst_n$RESET_OUT),
						     .OUT_RST_N(pciw_pci0_axiRst125$OUT_RST_N));

  // submodule pciw_pci0_clk
  IBUFDS_GTE2 pciw_pci0_clk(.I(pci0_clkp),
			    .IB(pci0_clkn),
			    .CEB(1'd0),
			    .O(pciw_pci0_clk$O),
			    .ODIV2());

  // submodule pciw_pci0_pcie_ep
  pcie_7x_v1_3 #(.PL_FAST_TRAIN("FALSE")) pciw_pci0_pcie_ep(.sys_clk(pciw_pci0_clk$O),
							    .sys_reset(pciw_pci0_pcie_ep_reset$RESET_OUT),
							    .PIPE_DCLK_IN(pciw_pci0_pcie_ep$PIPE_DCLK_IN),
							    .PIPE_MMCM_LOCK_IN(pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN),
							    .PIPE_OOBCLK_IN(pciw_pci0_pcie_ep$PIPE_OOBCLK_IN),
							    .PIPE_PCLK_IN(pciw_pci0_pcie_ep$PIPE_PCLK_IN),
							    .PIPE_RXOUTCLK_IN(pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN),
							    .PIPE_RXUSRCLK_IN(pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN),
							    .PIPE_USERCLK1_IN(pciw_pci0_pcie_ep$PIPE_USERCLK1_IN),
							    .PIPE_USERCLK2_IN(pciw_pci0_pcie_ep$PIPE_USERCLK2_IN),
							    .cfg_dsn(pciw_pci0_pcie_ep$cfg_dsn),
							    .cfg_err_acs(pciw_pci0_pcie_ep$cfg_err_acs),
							    .cfg_err_aer_headerlog(pciw_pci0_pcie_ep$cfg_err_aer_headerlog),
							    .cfg_err_atomic_egress_blocked(pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked),
							    .cfg_err_cor(pciw_pci0_pcie_ep$cfg_err_cor),
							    .cfg_err_cpl_abort(pciw_pci0_pcie_ep$cfg_err_cpl_abort),
							    .cfg_err_cpl_timeout(pciw_pci0_pcie_ep$cfg_err_cpl_timeout),
							    .cfg_err_cpl_unexpect(pciw_pci0_pcie_ep$cfg_err_cpl_unexpect),
							    .cfg_err_ecrc(pciw_pci0_pcie_ep$cfg_err_ecrc),
							    .cfg_err_internal_cor(pciw_pci0_pcie_ep$cfg_err_internal_cor),
							    .cfg_err_internal_uncor(pciw_pci0_pcie_ep$cfg_err_internal_uncor),
							    .cfg_err_locked(pciw_pci0_pcie_ep$cfg_err_locked),
							    .cfg_err_malformed(pciw_pci0_pcie_ep$cfg_err_malformed),
							    .cfg_err_mc_blocked(pciw_pci0_pcie_ep$cfg_err_mc_blocked),
							    .cfg_err_norecovery(pciw_pci0_pcie_ep$cfg_err_norecovery),
							    .cfg_err_poisoned(pciw_pci0_pcie_ep$cfg_err_poisoned),
							    .cfg_err_posted(pciw_pci0_pcie_ep$cfg_err_posted),
							    .cfg_err_tlp_cpl_header(pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header),
							    .cfg_err_ur(pciw_pci0_pcie_ep$cfg_err_ur),
							    .cfg_interrupt(pciw_pci0_pcie_ep$cfg_interrupt),
							    .cfg_interrupt_assert(pciw_pci0_pcie_ep$cfg_interrupt_assert),
							    .cfg_interrupt_di(pciw_pci0_pcie_ep$cfg_interrupt_di),
							    .cfg_interrupt_stat(pciw_pci0_pcie_ep$cfg_interrupt_stat),
							    .cfg_mgmt_byte_en(pciw_pci0_pcie_ep$cfg_mgmt_byte_en),
							    .cfg_mgmt_di(pciw_pci0_pcie_ep$cfg_mgmt_di),
							    .cfg_mgmt_dwaddr(pciw_pci0_pcie_ep$cfg_mgmt_dwaddr),
							    .cfg_mgmt_rd_en(pciw_pci0_pcie_ep$cfg_mgmt_rd_en),
							    .cfg_mgmt_wr_en(pciw_pci0_pcie_ep$cfg_mgmt_wr_en),
							    .cfg_mgmt_wr_readonly(pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly),
							    .cfg_pciecap_interrupt_msgnum(pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum),
							    .cfg_pm_force_state(pciw_pci0_pcie_ep$cfg_pm_force_state),
							    .cfg_pm_force_state_en(pciw_pci0_pcie_ep$cfg_pm_force_state_en),
							    .cfg_pm_halt_aspm_l0s(pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s),
							    .cfg_pm_halt_aspm_l1(pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1),
							    .cfg_pm_wake(pciw_pci0_pcie_ep$cfg_pm_wake),
							    .cfg_trn_pending(pciw_pci0_pcie_ep$cfg_trn_pending),
							    .cfg_turnoff_ok(pciw_pci0_pcie_ep$cfg_turnoff_ok),
							    .fc_sel(pciw_pci0_pcie_ep$fc_sel),
							    .m_axis_rx_tready(pciw_pci0_pcie_ep$m_axis_rx_tready),
							    .pci_exp_rxn(pciw_pci0_pcie_ep$pci_exp_rxn),
							    .pci_exp_rxp(pciw_pci0_pcie_ep$pci_exp_rxp),
							    .pl_directed_link_auton(pciw_pci0_pcie_ep$pl_directed_link_auton),
							    .pl_directed_link_change(pciw_pci0_pcie_ep$pl_directed_link_change),
							    .pl_directed_link_speed(pciw_pci0_pcie_ep$pl_directed_link_speed),
							    .pl_directed_link_width(pciw_pci0_pcie_ep$pl_directed_link_width),
							    .pl_upstream_prefer_deemph(pciw_pci0_pcie_ep$pl_upstream_prefer_deemph),
							    .rx_np_ok(pciw_pci0_pcie_ep$rx_np_ok),
							    .rx_np_req(pciw_pci0_pcie_ep$rx_np_req),
							    .s_axis_tx_tdata(pciw_pci0_pcie_ep$s_axis_tx_tdata),
							    .s_axis_tx_tkeep(pciw_pci0_pcie_ep$s_axis_tx_tkeep),
							    .s_axis_tx_tlast(pciw_pci0_pcie_ep$s_axis_tx_tlast),
							    .s_axis_tx_tuser(pciw_pci0_pcie_ep$s_axis_tx_tuser),
							    .s_axis_tx_tvalid(pciw_pci0_pcie_ep$s_axis_tx_tvalid),
							    .tx_cfg_gnt(pciw_pci0_pcie_ep$tx_cfg_gnt),
							    .pci_exp_txp(pciw_pci0_pcie_ep$pci_exp_txp),
							    .pci_exp_txn(pciw_pci0_pcie_ep$pci_exp_txn),
							    .cfg_mgmt_do(),
							    .cfg_mgmt_rd_wr_done(),
							    .cfg_to_turnoff(),
							    .cfg_bus_number(pciw_pci0_pcie_ep$cfg_bus_number),
							    .cfg_device_number(pciw_pci0_pcie_ep$cfg_device_number),
							    .cfg_function_number(pciw_pci0_pcie_ep$cfg_function_number),
							    .cfg_interrupt_rdy(),
							    .cfg_interrupt_do(),
							    .cfg_interrupt_mmenable(),
							    .cfg_interrupt_msienable(),
							    .cfg_interrupt_msixenable(),
							    .cfg_interrupt_msixfm(),
							    .pl_initial_link_width(),
							    .pl_lane_reversal_mode(),
							    .pl_link_gen2_cap(),
							    .pl_link_partner_gen2_supported(),
							    .pl_link_upcfg_cap(),
							    .pl_sel_lnk_rate(),
							    .pl_sel_lnk_width(),
							    .pl_ltssm_state(),
							    .pl_received_hot_rst(),
							    .user_lnk_up(pciw_pci0_pcie_ep$user_lnk_up),
							    .tx_buf_av(),
							    .tx_err_drop(),
							    .tx_cfg_req(),
							    .s_axis_tx_tready(pciw_pci0_pcie_ep$s_axis_tx_tready),
							    .m_axis_rx_tdata(pciw_pci0_pcie_ep$m_axis_rx_tdata),
							    .m_axis_rx_tkeep(),
							    .m_axis_rx_tlast(),
							    .m_axis_rx_tvalid(pciw_pci0_pcie_ep$m_axis_rx_tvalid),
							    .m_axis_rx_tuser(pciw_pci0_pcie_ep$m_axis_rx_tuser),
							    .fc_cpld(),
							    .fc_cplh(),
							    .fc_npd(),
							    .fc_nph(),
							    .fc_pd(),
							    .fc_ph(),
							    .cfg_status(),
							    .cfg_command(),
							    .cfg_dstatus(),
							    .cfg_dcommand(),
							    .cfg_lstatus(),
							    .cfg_lcommand(),
							    .cfg_dcommand2(),
							    .cfg_pcie_link_state(),
							    .cfg_pmcsr_pme_en(),
							    .cfg_pmcsr_powerstate(),
							    .cfg_pmcsr_pme_status(),
							    .cfg_received_func_lvl_rst(),
							    .cfg_err_cpl_rdy(),
							    .cfg_err_aer_headerlog_set(),
							    .PIPE_TXOUTCLK_OUT(),
							    .PIPE_RXOUTCLK_OUT(),
							    .PIPE_PCLK_SEL_OUT(),
							    .PIPE_GEN3_OUT(),
							    .user_clk_out(pciw_pci0_pcie_ep$user_clk_out),
							    .user_reset_out(pciw_pci0_pcie_ep$user_reset_out));

  // submodule pciw_pci0_pcie_ep_reset
  ResetInverter pciw_pci0_pcie_ep_reset(.RESET_IN(pci0_rstn),
					.RESET_OUT(pciw_pci0_pcie_ep_reset$RESET_OUT));

  // submodule pciw_pci0_rxF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_rxF(.RST_N(pciw_pci0_axiRst125$OUT_RST_N),
					 .CLK(pciw_pci0_pcie_ep$user_clk_out),
					 .D_IN(pciw_pci0_rxF$D_IN),
					 .ENQ(pciw_pci0_rxF$ENQ),
					 .DEQ(pciw_pci0_rxF$DEQ),
					 .CLR(pciw_pci0_rxF$CLR),
					 .D_OUT(pciw_pci0_rxF$D_OUT),
					 .FULL_N(pciw_pci0_rxF$FULL_N),
					 .EMPTY_N(pciw_pci0_rxF$EMPTY_N));

  // submodule pciw_pci0_txF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_txF(.RST_N(pciw_pci0_axiRst125$OUT_RST_N),
					 .CLK(pciw_pci0_pcie_ep$user_clk_out),
					 .D_IN(pciw_pci0_txF$D_IN),
					 .ENQ(pciw_pci0_txF$ENQ),
					 .DEQ(pciw_pci0_txF$DEQ),
					 .CLR(pciw_pci0_txF$CLR),
					 .D_OUT(pciw_pci0_txF$D_OUT),
					 .FULL_N(pciw_pci0_txF$FULL_N),
					 .EMPTY_N(pciw_pci0_txF$EMPTY_N));

  // submodule pciw_pci0_usr_rst_n
  ResetInverter pciw_pci0_usr_rst_n(.RESET_IN(pciw_pci0_pcie_ep$user_reset_out),
				    .RESET_OUT(pciw_pci0_usr_rst_n$RESET_OUT));

  // submodule sys0_clk
  IBUFDS sys0_clk(.I(sys0_clkp), .IB(sys0_clkn), .O(sys0_clk$O));

  // submodule sys0_rst
  SyncResetA #(.RSTDELAY(32'd15)) sys0_rst(.CLK(sys0_clk$O),
					   .IN_RST_N(sys0_rstn),
					   .OUT_RST_N(sys0_rst$OUT_RST_N));

  // inlined wires
  assign pciw_pci0_axiTxData$wget =
	     { pciw_pci0_txF$D_OUT[31:0],
	       pciw_pci0_txF$D_OUT[63:32],
	       pciw_pci0_txF$D_OUT[95:64],
	       pciw_pci0_txF$D_OUT[127:96] } ;
  assign pciw_pci0_axiTxData$whas =
	     pciw_pci0_txF$EMPTY_N && pciw_pci0_pcie_ep$s_axis_tx_tready ;
  assign pciw_pci0_axiTxKeep$wget =
	     pciw_pci0_txF$D_OUT[151] ?
	       { pciw_pci0_txF$D_OUT[135:128],
		 pciw_pci0_txF$D_OUT[143:136] } :
	       16'd65535 ;
  assign pciw_pci0_axiTxKeep$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxUser$wget = 4'b0 ;
  assign pciw_pci0_axiTxUser$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxLast$wget = pciw_pci0_txF$D_OUT[151] ;
  assign pciw_pci0_axiTxLast$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxValid$wget = 1'd1 ;
  assign pciw_pci0_axiTxValid$whas = pciw_pci0_axiTxData$whas ;
  assign infLed$wget = ctop$led ;
  assign blinkLed$wget = freeCnt[25] ;

  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;

  // register needs_init
  assign needs_init$D_IN = 1'd0 ;
  assign needs_init$EN = needs_init ;

  // register pciDevice
  assign pciDevice$D_IN = pciw_pciDevice ;
  assign pciDevice$EN = 1'd1 ;

  // register pciw_pciDevice
  assign pciw_pciDevice$D_IN =
	     { pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_device_number,
	       pciw_pci0_pcie_ep$cfg_function_number } ;
  assign pciw_pciDevice$EN = 1'd1 ;

  // submodule ctop
  assign ctop$gps_ppsSyncIn_x = 1'b0 ;
  assign ctop$server_request_put = pciw_fP2I$D_OUT ;
  assign ctop$switch_x = 3'h0 ;
  assign ctop$wci_m_0_SData = 32'h0 ;
  assign ctop$wci_m_0_SFlag = 2'h0 ;
  assign ctop$wci_m_0_SResp = 2'h0 ;
  assign ctop$wci_m_1_SData = 32'h0 ;
  assign ctop$wci_m_1_SFlag = 2'h0 ;
  assign ctop$wci_m_1_SResp = 2'h0 ;
  assign ctop$wci_m_2_SData = 32'h0 ;
  assign ctop$wci_m_2_SFlag = 2'h0 ;
  assign ctop$wci_m_2_SResp = 2'h0 ;
  assign ctop$wci_m_3_SData = 32'h0 ;
  assign ctop$wci_m_3_SFlag = 2'h0 ;
  assign ctop$wci_m_3_SResp = 2'h0 ;
  assign ctop$wci_m_4_SData = 32'h0 ;
  assign ctop$wci_m_4_SFlag = 2'h0 ;
  assign ctop$wci_m_4_SResp = 2'h0 ;
  assign ctop$wmemiM0_SData = 128'h0 ;
  assign ctop$wmemiM0_SResp = 2'h0 ;
  assign ctop$wsi_s_adc_MBurstLength = 12'h0 ;
  assign ctop$wsi_s_adc_MByteEn = 4'h0 ;
  assign ctop$wsi_s_adc_MCmd = 3'h0 ;
  assign ctop$wsi_s_adc_MData = 32'h0 ;
  assign ctop$wsi_s_adc_MReqInfo = 8'h0 ;
  assign ctop$EN_server_request_put =
	     ctop$RDY_server_request_put && pciw_fP2I$EMPTY_N ;
  assign ctop$EN_server_response_get =
	     ctop$RDY_server_response_get && pciw_fI2P$FULL_N ;
  assign ctop$wci_m_0_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_1_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_2_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_3_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_4_SThreadBusy = 1'b0 ;
  assign ctop$wsi_s_adc_MReqLast = 1'b0 ;
  assign ctop$wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign ctop$wsi_s_adc_MReset_n = 1'b0 ;
  assign ctop$wsi_m_dac_SThreadBusy = 1'b0 ;
  assign ctop$wsi_m_dac_SReset_n = 1'b0 ;
  assign ctop$wmemiM0_SRespLast = 1'b0 ;
  assign ctop$wmemiM0_SCmdAccept = 1'b0 ;
  assign ctop$wmemiM0_SDataAccept = 1'b0 ;

  // submodule lcd_ctrl
  assign lcd_ctrl$setLine1_text = 128'h3133762073656C75522063696D6F7441 ;
  assign lcd_ctrl$setLine2_text = 128'h20353037636B203A204950436E65704F ;
  assign lcd_ctrl$EN_setLine1 = needs_init ;
  assign lcd_ctrl$EN_setLine2 = needs_init ;

  // submodule pciw_fI2P
  assign pciw_fI2P$D_IN = ctop$server_response_get ;
  assign pciw_fI2P$ENQ = ctop$RDY_server_response_get && pciw_fI2P$FULL_N ;
  assign pciw_fI2P$DEQ = pciw_fI2P$EMPTY_N && pciw_pci0_txF$FULL_N ;
  assign pciw_fI2P$CLR = 1'b0 ;

  // submodule pciw_fP2I
  assign pciw_fP2I$D_IN = pciw_pci0_rxF$D_OUT ;
  assign pciw_fP2I$ENQ = pciw_pci0_rxF$EMPTY_N && pciw_fP2I$FULL_N ;
  assign pciw_fP2I$DEQ = ctop$RDY_server_request_put && pciw_fP2I$EMPTY_N ;
  assign pciw_fP2I$CLR = 1'b0 ;

  // submodule pciw_pci0_pcie_ep
  assign pciw_pci0_pcie_ep$PIPE_DCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_OOBCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_PCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN = 4'h0 ;
  assign pciw_pci0_pcie_ep$PIPE_USERCLK1_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_USERCLK2_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_dsn = 64'h0 ;
  assign pciw_pci0_pcie_ep$cfg_err_acs = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_aer_headerlog = 128'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_abort = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_timeout = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_unexpect = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_ecrc = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_internal_cor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_internal_uncor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_locked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_malformed = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_mc_blocked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_norecovery = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_poisoned = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_posted = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header = 48'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_ur = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_assert = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_di = 8'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_stat = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_byte_en = 4'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_di = 32'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_dwaddr = 10'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_rd_en = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_wr_en = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum = 5'd0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_force_state = 2'h0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_force_state_en = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1 = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_wake = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_trn_pending = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_turnoff_ok = 1'b0 ;
  assign pciw_pci0_pcie_ep$fc_sel = 3'd0 ;
  assign pciw_pci0_pcie_ep$m_axis_rx_tready = pciw_pci0_rxF$FULL_N ;
  assign pciw_pci0_pcie_ep$pci_exp_rxn = pcie_rxn_i ;
  assign pciw_pci0_pcie_ep$pci_exp_rxp = pcie_rxp_i ;
  assign pciw_pci0_pcie_ep$pl_directed_link_auton = 1'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_change = 2'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_speed = 1'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_width = 2'd0 ;
  assign pciw_pci0_pcie_ep$pl_upstream_prefer_deemph = 1'b1 ;
  assign pciw_pci0_pcie_ep$rx_np_ok = 1'd1 ;
  assign pciw_pci0_pcie_ep$rx_np_req = 1'd1 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tdata =
	     pciw_pci0_axiTxData$whas ? pciw_pci0_axiTxData$wget : 128'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tkeep =
	     pciw_pci0_axiTxData$whas ? pciw_pci0_axiTxKeep$wget : 16'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tlast =
	     pciw_pci0_axiTxData$whas && pciw_pci0_txF$D_OUT[151] ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tuser = 4'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tvalid = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_pcie_ep$tx_cfg_gnt = 1'd1 ;

  // submodule pciw_pci0_rxF
  assign pciw_pci0_rxF$D_IN =
	     { pciw_pci0_pcie_ep$m_axis_rx_tuser[14],
	       pciw_pci0_pcie_ep$m_axis_rx_tuser[21],
	       pciw_pci0_pcie_ep$m_axis_rx_tuser[8:2],
	       x_be__h1483,
	       x_data__h1484 } ;
  assign pciw_pci0_rxF$ENQ =
	     pciw_pci0_rxF$FULL_N && pciw_pci0_pcie_ep$m_axis_rx_tvalid ;
  assign pciw_pci0_rxF$DEQ = pciw_pci0_rxF$EMPTY_N && pciw_fP2I$FULL_N ;
  assign pciw_pci0_rxF$CLR = 1'b0 ;

  // submodule pciw_pci0_txF
  assign pciw_pci0_txF$D_IN = pciw_fI2P$D_OUT ;
  assign pciw_pci0_txF$ENQ = pciw_fI2P$EMPTY_N && pciw_pci0_txF$FULL_N ;
  assign pciw_pci0_txF$DEQ = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_txF$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d95 =
	     pciw_pci0_pcie_ep$m_axis_rx_tuser[21] ?
	       CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 :
	       16'd65535 ;
  assign x_be__h1483 =
	     { IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d95[7:0],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d95[15:8] } ;
  assign x_data__h1484 =
	     { pciw_pci0_pcie_ep$m_axis_rx_tdata[31:0],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[63:32],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[95:64],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[127:96] } ;
  always@(pciw_pci0_pcie_ep$m_axis_rx_tuser)
  begin
    case (pciw_pci0_pcie_ep$m_axis_rx_tuser[20:19])
      2'd0: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h000F;
      2'd1: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h00FF;
      2'd2: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h0FFF;
      2'd3: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'hFFFF;
    endcase
  end

  // handling of inlined registers

  always@(posedge sys0_clk$O)
  begin
    if (!sys0_rst$OUT_RST_N)
      begin
        needs_init <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (needs_init$EN)
	  needs_init <= `BSV_ASSIGNMENT_DELAY needs_init$D_IN;
      end
  end

  always@(posedge pciw_pci0_pcie_ep$user_clk_out)
  begin
    if (!pciw_p125rst$OUT_RST_N)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (pciDevice$EN) pciDevice <= `BSV_ASSIGNMENT_DELAY pciDevice$D_IN;
	if (pciw_pciDevice$EN)
	  pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY pciw_pciDevice$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    needs_init = 1'h0;
    pciDevice = 16'hAAAA;
    pciw_pciDevice = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkFTop_kc705

