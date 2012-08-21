// Generated by altmemphy 11.0 [Altera, IP Toolbench 1.3.0 Build 208]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2011 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

module ddr3_s4_amphy_phy (
	pll_ref_clk,
	global_reset_n,
	soft_reset_n,
	ctl_dqs_burst,
	ctl_wdata_valid,
	ctl_wdata,
	ctl_dm,
	ctl_addr,
	ctl_ba,
	ctl_cas_n,
	ctl_cke,
	ctl_cs_n,
	ctl_odt,
	ctl_ras_n,
	ctl_we_n,
	ctl_rst_n,
	ctl_doing_rd,
	ctl_cal_req,
	ctl_mem_clk_disable,
	mem_err_out_n,
	ctl_cal_byte_lane_sel_n,
	oct_ctl_rs_value,
	oct_ctl_rt_value,
	dqs_offset_delay_ctrl,
	dqs_delay_ctrl_import,
	dbg_clk,
	dbg_reset_n,
	dbg_addr,
	dbg_wr,
	dbg_rd,
	dbg_cs,
	dbg_wr_data,
	pll_reconfig_enable,
	pll_phasecounterselect,
	pll_phaseupdown,
	pll_phasestep,
	hc_scan_enable_access,
	hc_scan_enable_dq,
	hc_scan_enable_dm,
	hc_scan_enable_dqs,
	hc_scan_enable_dqs_config,
	hc_scan_din,
	hc_scan_update,
	hc_scan_ck,
	reset_request_n,
	ctl_clk,
	ctl_reset_n,
	ctl_wlat,
	ctl_rdata,
	ctl_rdata_valid,
	ctl_rlat,
	ctl_cal_success,
	ctl_cal_fail,
	ctl_cal_warning,
	mem_ac_parity,
	parity_error_n,
	mem_addr,
	mem_ba,
	mem_cas_n,
	mem_cke,
	mem_cs_n,
	mem_dm,
	mem_odt,
	mem_ras_n,
	mem_we_n,
	mem_reset_n,
	dqs_delay_ctrl_export,
	dll_reference_clk,
	aux_half_rate_clk,
	aux_full_rate_clk,
	aux_scan_clk,
	aux_scan_clk_reset_n,
	dbg_rd_data,
	dbg_waitrequest,
	pll_phase_done,
	hc_scan_dout,
	mem_clk,
	mem_clk_n,
	mem_dq,
	mem_dqs,
	mem_dqs_n);

	input		pll_ref_clk;
	input		global_reset_n;
	input		soft_reset_n;
	input	[1:0]	ctl_dqs_burst;
	input	[1:0]	ctl_wdata_valid;
	input	[31:0]	ctl_wdata;
	input	[3:0]	ctl_dm;
	input	[25:0]	ctl_addr;
	input	[5:0]	ctl_ba;
	input	[1:0]	ctl_cas_n;
	input	[1:0]	ctl_cke;
	input	[1:0]	ctl_cs_n;
	input	[1:0]	ctl_odt;
	input	[1:0]	ctl_ras_n;
	input	[1:0]	ctl_we_n;
	input	[1:0]	ctl_rst_n;
	input	[1:0]	ctl_doing_rd;
	input		ctl_cal_req;
	input	[0:0]	ctl_mem_clk_disable;
	input		mem_err_out_n;
	input	[0:0]	ctl_cal_byte_lane_sel_n;
	input	[13:0]	oct_ctl_rs_value;
	input	[13:0]	oct_ctl_rt_value;
	input	[5:0]	dqs_offset_delay_ctrl;
	input	[5:0]	dqs_delay_ctrl_import;
	input		dbg_clk;
	input		dbg_reset_n;
	input	[12:0]	dbg_addr;
	input		dbg_wr;
	input		dbg_rd;
	input		dbg_cs;
	input	[31:0]	dbg_wr_data;
	input		pll_reconfig_enable;
	input	[3:0]	pll_phasecounterselect;
	input		pll_phaseupdown;
	input		pll_phasestep;
	input		hc_scan_enable_access;
	input	[7:0]	hc_scan_enable_dq;
	input	[0:0]	hc_scan_enable_dm;
	input	[0:0]	hc_scan_enable_dqs;
	input	[0:0]	hc_scan_enable_dqs_config;
	input	[0:0]	hc_scan_din;
	input	[0:0]	hc_scan_update;
	input		hc_scan_ck;
	output		reset_request_n;
	output		ctl_clk;
	output		ctl_reset_n;
	output	[4:0]	ctl_wlat;
	output	[31:0]	ctl_rdata;
	output	[1:0]	ctl_rdata_valid;
	output	[4:0]	ctl_rlat;
	output		ctl_cal_success;
	output		ctl_cal_fail;
	output		ctl_cal_warning;
	output		mem_ac_parity;
	output		parity_error_n;
	output	[12:0]	mem_addr;
	output	[2:0]	mem_ba;
	output		mem_cas_n;
	output	[0:0]	mem_cke;
	output	[0:0]	mem_cs_n;
	output	[0:0]	mem_dm;
	output	[0:0]	mem_odt;
	output		mem_ras_n;
	output		mem_we_n;
	output		mem_reset_n;
	output	[5:0]	dqs_delay_ctrl_export;
	output		dll_reference_clk;
	output		aux_half_rate_clk;
	output		aux_full_rate_clk;
	output		aux_scan_clk;
	output		aux_scan_clk_reset_n;
	output	[31:0]	dbg_rd_data;
	output		dbg_waitrequest;
	output		pll_phase_done;
	output	[7:0]	hc_scan_dout;
	inout	[0:0]	mem_clk;
	inout	[0:0]	mem_clk_n;
	inout	[7:0]	mem_dq;
	inout	[0:0]	mem_dqs;
	inout	[0:0]	mem_dqs_n;
endmodule
