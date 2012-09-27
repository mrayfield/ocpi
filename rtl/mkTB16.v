//
// Generated by Bluespec Compiler, version 2012.09.beta1 (build 29570, 2012-09.11)
//
// On Thu Sep 27 16:54:44 EDT 2012
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

module mkTB16(CLK,
	      RST_N);
  input  CLK;
  input  RST_N;

  // register cp2hByteCount
  reg [31 : 0] cp2hByteCount;
  wire [31 : 0] cp2hByteCount$D_IN;
  wire cp2hByteCount$EN;

  // register h2cpByteCount
  reg [31 : 0] h2cpByteCount;
  wire [31 : 0] h2cpByteCount$D_IN;
  wire h2cpByteCount$EN;

  // register r_hdl
  reg [32 : 0] r_hdl;
  wire [32 : 0] r_hdl$D_IN;
  wire r_hdl$EN;

  // register simCycle
  reg [15 : 0] simCycle;
  wire [15 : 0] simCycle$D_IN;
  wire simCycle$EN;

  // register w_hdl
  reg [32 : 0] w_hdl;
  wire [32 : 0] w_hdl$D_IN;
  wire w_hdl$EN;

  // ports of submodule inF
  wire [7 : 0] inF$D_IN, inF$D_OUT;
  wire inF$CLR, inF$DEQ, inF$EMPTY_N, inF$ENQ, inF$FULL_N;

  // ports of submodule outF
  wire [7 : 0] outF$D_IN, outF$D_OUT;
  wire outF$CLR, outF$DEQ, outF$EMPTY_N, outF$ENQ, outF$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_do_r_char, WILL_FIRE_RL_do_w_char;

  // remaining internal signals
  reg [63 : 0] v__h1087, v__h1246, v__h1505, v__h1602;
  reg [31 : 0] TASK_fopen___d4, TASK_fopen___d9, b__h927;

  // submodule inF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) inF(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(inF$D_IN),
					      .ENQ(inF$ENQ),
					      .DEQ(inF$DEQ),
					      .CLR(inF$CLR),
					      .D_OUT(inF$D_OUT),
					      .FULL_N(inF$FULL_N),
					      .EMPTY_N(inF$EMPTY_N));

  // submodule outF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) outF(.RST(RST_N),
					       .CLK(CLK),
					       .D_IN(outF$D_IN),
					       .ENQ(outF$ENQ),
					       .DEQ(outF$DEQ),
					       .CLR(outF$CLR),
					       .D_OUT(outF$D_OUT),
					       .FULL_N(outF$FULL_N),
					       .EMPTY_N(outF$EMPTY_N));

  // rule RL_do_r_char
  assign WILL_FIRE_RL_do_r_char = inF$FULL_N && r_hdl[32] ;

  // rule RL_do_w_char
  assign WILL_FIRE_RL_do_w_char = outF$EMPTY_N && w_hdl[32] ;

  // register cp2hByteCount
  assign cp2hByteCount$D_IN = cp2hByteCount + 32'd1 ;
  assign cp2hByteCount$EN = WILL_FIRE_RL_do_w_char ;

  // register h2cpByteCount
  assign h2cpByteCount$D_IN = h2cpByteCount + 32'd1 ;
  assign h2cpByteCount$EN =
	     WILL_FIRE_RL_do_r_char && b__h927 != 32'hFFFFFFFF ;

  // register r_hdl
  assign r_hdl$D_IN = { 1'd1, TASK_fopen___d4 } ;
  assign r_hdl$EN = !r_hdl[32] ;

  // register simCycle
  assign simCycle$D_IN = simCycle + 16'd1 ;
  assign simCycle$EN = 1'd1 ;

  // register w_hdl
  assign w_hdl$D_IN = { 1'd1, TASK_fopen___d9 } ;
  assign w_hdl$EN = !w_hdl[32] ;

  // submodule inF
  assign inF$D_IN = b__h927[7:0] ;
  assign inF$ENQ = WILL_FIRE_RL_do_r_char && b__h927 != 32'hFFFFFFFF ;
  assign inF$DEQ = outF$FULL_N && inF$EMPTY_N ;
  assign inF$CLR = 1'b0 ;

  // submodule outF
  assign outF$D_IN = inF$D_OUT ;
  assign outF$ENQ = outF$FULL_N && inF$EMPTY_N ;
  assign outF$DEQ = WILL_FIRE_RL_do_w_char ;
  assign outF$CLR = 1'b0 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cp2hByteCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	h2cpByteCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	r_hdl <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
	simCycle <= `BSV_ASSIGNMENT_DELAY 16'd0;
	w_hdl <= `BSV_ASSIGNMENT_DELAY 33'h0AAAAAAAA;
      end
    else
      begin
        if (cp2hByteCount$EN)
	  cp2hByteCount <= `BSV_ASSIGNMENT_DELAY cp2hByteCount$D_IN;
	if (h2cpByteCount$EN)
	  h2cpByteCount <= `BSV_ASSIGNMENT_DELAY h2cpByteCount$D_IN;
	if (r_hdl$EN) r_hdl <= `BSV_ASSIGNMENT_DELAY r_hdl$D_IN;
	if (simCycle$EN) simCycle <= `BSV_ASSIGNMENT_DELAY simCycle$D_IN;
	if (w_hdl$EN) w_hdl <= `BSV_ASSIGNMENT_DELAY w_hdl$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cp2hByteCount = 32'hAAAAAAAA;
    h2cpByteCount = 32'hAAAAAAAA;
    r_hdl = 33'h0AAAAAAAA;
    simCycle = 16'hAAAA;
    w_hdl = 33'h0AAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (!r_hdl[32])
	begin
	  TASK_fopen___d4 = $fopen("host2cp.dat", "r");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (!w_hdl[32])
	begin
	  TASK_fopen___d9 = $fopen("cp2host.dat", "w");
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char)
	begin
	  b__h927 = $fgetc(r_hdl[31:0]);
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h927 == 32'hFFFFFFFF)
	begin
	  v__h1087 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h927 == 32'hFFFFFFFF)
	$display("[%0d]: do_r_char fgetc returned -1 after %d Bytes",
		 v__h1087,
		 h2cpByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h927 == 32'hFFFFFFFF)
	$fclose(r_hdl[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h927 != 32'hFFFFFFFF)
	begin
	  v__h1246 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_r_char && b__h927 != 32'hFFFFFFFF)
	$display("[%0d]: get_cp read %x on byte %x ",
		 v__h1246,
		 b__h927[7:0],
		 h2cpByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_w_char) $fwrite(w_hdl[31:0], outF$D_OUT);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_w_char)
	begin
	  v__h1505 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_do_w_char)
	$display("[%0d]: get_cp write %x on byte %x ",
		 v__h1505,
		 outF$D_OUT,
		 cp2hByteCount);
    if (RST_N != `BSV_RESET_VALUE)
      if (simCycle == 16'd1000)
	begin
	  v__h1602 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (simCycle == 16'd1000)
	$display("[%0d]: %m: mkTB16 termination", v__h1602);
    if (RST_N != `BSV_RESET_VALUE) if (simCycle == 16'd1000) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkTB16
