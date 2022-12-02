// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module KalmanFilterKernel_matMultiply_float_6_6_6_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        mat_in_L_address0,
        mat_in_L_ce0,
        mat_in_L_q0,
        mat_in_R_address0,
        mat_in_R_ce0,
        mat_in_R_q0,
        mat_out_address0,
        mat_out_ce0,
        mat_out_we0,
        mat_out_d0,
        grp_fu_3388_p_din0,
        grp_fu_3388_p_din1,
        grp_fu_3388_p_dout0,
        grp_fu_3388_p_ce
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [5:0] mat_in_L_address0;
output   mat_in_L_ce0;
input  [31:0] mat_in_L_q0;
output  [3:0] mat_in_R_address0;
output   mat_in_R_ce0;
input  [31:0] mat_in_R_q0;
output  [4:0] mat_out_address0;
output   mat_out_ce0;
output   mat_out_we0;
output  [31:0] mat_out_d0;
output  [31:0] grp_fu_3388_p_din0;
output  [31:0] grp_fu_3388_p_din1;
input  [31:0] grp_fu_3388_p_dout0;
output   grp_fu_3388_p_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg mat_in_L_ce0;
reg mat_in_R_ce0;
reg mat_out_ce0;
reg mat_out_we0;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] add_ln13_fu_131_p2;
reg   [2:0] add_ln13_reg_265;
wire    ap_CS_fsm_state2;
wire   [5:0] empty_fu_159_p2;
reg   [5:0] empty_reg_273;
wire   [0:0] icmp_ln13_fu_141_p2;
wire   [4:0] trunc_ln17_fu_165_p1;
reg   [4:0] trunc_ln17_reg_278;
wire   [1:0] add_ln17_fu_169_p2;
reg   [1:0] add_ln17_reg_283;
wire    ap_CS_fsm_state3;
wire   [3:0] zext_ln17_fu_175_p1;
reg   [3:0] zext_ln17_reg_288;
reg   [4:0] mat_out_addr_reg_296;
wire   [0:0] icmp_ln17_fu_183_p2;
wire   [1:0] add_ln23_fu_199_p2;
reg   [1:0] add_ln23_reg_301;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln23_fu_213_p2;
wire   [0:0] icmp_ln27_fu_253_p2;
reg   [0:0] icmp_ln27_reg_319;
wire    ap_CS_fsm_state5;
wire   [31:0] grp_fu_125_p2;
reg   [31:0] mul_reg_334;
wire    ap_CS_fsm_state8;
wire   [31:0] grp_fu_259_p3;
wire    ap_CS_fsm_state11;
reg   [2:0] i_reg_80;
reg   [1:0] k_reg_91;
reg   [1:0] j_reg_102;
reg   [31:0] add1913_reg_113;
wire   [63:0] zext_ln20_fu_194_p1;
wire  signed [63:0] sext_ln27_fu_224_p1;
wire   [63:0] zext_ln27_fu_248_p1;
wire   [31:0] grp_fu_125_p0;
wire   [31:0] grp_fu_125_p1;
wire   [4:0] p_shl_fu_147_p3;
wire   [5:0] p_shl_cast_fu_155_p1;
wire   [5:0] zext_ln13_fu_137_p1;
wire   [4:0] zext_ln17_3_fu_179_p1;
wire   [4:0] add_ln20_fu_189_p2;
wire   [5:0] zext_ln23_2_fu_209_p1;
wire   [5:0] add_ln27_fu_219_p2;
wire   [3:0] shl_ln_fu_229_p3;
wire   [3:0] zext_ln23_fu_205_p1;
wire   [3:0] sub_ln27_fu_237_p2;
wire   [3:0] add_ln27_5_fu_243_p2;
wire    ap_CS_fsm_state9;
wire    grp_fu_125_ce;
reg    grp_fu_259_in_valid;
reg   [10:0] ap_NS_fsm;
wire   [31:0] grp_fu_259_p0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
end

KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1 #(
    .DWIDTH( 32 ))
