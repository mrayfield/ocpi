// AXIS_LOOPBACK - For testing the OPED component
// Copyright (c) 2010 Atomic Rules LLC - ALL RIGHTS RESERVED
//
// The purpose of this module is to loopback the AXI4-Stream that is produced
// by the OPED to the stream that is consumed by the OPED. In this way, this
// module can stand-in for the OPED during development; and be repaled with
// Input/Output arbiters when ready. This module allows testing of the DMA
// capabilities of OPED block with mininal extra logic.

module AXIS_LOOPBACK (
  input  wire         ACLK,
  input  wire         ARESETN,
  input  wire [255:0] S_AXIS_DAT_TDATA,
  input  wire         S_AXIS_DAT_TVALID,
  input  wire [31:0]  S_AXIS_DAT_TSTRB,
  input  wire         S_AXIS_DAT_TLAST,
  output wire         S_AXIS_DAT_TREADY,
  input  wire [15:0]  S_AXIS_LEN_TDATA,
  input  wire [7:0]   S_AXIS_SPT_TDATA,
  input  wire [7:0]   S_AXIS_DPT_TDATA,
  input  wire         S_AXIS_ERR_TDATA,
  output wire [255:0] M_AXIS_DAT_TDATA,
  output wire         M_AXIS_DAT_TVALID,
  output wire [31:0]  M_AXIS_DAT_TSTRB,
  output wire         M_AXIS_DAT_TLAST,
  input  wire         M_AXIS_DAT_TREADY,
  output wire [15:0]  M_AXIS_LEN_TDATA,
  output wire [7:0]   M_AXIS_SPT_TDATA,
  output wire [7:0]   M_AXIS_DPT_TDATA,
  output wire         M_AXIS_ERR_TDATA
);

// Just loop the signals through...
  assign M_AXIS_DAT_TDATA  = S_AXIS_DAT_TDATA;
  assign M_AXIS_DAT_TVALID = S_AXIS_DAT_TVALID;
  assign M_AXIS_DAT_TSTRB  = S_AXIS_DAT_TSTRB;
  assign M_AXIS_DAT_TLAST  = S_AXIS_DAT_TLAST;
  assign S_AXIS_DAT_TREADY = M_AXIS_DAT_TREADY;
  assign M_AXIS_LEN_TDATA  = S_AXIS_LEN_TDATA;
  assign M_AXIS_SPT_TDATA  = S_AXIS_SPT_TDATA;
  assign M_AXIS_DPT_TDATA  = S_AXIS_DPT_TDATA;
  assign M_AXIS_ERR_TDATA  = S_AXIS_ERR_TDATA;

endmodule
