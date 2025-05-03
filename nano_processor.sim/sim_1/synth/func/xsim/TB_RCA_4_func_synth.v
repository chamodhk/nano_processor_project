// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sat May  3 20:59:54 2025
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/Nano/nano_processor_project/nano_processor.sim/sim_1/synth/func/xsim/TB_RCA_4_func_synth.v
// Design      : RCA_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module RCA_4
   (A0,
    A1,
    A2,
    A3,
    B0,
    B1,
    B2,
    B3,
    C_in,
    CTR,
    S0,
    S1,
    S2,
    S3,
    C_out);
  input A0;
  input A1;
  input A2;
  input A3;
  input B0;
  input B1;
  input B2;
  input B3;
  input C_in;
  input CTR;
  output S0;
  output S1;
  output S2;
  output S3;
  inout C_out;

  wire A0;
  wire A0_IBUF;
  wire A1;
  wire A1_IBUF;
  wire A2;
  wire A2_IBUF;
  wire A3;
  wire A3_IBUF;
  wire B0;
  wire B0_IBUF;
  wire B1;
  wire B1_IBUF;
  wire B2;
  wire B2_IBUF;
  wire B3;
  wire B3_IBUF;
  wire CTR;
  wire CTR_IBUF;
  wire C_out;
  wire C_out_OBUF;
  wire \FA0_3/HA1_C ;
  wire FA1_C;
  wire S0;
  wire S0_OBUF;
  wire S1;
  wire S1_OBUF;
  wire S2;
  wire S2_OBUF;
  wire S3;
  wire S3_OBUF;

  IBUF A0_IBUF_inst
       (.I(A0),
        .O(A0_IBUF));
  IBUF A1_IBUF_inst
       (.I(A1),
        .O(A1_IBUF));
  IBUF A2_IBUF_inst
       (.I(A2),
        .O(A2_IBUF));
  IBUF A3_IBUF_inst
       (.I(A3),
        .O(A3_IBUF));
  IBUF B0_IBUF_inst
       (.I(B0),
        .O(B0_IBUF));
  IBUF B1_IBUF_inst
       (.I(B1),
        .O(B1_IBUF));
  IBUF B2_IBUF_inst
       (.I(B2),
        .O(B2_IBUF));
  IBUF B3_IBUF_inst
       (.I(B3),
        .O(B3_IBUF));
  IBUF CTR_IBUF_inst
       (.I(CTR),
        .O(CTR_IBUF));
  OBUF C_out_OBUF_inst
       (.I(C_out_OBUF),
        .O(C_out));
  LUT4 #(
    .INIT(16'hFF28)) 
    C_out_OBUF_inst_i_1
       (.I0(A3_IBUF),
        .I1(B3_IBUF),
        .I2(CTR_IBUF),
        .I3(\FA0_3/HA1_C ),
        .O(C_out_OBUF));
  LUT6 #(
    .INIT(64'h9099666000906000)) 
    C_out_OBUF_inst_i_2
       (.I0(A3_IBUF),
        .I1(B3_IBUF),
        .I2(A2_IBUF),
        .I3(B2_IBUF),
        .I4(CTR_IBUF),
        .I5(FA1_C),
        .O(\FA0_3/HA1_C ));
  OBUF S0_OBUF_inst
       (.I(S0_OBUF),
        .O(S0));
  LUT2 #(
    .INIT(4'h6)) 
    S0_OBUF_inst_i_1
       (.I0(A0_IBUF),
        .I1(B0_IBUF),
        .O(S0_OBUF));
  OBUF S1_OBUF_inst
       (.I(S1_OBUF),
        .O(S1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h4B87B478)) 
    S1_OBUF_inst_i_1
       (.I0(A0_IBUF),
        .I1(B0_IBUF),
        .I2(A1_IBUF),
        .I3(CTR_IBUF),
        .I4(B1_IBUF),
        .O(S1_OBUF));
  OBUF S2_OBUF_inst
       (.I(S2_OBUF),
        .O(S2));
  LUT4 #(
    .INIT(16'h6996)) 
    S2_OBUF_inst_i_1
       (.I0(FA1_C),
        .I1(A2_IBUF),
        .I2(CTR_IBUF),
        .I3(B2_IBUF),
        .O(S2_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hDFF808D0)) 
    S2_OBUF_inst_i_2
       (.I0(B0_IBUF),
        .I1(A0_IBUF),
        .I2(CTR_IBUF),
        .I3(B1_IBUF),
        .I4(A1_IBUF),
        .O(FA1_C));
  OBUF S3_OBUF_inst
       (.I(S3_OBUF),
        .O(S3));
  LUT6 #(
    .INIT(64'h4DB2E817B24D17E8)) 
    S3_OBUF_inst_i_1
       (.I0(A2_IBUF),
        .I1(B2_IBUF),
        .I2(FA1_C),
        .I3(A3_IBUF),
        .I4(CTR_IBUF),
        .I5(B3_IBUF),
        .O(S3_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