facc_32ns_32ns_1ns_32_3_no_dsp_1_U39(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .in_data(mul_reg_334),
    .in_last(icmp_ln27_reg_319),
    .in_valid(grp_fu_259_in_valid),
    .out_data(grp_fu_259_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_183_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        add1913_reg_113 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        add1913_reg_113 <= grp_fu_259_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_80 <= 3'd0;
    end else if (((icmp_ln17_fu_183_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        i_reg_80 <= add_ln13_reg_265;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_183_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        j_reg_102 <= 2'd0;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        j_reg_102 <= add_ln23_reg_301;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln13_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        k_reg_91 <= 2'd0;
    end else if (((icmp_ln23_fu_213_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        k_reg_91 <= add_ln17_reg_283;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln13_reg_265 <= add_ln13_fu_131_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add_ln17_reg_283 <= add_ln17_fu_169_p2;
        zext_ln17_reg_288[1 : 0] <= zext_ln17_fu_175_p1[1 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln23_reg_301 <= add_ln23_fu_199_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln13_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_273 <= empty_fu_159_p2;
        trunc_ln17_reg_278 <= trunc_ln17_fu_165_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln23_fu_213_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        icmp_ln27_reg_319 <= icmp_ln27_fu_253_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_183_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        mat_out_addr_reg_296 <= zext_ln20_fu_194_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        mul_reg_334 <= grp_fu_3388_p_dout0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)) | ((icmp_ln13_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln13_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_fu_259_in_valid = 1'b1;
    end else begin
        grp_fu_259_in_valid = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        mat_in_L_ce0 = 1'b1;
    end else begin
        mat_in_L_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        mat_in_R_ce0 = 1'b1;
    end else begin
        mat_in_R_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        mat_out_ce0 = 1'b1;
    end else begin
        mat_out_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln23_fu_213_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        mat_out_we0 = 1'b1;
    end else begin
        mat_out_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln13_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((icmp_ln17_fu_183_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((icmp_ln23_fu_213_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln13_fu_131_p2 = (i_reg_80 + 3'd1);

assign add_ln17_fu_169_p2 = (k_reg_91 + 2'd1);

assign add_ln20_fu_189_p2 = (zext_ln17_3_fu_179_p1 + trunc_ln17_reg_278);

assign add_ln23_fu_199_p2 = (j_reg_102 + 2'd1);

assign add_ln27_5_fu_243_p2 = (sub_ln27_fu_237_p2 + zext_ln17_reg_288);

assign add_ln27_fu_219_p2 = (zext_ln23_2_fu_209_p1 + empty_reg_273);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign empty_fu_159_p2 = (p_shl_cast_fu_155_p1 - zext_ln13_fu_137_p1);

assign grp_fu_125_ce = 1'b1;

assign grp_fu_125_p0 = mat_in_L_q0;

assign grp_fu_125_p1 = mat_in_R_q0;

assign grp_fu_125_p2 = grp_fu_3388_p_dout0;

assign grp_fu_3388_p_ce = 1'b1;

assign grp_fu_3388_p_din0 = mat_in_L_q0;

assign grp_fu_3388_p_din1 = mat_in_R_q0;

assign icmp_ln13_fu_141_p2 = ((i_reg_80 == 3'd6) ? 1'b1 : 1'b0);

assign icmp_ln17_fu_183_p2 = ((k_reg_91 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln23_fu_213_p2 = ((j_reg_102 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln27_fu_253_p2 = ((add_ln23_fu_199_p2 == 2'd3) ? 1'b1 : 1'b0);

assign mat_in_L_address0 = sext_ln27_fu_224_p1;

assign mat_in_R_address0 = zext_ln27_fu_248_p1;

assign mat_out_address0 = mat_out_addr_reg_296;

assign mat_out_d0 = add1913_reg_113;

assign p_shl_cast_fu_155_p1 = p_shl_fu_147_p3;

assign p_shl_fu_147_p3 = {{i_reg_80}, {2'd0}};

assign sext_ln27_fu_224_p1 = $signed(add_ln27_fu_219_p2);

assign shl_ln_fu_229_p3 = {{j_reg_102}, {2'd0}};

assign sub_ln27_fu_237_p2 = (shl_ln_fu_229_p3 - zext_ln23_fu_205_p1);

assign trunc_ln17_fu_165_p1 = empty_fu_159_p2[4:0];

assign zext_ln13_fu_137_p1 = i_reg_80;

assign zext_ln17_3_fu_179_p1 = k_reg_91;

assign zext_ln17_fu_175_p1 = k_reg_91;

assign zext_ln20_fu_194_p1 = add_ln20_fu_189_p2;

assign zext_ln23_2_fu_209_p1 = j_reg_102;

assign zext_ln23_fu_205_p1 = j_reg_102;

assign zext_ln27_fu_248_p1 = add_ln27_5_fu_243_p2;

always @ (posedge ap_clk) begin
    zext_ln17_reg_288[3:2] <= 2'b00;
end

endmodule //KalmanFilterKernel_matMultiply_float_6_6_6_3
