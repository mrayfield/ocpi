//*****************************************************************************
// (c) Copyright 2008-2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor                : Xilinx
// \   \   \/     Version               : 3.7
//  \   \         Application           : MIG
//  /   /         Filename              : bank_mach.v
// /___/   /\     Date Last Modified    : $date$
// \   \  /  \    Date Created          : Tue Jun 30 2009
//  \___\/\___\
//
//Device            : Virtex-6
//Design Name       : DDR3 SDRAM
//Purpose           :
//Reference         :
//Revision History  :
//*****************************************************************************

// Top level bank machine block.  A structural block instantiating the configured
// individual bank machines, and a common block that computes various items shared
// by all bank machines.

`timescale 1ns/1ps

module bank_mach #
  (
   parameter TCQ = 100,
   parameter ADDR_CMD_MODE            = "UNBUF",
   parameter BANK_WIDTH               = 3,
   parameter BM_CNT_WIDTH             = 2,
   parameter BURST_MODE               = "8",
   parameter COL_WIDTH                = 12,
   parameter CS_WIDTH                 = 4,
   parameter CWL                      = 5,
   parameter DATA_BUF_ADDR_WIDTH      = 8,
   parameter DRAM_TYPE                = "DDR3",
   parameter EARLY_WR_DATA_ADDR       = "OFF",
   parameter ECC                      = "OFF",
   parameter LOW_IDLE_CNT             = 1,
   parameter nBANK_MACHS              = 4,
   parameter nCK_PER_CLK              = 2,
   parameter nCNFG2RD_EN              = 2,
   parameter nCNFG2WR                 = 2,
   parameter nCS_PER_RANK             = 1,
   parameter nOP_WAIT                 = 0,
   parameter nRAS                     = 20,
   parameter nRCD                     = 5,
   parameter nRFC                     = 44,
   parameter nRTP                     = 4,
   parameter nRP                      = 10,
   parameter nSLOTS                   = 2,
   parameter nWR                      = 6,
   parameter ORDERING                 = "NORM",
   parameter RANK_BM_BV_WIDTH         = 16,
   parameter RANK_WIDTH               = 2,
   parameter RANKS                    = 4,
   parameter ROW_WIDTH                = 16,
   parameter RTT_NOM                  = "40",
   parameter RTT_WR                   = "120",
   parameter STARVE_LIMIT             = 2,
   parameter SLOT_0_CONFIG            = 8'b0000_0101,
   parameter SLOT_1_CONFIG            = 8'b0000_1010,
   parameter tZQCS                    = 64
  )
  (/*AUTOARG*/
  // Outputs
  maint_wip_r, insert_maint_r1, dfi_we_n1, dfi_we_n0, dfi_ras_n1,
  dfi_ras_n0, dfi_odt_wr1, dfi_odt_wr0, dfi_odt_nom1, dfi_odt_nom0,
  dfi_cs_n1, dfi_cs_n0, dfi_cas_n1, dfi_cas_n0, dfi_bank1, dfi_bank0,
  dfi_address1, dfi_address0, col_wr_data_buf_addr, col_size, col_row,
  col_rmw, col_ra, col_periodic_rd, col_data_buf_addr, col_ba, col_a,
  bank_mach_next, accept_ns, accept, io_config, io_config_strobe,
  sending_row, sending_col, sent_col, periodic_rd_ack_r,
  act_this_rank_r, wr_this_rank_r, rd_this_rank_r, rank_busy_r,
  // Inputs
  wtr_inhbt_config_r, use_addr, slot_1_present, slot_0_present, size,
  rst, row, rd_rmw, rd_data_addr, rank, periodic_rd_rank_r,
  periodic_rd_r, maint_zq_r, maint_req_r, maint_rank_r,
  inhbt_wr_config, inhbt_rd_r, inhbt_rd_config, inhbt_act_faw_r,
  hi_priority, dq_busy_data, dfi_rddata_valid, dfi_init_complete,
  data_buf_addr, col, cmd, clk, bank
  );

  function integer clogb2 (input integer size); // ceiling logb2
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
            size = size >> 1;
    end
  endfunction // clogb2

  localparam RANK_VECT_INDX = (nBANK_MACHS *RANK_WIDTH) - 1;
  localparam BANK_VECT_INDX = (nBANK_MACHS * BANK_WIDTH) - 1;
  localparam ROW_VECT_INDX = (nBANK_MACHS * ROW_WIDTH) - 1;
  localparam DATA_BUF_ADDR_VECT_INDX = (nBANK_MACHS * DATA_BUF_ADDR_WIDTH) - 1;
  localparam nRAS_CLKS = (nCK_PER_CLK == 1)  ? nRAS  : ((nRAS/2) + (nRAS % 2));
  localparam nWTP = CWL + ((BURST_MODE == "4") ? 2 : 4) + nWR;
// Unless 2T mode, add one to nWTP_CLKS.  This accounts for loss of one DRAM CK
// due to column command to row command fixed offset.
  localparam nWTP_CLKS = (nCK_PER_CLK == 1)
                            ? nWTP
                            : (nWTP/2) + ((ADDR_CMD_MODE == "2T") ? nWTP%2 : 1);
  localparam RAS_TIMER_WIDTH = clogb2(((nRAS_CLKS > nWTP_CLKS)
                                           ? nRAS_CLKS
                                           : nWTP_CLKS) - 1);

  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input [BANK_WIDTH-1:0] bank;                  // To bank0 of bank_cntrl.v
  input                 clk;                    // To bank0 of bank_cntrl.v, ...
  input [2:0]           cmd;                    // To bank0 of bank_cntrl.v, ...
  input [COL_WIDTH-1:0] col;                    // To bank0 of bank_cntrl.v
  input [DATA_BUF_ADDR_WIDTH-1:0] data_buf_addr;// To bank0 of bank_cntrl.v
  input                 dfi_init_complete;      // To bank_common0 of bank_common.v
  input                 dfi_rddata_valid;       // To bank0 of bank_cntrl.v
  input                 dq_busy_data;           // To bank0 of bank_cntrl.v
  input                 hi_priority;            // To bank0 of bank_cntrl.v, ...
  input [RANKS-1:0]     inhbt_act_faw_r;        // To bank0 of bank_cntrl.v
  input                 inhbt_rd_config;        // To bank0 of bank_cntrl.v
  input [RANKS-1:0]     inhbt_rd_r;             // To bank0 of bank_cntrl.v
  input                 inhbt_wr_config;        // To bank0 of bank_cntrl.v
  input [RANK_WIDTH-1:0] maint_rank_r;          // To bank0 of bank_cntrl.v, ...
  input                 maint_req_r;            // To bank0 of bank_cntrl.v, ...
  input                 maint_zq_r;             // To bank0 of bank_cntrl.v, ...
  input                 periodic_rd_r;          // To bank_common0 of bank_common.v
  input [RANK_WIDTH-1:0] periodic_rd_rank_r;    // To bank0 of bank_cntrl.v
  input [RANK_WIDTH-1:0] rank;                  // To bank0 of bank_cntrl.v
  input [DATA_BUF_ADDR_WIDTH-1:0] rd_data_addr; // To bank0 of bank_cntrl.v
  input                 rd_rmw;                 // To bank0 of bank_cntrl.v
  input [ROW_WIDTH-1:0] row;                    // To bank0 of bank_cntrl.v
  input                 rst;                    // To bank0 of bank_cntrl.v, ...
  input                 size;                   // To bank0 of bank_cntrl.v
  input [7:0]           slot_0_present;         // To bank_common0 of bank_common.v, ...
  input [7:0]           slot_1_present;         // To bank_common0 of bank_common.v, ...
  input                 use_addr;               // To bank0 of bank_cntrl.v, ...
  input [RANKS-1:0]     wtr_inhbt_config_r;     // To bank0 of bank_cntrl.v
  // End of automatics

  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output                accept;                 // From bank_common0 of bank_common.v
  output                accept_ns;              // From bank_common0 of bank_common.v
  output [BM_CNT_WIDTH-1:0] bank_mach_next;     // From bank_common0 of bank_common.v
  output [ROW_WIDTH-1:0] col_a;                 // From arb_mux0 of arb_mux.v
  output [BANK_WIDTH-1:0] col_ba;               // From arb_mux0 of arb_mux.v
  output [DATA_BUF_ADDR_WIDTH-1:0] col_data_buf_addr;// From arb_mux0 of arb_mux.v
  output                col_periodic_rd;        // From arb_mux0 of arb_mux.v
  output [RANK_WIDTH-1:0] col_ra;               // From arb_mux0 of arb_mux.v
  output                col_rmw;                // From arb_mux0 of arb_mux.v
  output [ROW_WIDTH-1:0] col_row;               // From arb_mux0 of arb_mux.v
  output                col_size;               // From arb_mux0 of arb_mux.v
  output [DATA_BUF_ADDR_WIDTH-1:0] col_wr_data_buf_addr;// From arb_mux0 of arb_mux.v
  output [ROW_WIDTH-1:0] dfi_address0;          // From arb_mux0 of arb_mux.v
  output [ROW_WIDTH-1:0] dfi_address1;          // From arb_mux0 of arb_mux.v
  output [BANK_WIDTH-1:0] dfi_bank0;            // From arb_mux0 of arb_mux.v
  output [BANK_WIDTH-1:0] dfi_bank1;            // From arb_mux0 of arb_mux.v
  output                dfi_cas_n0;             // From arb_mux0 of arb_mux.v
  output                dfi_cas_n1;             // From arb_mux0 of arb_mux.v
  output [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n0;// From arb_mux0 of arb_mux.v
  output [(CS_WIDTH*nCS_PER_RANK)-1:0] dfi_cs_n1;// From arb_mux0 of arb_mux.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_nom0;// From arb_mux0 of arb_mux.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_nom1;// From arb_mux0 of arb_mux.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_wr0;// From arb_mux0 of arb_mux.v
  output [(nSLOTS*nCS_PER_RANK)-1:0] dfi_odt_wr1;// From arb_mux0 of arb_mux.v
  output                dfi_ras_n0;             // From arb_mux0 of arb_mux.v
  output                dfi_ras_n1;             // From arb_mux0 of arb_mux.v
  output                dfi_we_n0;              // From arb_mux0 of arb_mux.v
  output                dfi_we_n1;              // From arb_mux0 of arb_mux.v
  output                insert_maint_r1;        // From arb_mux0 of arb_mux.v
  output                maint_wip_r;            // From bank_common0 of bank_common.v
  // End of automatics

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire                  accept_internal_r;      // From bank_common0 of bank_common.v
  wire                  accept_req;             // From bank_common0 of bank_common.v
  wire                  adv_order_q;            // From bank_common0 of bank_common.v
  wire                  force_io_config_rd_r;   // From bank_common0 of bank_common.v
  wire [BM_CNT_WIDTH-1:0] idle_cnt;             // From bank_common0 of bank_common.v
  wire                  insert_maint_r;         // From bank_common0 of bank_common.v
  wire                  io_config_valid_r;      // From arb_mux0 of arb_mux.v
  wire                  low_idle_cnt_r;         // From bank_common0 of bank_common.v
  wire                  maint_idle;             // From bank_common0 of bank_common.v
  wire [BM_CNT_WIDTH-1:0] order_cnt;            // From bank_common0 of bank_common.v
  wire                  periodic_rd_insert;     // From bank_common0 of bank_common.v
  wire [BM_CNT_WIDTH-1:0] rb_hit_busy_cnt;      // From bank_common0 of bank_common.v
  wire                  sent_row;               // From arb_mux0 of arb_mux.v
  wire                  was_priority;           // From bank_common0 of bank_common.v
  wire                  was_wr;                 // From bank_common0 of bank_common.v
  // End of automatics

  output [RANK_WIDTH:0] io_config;
  output io_config_strobe;

  wire [nBANK_MACHS-1:0] rts_row;
  wire [nBANK_MACHS-1:0] rts_col;
  wire [nBANK_MACHS-1:0] col_rdy_wr;
  wire [nBANK_MACHS-1:0] rtc;
  output wire [nBANK_MACHS-1:0] sending_row;
  output wire [nBANK_MACHS-1:0] sending_col;
  output wire sent_col;

  output periodic_rd_ack_r;

  wire [DATA_BUF_ADDR_VECT_INDX:0] req_data_buf_addr_r;
  wire [nBANK_MACHS-1:0] req_size_r;
  wire [RANK_VECT_INDX:0] req_rank_r;
  wire [BANK_VECT_INDX:0] req_bank_r;
  wire [ROW_VECT_INDX:0] req_row_r;
  wire [ROW_VECT_INDX:0] col_addr;
  wire [nBANK_MACHS-1:0] req_periodic_rd_r;
  wire [nBANK_MACHS-1:0] req_wr_r;
  wire [nBANK_MACHS-1:0] rd_wr_r;
  wire [nBANK_MACHS-1:0] req_ras;
  wire [nBANK_MACHS-1:0] req_cas;
  wire [ROW_VECT_INDX:0] row_addr;
  wire [nBANK_MACHS-1:0] row_cmd_wr;
  wire [nBANK_MACHS-1:0] demand_priority;
  wire [nBANK_MACHS-1:0] demand_act_priority;

  output wire [RANK_BM_BV_WIDTH-1:0] act_this_rank_r;
  output wire [RANK_BM_BV_WIDTH-1:0] wr_this_rank_r;
  output wire [RANK_BM_BV_WIDTH-1:0] rd_this_rank_r;

  wire [nBANK_MACHS-1:0] idle_ns;
  wire [nBANK_MACHS-1:0] rb_hit_busy_r;
  wire [nBANK_MACHS-1:0] bm_end;
  wire [nBANK_MACHS-1:0] passing_open_bank;
  wire [nBANK_MACHS-1:0] ordered_r;
  wire [nBANK_MACHS-1:0] ordered_issued;
  wire [nBANK_MACHS-1:0] rb_hit_busy_ns;
  wire [nBANK_MACHS-1:0] maint_hit;
  wire [nBANK_MACHS-1:0] idle_r;
  wire [nBANK_MACHS-1:0] head_r;
  wire [nBANK_MACHS-1:0] start_rcd;

  wire [nBANK_MACHS-1:0] end_rtp;
  wire [nBANK_MACHS-1:0] op_exit_req;
  wire [nBANK_MACHS-1:0] op_exit_grant;
  wire [nBANK_MACHS-1:0] start_pre_wait;

  wire [(RAS_TIMER_WIDTH*nBANK_MACHS)-1:0] ras_timer_ns;

  output wire [(RANKS*nBANK_MACHS)-1:0] rank_busy_r;

  genvar ID;
  generate for (ID=0; ID<nBANK_MACHS; ID=ID+1) begin:bank_cntrl
    bank_cntrl #
      (/*AUTOINSTPARAM*/
       // Parameters
       .TCQ                             (TCQ),
       .ADDR_CMD_MODE                   (ADDR_CMD_MODE),
       .BANK_WIDTH                      (BANK_WIDTH),
       .BM_CNT_WIDTH                    (BM_CNT_WIDTH),
       .BURST_MODE                      (BURST_MODE),
       .COL_WIDTH                       (COL_WIDTH),
       .CWL                             (CWL),
       .DATA_BUF_ADDR_WIDTH             (DATA_BUF_ADDR_WIDTH),
       .DRAM_TYPE                       (DRAM_TYPE),
       .ECC                             (ECC),
       .ID                              (ID),
       .nBANK_MACHS                     (nBANK_MACHS),
       .nCK_PER_CLK                     (nCK_PER_CLK),
       .nCNFG2RD_EN                     (nCNFG2RD_EN),
       .nCNFG2WR                        (nCNFG2WR),
       .nOP_WAIT                        (nOP_WAIT),
       .nRAS_CLKS                       (nRAS_CLKS),
       .nRCD                            (nRCD),
       .nRTP                            (nRTP),
       .nRP                             (nRP),
       .nWTP_CLKS                       (nWTP_CLKS),
       .ORDERING                        (ORDERING),
       .RANK_WIDTH                      (RANK_WIDTH),
       .RANKS                           (RANKS),
       .RAS_TIMER_WIDTH                 (RAS_TIMER_WIDTH),
       .ROW_WIDTH                       (ROW_WIDTH),
       .STARVE_LIMIT                    (STARVE_LIMIT))
      bank0
        (.demand_priority                 (demand_priority[ID]),
         .demand_priority_in              ({2{demand_priority}}),
         .demand_act_priority             (demand_act_priority[ID]),
         .demand_act_priority_in          ({2{demand_act_priority}}),
         .rts_row                         (rts_row[ID]),
         .rts_col                         (rts_col[ID]),
         .col_rdy_wr                      (col_rdy_wr[ID]),
         .rtc                             (rtc[ID]),
         .sending_row                     (sending_row[ID]),
         .sending_col                     (sending_col[ID]),
         .req_data_buf_addr_r             (req_data_buf_addr_r[(ID*DATA_BUF_ADDR_WIDTH)+:DATA_BUF_ADDR_WIDTH]),
         .req_size_r                      (req_size_r[ID]),
         .req_rank_r                      (req_rank_r[(ID*RANK_WIDTH)+:RANK_WIDTH]),
         .req_bank_r                      (req_bank_r[(ID*BANK_WIDTH)+:BANK_WIDTH]),
         .req_row_r                       (req_row_r[(ID*ROW_WIDTH)+:ROW_WIDTH]),
         .col_addr                        (col_addr[(ID*ROW_WIDTH)+:ROW_WIDTH]),
         .req_wr_r                        (req_wr_r[ID]),
         .rd_wr_r                         (rd_wr_r[ID]),
         .req_periodic_rd_r               (req_periodic_rd_r[ID]),
         .req_ras                         (req_ras[ID]),
         .req_cas                         (req_cas[ID]),
         .row_addr                        (row_addr[(ID*ROW_WIDTH)+:ROW_WIDTH]),
         .row_cmd_wr                      (row_cmd_wr[ID]),
         .act_this_rank_r                 (act_this_rank_r[(ID*RANKS)+:RANKS]),
         .wr_this_rank_r                  (wr_this_rank_r[(ID*RANKS)+:RANKS]),
         .rd_this_rank_r                  (rd_this_rank_r[(ID*RANKS)+:RANKS]),
         .idle_ns                         (idle_ns[ID]),
         .rb_hit_busy_r                   (rb_hit_busy_r[ID]),
         .bm_end                          (bm_end[ID]),
         .bm_end_in                       ({2{bm_end}}),
         .passing_open_bank               (passing_open_bank[ID]),
         .passing_open_bank_in            ({2{passing_open_bank}}),
         .ordered_r                       (ordered_r[ID]),
         .ordered_issued                  (ordered_issued[ID]),
         .rb_hit_busy_ns                  (rb_hit_busy_ns[ID]),
         .rb_hit_busy_ns_in               ({2{rb_hit_busy_ns}}),
         .maint_hit                       (maint_hit[ID]),
         .req_rank_r_in                   ({2{req_rank_r}}),
         .idle_r                          (idle_r[ID]),
         .head_r                          (head_r[ID]),
         .start_rcd                       (start_rcd[ID]),
         .start_rcd_in                    ({2{start_rcd}}),
         .end_rtp                         (end_rtp[ID]),
         .op_exit_req                     (op_exit_req[ID]),
         .op_exit_grant                   (op_exit_grant[ID]),
         .start_pre_wait                  (start_pre_wait[ID]),
         .ras_timer_ns                    (ras_timer_ns[(ID*RAS_TIMER_WIDTH)+:RAS_TIMER_WIDTH]),
         .ras_timer_ns_in                 ({2{ras_timer_ns}}),
         .rank_busy_r                     (rank_busy_r[ID*RANKS+:RANKS]),
         /*AUTOINST*/
         // Inputs
         .accept_internal_r             (accept_internal_r),
         .accept_req                    (accept_req),
         .adv_order_q                   (adv_order_q),
         .bank                          (bank[BANK_WIDTH-1:0]),
         .clk                           (clk),
         .cmd                           (cmd[2:0]),
         .col                           (col[COL_WIDTH-1:0]),
         .data_buf_addr                 (data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
         .dfi_rddata_valid              (dfi_rddata_valid),
         .dq_busy_data                  (dq_busy_data),
         .hi_priority                   (hi_priority),
         .idle_cnt                      (idle_cnt[BM_CNT_WIDTH-1:0]),
         .inhbt_act_faw_r               (inhbt_act_faw_r[RANKS-1:0]),
         .inhbt_rd_config               (inhbt_rd_config),
         .inhbt_rd_r                    (inhbt_rd_r[RANKS-1:0]),
         .inhbt_wr_config               (inhbt_wr_config),
         .io_config                     (io_config[RANK_WIDTH:0]),
         .io_config_strobe              (io_config_strobe),
         .io_config_valid_r             (io_config_valid_r),
         .low_idle_cnt_r                (low_idle_cnt_r),
         .maint_idle                    (maint_idle),
         .maint_rank_r                  (maint_rank_r[RANK_WIDTH-1:0]),
         .maint_req_r                   (maint_req_r),
         .maint_zq_r                    (maint_zq_r),
         .order_cnt                     (order_cnt[BM_CNT_WIDTH-1:0]),
         .periodic_rd_ack_r             (periodic_rd_ack_r),
         .periodic_rd_insert            (periodic_rd_insert),
         .periodic_rd_rank_r            (periodic_rd_rank_r[RANK_WIDTH-1:0]),
         .rank                          (rank[RANK_WIDTH-1:0]),
         .rb_hit_busy_cnt               (rb_hit_busy_cnt[BM_CNT_WIDTH-1:0]),
         .rd_data_addr                  (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
         .rd_rmw                        (rd_rmw),
         .row                           (row[ROW_WIDTH-1:0]),
         .rst                           (rst),
         .sent_col                      (sent_col),
         .sent_row                      (sent_row),
         .size                          (size),
         .use_addr                      (use_addr),
         .was_priority                  (was_priority),
         .was_wr                        (was_wr),
         .wtr_inhbt_config_r            (wtr_inhbt_config_r[RANKS-1:0]));
    end
  endgenerate

  bank_common #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .BM_CNT_WIDTH                      (BM_CNT_WIDTH),
     .LOW_IDLE_CNT                      (LOW_IDLE_CNT),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nOP_WAIT                          (nOP_WAIT),
     .nRFC                              (nRFC),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .CWL                               (CWL), //Added to fix CR #528228
     .tZQCS                             (tZQCS))
    bank_common0
      (.op_exit_grant                     (op_exit_grant[nBANK_MACHS-1:0]),
       /*AUTOINST*/
       // Outputs
       .accept_internal_r               (accept_internal_r),
       .accept_ns                       (accept_ns),
       .accept                          (accept),
       .periodic_rd_insert              (periodic_rd_insert),
       .periodic_rd_ack_r               (periodic_rd_ack_r),
       .accept_req                      (accept_req),
       .rb_hit_busy_cnt                 (rb_hit_busy_cnt[BM_CNT_WIDTH-1:0]),
       .idle_cnt                        (idle_cnt[BM_CNT_WIDTH-1:0]),
       .order_cnt                       (order_cnt[BM_CNT_WIDTH-1:0]),
       .adv_order_q                     (adv_order_q),
       .bank_mach_next                  (bank_mach_next[BM_CNT_WIDTH-1:0]),
       .low_idle_cnt_r                  (low_idle_cnt_r),
       .was_wr                          (was_wr),
       .was_priority                    (was_priority),
       .maint_wip_r                     (maint_wip_r),
       .maint_idle                      (maint_idle),
       .force_io_config_rd_r            (force_io_config_rd_r),
       .insert_maint_r                  (insert_maint_r),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .idle_ns                         (idle_ns[nBANK_MACHS-1:0]),
       .dfi_init_complete               (dfi_init_complete),
       .periodic_rd_r                   (periodic_rd_r),
       .use_addr                        (use_addr),
       .rb_hit_busy_r                   (rb_hit_busy_r[nBANK_MACHS-1:0]),
       .idle_r                          (idle_r[nBANK_MACHS-1:0]),
       .ordered_r                       (ordered_r[nBANK_MACHS-1:0]),
       .ordered_issued                  (ordered_issued[nBANK_MACHS-1:0]),
       .head_r                          (head_r[nBANK_MACHS-1:0]),
       .end_rtp                         (end_rtp[nBANK_MACHS-1:0]),
       .passing_open_bank               (passing_open_bank[nBANK_MACHS-1:0]),
       .op_exit_req                     (op_exit_req[nBANK_MACHS-1:0]),
       .start_pre_wait                  (start_pre_wait[nBANK_MACHS-1:0]),
       .cmd                             (cmd[2:0]),
       .hi_priority                     (hi_priority),
       .maint_req_r                     (maint_req_r),
       .maint_zq_r                      (maint_zq_r),
       .maint_hit                       (maint_hit[nBANK_MACHS-1:0]),
       .bm_end                          (bm_end[nBANK_MACHS-1:0]),
       .io_config_valid_r               (io_config_valid_r),
       .io_config                       (io_config[RANK_WIDTH:0]),
       .slot_0_present                  (slot_0_present[7:0]),
       .slot_1_present                  (slot_1_present[7:0]));


   arb_mux #
     (/*AUTOINSTPARAM*/
      // Parameters
      .TCQ                              (TCQ),
      .ADDR_CMD_MODE                    (ADDR_CMD_MODE),
      .BANK_VECT_INDX                   (BANK_VECT_INDX),
      .BANK_WIDTH                       (BANK_WIDTH),
      .BURST_MODE                       (BURST_MODE),
      .CS_WIDTH                         (CS_WIDTH),
      .DATA_BUF_ADDR_VECT_INDX          (DATA_BUF_ADDR_VECT_INDX),
      .DATA_BUF_ADDR_WIDTH              (DATA_BUF_ADDR_WIDTH),
      .DRAM_TYPE                        (DRAM_TYPE),
      .EARLY_WR_DATA_ADDR               (EARLY_WR_DATA_ADDR),
      .ECC                              (ECC),
      .nBANK_MACHS                      (nBANK_MACHS),
      .nCK_PER_CLK                      (nCK_PER_CLK),
      .nCS_PER_RANK                     (nCS_PER_RANK),
      .nCNFG2WR                         (nCNFG2WR),
      .nSLOTS                           (nSLOTS),
      .RANK_VECT_INDX                   (RANK_VECT_INDX),
      .RANK_WIDTH                       (RANK_WIDTH),
      .ROW_VECT_INDX                    (ROW_VECT_INDX),
      .ROW_WIDTH                        (ROW_WIDTH),
      .RTT_NOM                          (RTT_NOM),
      .RTT_WR                           (RTT_WR),
      .SLOT_0_CONFIG                    (SLOT_0_CONFIG),
      .SLOT_1_CONFIG                    (SLOT_1_CONFIG))
     arb_mux0
       (.rts_col                        (rts_col[nBANK_MACHS-1:0]),       // AUTOs wants to make this an input.
        /*AUTOINST*/
        // Outputs
        .col_a                          (col_a[ROW_WIDTH-1:0]),
        .col_ba                         (col_ba[BANK_WIDTH-1:0]),
        .col_data_buf_addr              (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .col_periodic_rd                (col_periodic_rd),
        .col_ra                         (col_ra[RANK_WIDTH-1:0]),
        .col_rmw                        (col_rmw),
        .col_row                        (col_row[ROW_WIDTH-1:0]),
        .col_size                       (col_size),
        .col_wr_data_buf_addr           (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
        .dfi_address0                   (dfi_address0[ROW_WIDTH-1:0]),
        .dfi_address1                   (dfi_address1[ROW_WIDTH-1:0]),
        .dfi_bank0                      (dfi_bank0[BANK_WIDTH-1:0]),
        .dfi_bank1                      (dfi_bank1[BANK_WIDTH-1:0]),
        .dfi_cas_n0                     (dfi_cas_n0),
        .dfi_cas_n1                     (dfi_cas_n1),
        .dfi_cs_n0                      (dfi_cs_n0[(CS_WIDTH*nCS_PER_RANK)-1:0]),
        .dfi_cs_n1                      (dfi_cs_n1[(CS_WIDTH*nCS_PER_RANK)-1:0]),
        .dfi_odt_nom0                   (dfi_odt_nom0[(nSLOTS*nCS_PER_RANK)-1:0]),
        .dfi_odt_nom1                   (dfi_odt_nom1[(nSLOTS*nCS_PER_RANK)-1:0]),
        .dfi_odt_wr0                    (dfi_odt_wr0[(nSLOTS*nCS_PER_RANK)-1:0]),
        .dfi_odt_wr1                    (dfi_odt_wr1[(nSLOTS*nCS_PER_RANK)-1:0]),
        .dfi_ras_n0                     (dfi_ras_n0),
        .dfi_ras_n1                     (dfi_ras_n1),
        .dfi_we_n0                      (dfi_we_n0),
        .dfi_we_n1                      (dfi_we_n1),
        .io_config                      (io_config[RANK_WIDTH:0]),
        .io_config_valid_r              (io_config_valid_r),
        .sending_row                    (sending_row[nBANK_MACHS-1:0]),
        .sent_col                       (sent_col),
        .sent_row                       (sent_row),
        .sending_col                    (sending_col[nBANK_MACHS-1:0]),
        .io_config_strobe               (io_config_strobe),
        .insert_maint_r1                (insert_maint_r1),
        // Inputs
        .col_addr                       (col_addr[ROW_VECT_INDX:0]),
        .col_rdy_wr                     (col_rdy_wr[nBANK_MACHS-1:0]),
        .force_io_config_rd_r           (force_io_config_rd_r),
        .insert_maint_r                 (insert_maint_r),
        .maint_rank_r                   (maint_rank_r[RANK_WIDTH-1:0]),
        .maint_zq_r                     (maint_zq_r),
        .rd_wr_r                        (rd_wr_r[nBANK_MACHS-1:0]),
        .req_bank_r                     (req_bank_r[BANK_VECT_INDX:0]),
        .req_cas                        (req_cas[nBANK_MACHS-1:0]),
        .req_data_buf_addr_r            (req_data_buf_addr_r[DATA_BUF_ADDR_VECT_INDX:0]),
        .req_periodic_rd_r              (req_periodic_rd_r[nBANK_MACHS-1:0]),
        .req_rank_r                     (req_rank_r[RANK_VECT_INDX:0]),
        .req_ras                        (req_ras[nBANK_MACHS-1:0]),
        .req_row_r                      (req_row_r[ROW_VECT_INDX:0]),
        .req_size_r                     (req_size_r[nBANK_MACHS-1:0]),
        .req_wr_r                       (req_wr_r[nBANK_MACHS-1:0]),
        .row_addr                       (row_addr[ROW_VECT_INDX:0]),
        .row_cmd_wr                     (row_cmd_wr[nBANK_MACHS-1:0]),
        .rtc                            (rtc[nBANK_MACHS-1:0]),
        .rts_row                        (rts_row[nBANK_MACHS-1:0]),
        .slot_0_present                 (slot_0_present[7:0]),
        .slot_1_present                 (slot_1_present[7:0]),
        .clk                            (clk),
        .rst                            (rst));

endmodule  // bank_mach

