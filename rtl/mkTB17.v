//
// Generated by Bluespec Compiler, version 2012.09.beta1 (build 29570, 2012-09.11)
//
// On Fri Sep 28 16:05:04 EDT 2012
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

module mkTB17(CLK,
	      RST_N);
  input  CLK;
  input  RST_N;

  // register inEOF
  reg inEOF;
  wire inEOF$D_IN, inEOF$EN;

  // register simCycle
  reg [15 : 0] simCycle;
  wire [15 : 0] simCycle$D_IN;
  wire simCycle$EN;

  // ports of submodule simIO
  wire [7 : 0] simIO$host_request_get, simIO$host_response_put;
  wire simIO$EN_host_request_get,
       simIO$EN_host_response_put,
       simIO$RDY_host_request_get,
       simIO$RDY_host_response_put;

  // remaining internal signals
  reg [63 : 0] v__h329;

  // submodule simIO
  mkSimIO simIO(.CLK(CLK),
		.RST_N(RST_N),
		.host_response_put(simIO$host_response_put),
		.EN_host_request_get(simIO$EN_host_request_get),
		.EN_host_response_put(simIO$EN_host_response_put),
		.host_request_get(simIO$host_request_get),
		.RDY_host_request_get(simIO$RDY_host_request_get),
		.RDY_host_response_put(simIO$RDY_host_response_put));

  // register inEOF
  assign inEOF$D_IN = 1'b0 ;
  assign inEOF$EN = 1'b0 ;

  // register simCycle
  assign simCycle$D_IN = simCycle + 16'd1 ;
  assign simCycle$EN = 1'd1 ;

  // submodule simIO
  assign simIO$host_response_put = simIO$host_request_get ;
  assign simIO$EN_host_request_get =
	     simIO$RDY_host_response_put && simIO$RDY_host_request_get ;
  assign simIO$EN_host_response_put =
	     simIO$RDY_host_response_put && simIO$RDY_host_request_get ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        inEOF <= `BSV_ASSIGNMENT_DELAY 1'd0;
	simCycle <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (inEOF$EN) inEOF <= `BSV_ASSIGNMENT_DELAY inEOF$D_IN;
	if (simCycle$EN) simCycle <= `BSV_ASSIGNMENT_DELAY simCycle$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    inEOF = 1'h0;
    simCycle = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (simCycle == 16'd1000)
	begin
	  v__h329 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (simCycle == 16'd1000)
	$display("[%0d]: %m: mkTB16 termination", v__h329);
    if (RST_N != `BSV_RESET_VALUE) if (simCycle == 16'd1000) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTB17

