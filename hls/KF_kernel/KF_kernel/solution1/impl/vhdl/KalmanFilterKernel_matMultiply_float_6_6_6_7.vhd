-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity KalmanFilterKernel_matMultiply_float_6_6_6_7 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mat_in_L_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    mat_in_L_ce0 : OUT STD_LOGIC;
    mat_in_L_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mat_in_R_address0 : OUT STD_LOGIC_VECTOR (2 downto 0);
    mat_in_R_ce0 : OUT STD_LOGIC;
    mat_in_R_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mat_out_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    mat_out_ce0 : OUT STD_LOGIC;
    mat_out_we0 : OUT STD_LOGIC;
    mat_out_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_ce : OUT STD_LOGIC );
end;


architecture behav of KalmanFilterKernel_matMultiply_float_6_6_6_7 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal add_ln13_fu_132_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln13_reg_233 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal empty_fu_164_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal empty_reg_241 : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln13_fu_138_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln17_fu_170_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln17_reg_246 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal mat_out_addr_reg_251 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_phi_mux_k_phi_fu_95_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln23_fu_185_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln23_reg_256 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln23_fu_195_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_fu_221_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_reg_274 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_fu_126_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_reg_289 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_227_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal i_reg_78 : STD_LOGIC_VECTOR (2 downto 0);
    signal k_reg_90 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_reg_103 : STD_LOGIC_VECTOR (2 downto 0);
    signal add1913_reg_114 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln20_fu_180_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_fu_206_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_1_fu_216_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_126_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_126_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_shl1_fu_152_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_shl_fu_144_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl1_cast_fu_160_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln20_fu_174_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal zext_ln23_fu_191_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln27_fu_201_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln27_1_fu_211_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal grp_fu_126_ce : STD_LOGIC;
    signal grp_fu_227_in_valid : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_227_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component KalmanFilterKernel_fmul_32ns_32ns_32_4_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1 IS
    generic (
        DWIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        in_data : IN STD_LOGIC_VECTOR (31 downto 0);
        in_last : IN STD_LOGIC_VECTOR (0 downto 0);
        in_valid : IN STD_LOGIC;
        out_data : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    facc_32ns_32ns_1ns_32_3_no_dsp_1_U2 : component KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1
    generic map (
        DWIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        ce => ap_const_logic_1,
        in_data => mul_reg_289,
        in_last => icmp_ln27_reg_274,
        in_valid => grp_fu_227_in_valid,
        out_data => grp_fu_227_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    add1913_reg_114_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_phi_mux_k_phi_fu_95_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                add1913_reg_114 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                add1913_reg_114 <= grp_fu_227_p3;
            end if; 
        end if;
    end process;

    i_reg_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_78 <= ap_const_lv3_0;
            elsif (((ap_phi_mux_k_phi_fu_95_p4 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                i_reg_78 <= add_ln13_reg_233;
            end if; 
        end if;
    end process;

    j_reg_103_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_phi_mux_k_phi_fu_95_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                j_reg_103 <= ap_const_lv3_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                j_reg_103 <= add_ln23_reg_256;
            end if; 
        end if;
    end process;

    k_reg_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_138_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                k_reg_90 <= ap_const_lv1_0;
            elsif (((icmp_ln23_fu_195_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                k_reg_90 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln13_reg_233 <= add_ln13_fu_132_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                add_ln23_reg_256 <= add_ln23_fu_185_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_138_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    empty_reg_241(5 downto 1) <= empty_fu_164_p2(5 downto 1);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln23_fu_195_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                icmp_ln27_reg_274 <= icmp_ln27_fu_221_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_phi_mux_k_phi_fu_95_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    mat_out_addr_reg_251(2 downto 0) <= zext_ln20_fu_180_p1(6 - 1 downto 0)(2 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                mul_reg_289 <= grp_fu_3388_p_dout0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                    zext_ln17_reg_246(0) <= zext_ln17_fu_170_p1(0);
            end if;
        end if;
    end process;
    empty_reg_241(0) <= '0';
    zext_ln17_reg_246(2 downto 1) <= "00";
    mat_out_addr_reg_251(5 downto 3) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_138_p2, ap_CS_fsm_state3, ap_phi_mux_k_phi_fu_95_p4, ap_CS_fsm_state4, icmp_ln23_fu_195_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln13_fu_138_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_phi_mux_k_phi_fu_95_p4 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((icmp_ln23_fu_195_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    add_ln13_fu_132_p2 <= std_logic_vector(unsigned(i_reg_78) + unsigned(ap_const_lv3_1));
    add_ln20_fu_174_p2 <= std_logic_vector(unsigned(zext_ln17_fu_170_p1) + unsigned(i_reg_78));
    add_ln23_fu_185_p2 <= std_logic_vector(unsigned(j_reg_103) + unsigned(ap_const_lv3_1));
    add_ln27_1_fu_211_p2 <= std_logic_vector(unsigned(j_reg_103) + unsigned(zext_ln17_reg_246));
    add_ln27_fu_201_p2 <= std_logic_vector(unsigned(zext_ln23_fu_191_p1) + unsigned(empty_reg_241));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_138_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((icmp_ln13_fu_138_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_phi_mux_k_phi_fu_95_p4 <= k_reg_90;

    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln13_fu_138_p2)
    begin
        if (((icmp_ln13_fu_138_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_fu_164_p2 <= std_logic_vector(unsigned(p_shl_fu_144_p3) - unsigned(p_shl1_cast_fu_160_p1));
    grp_fu_126_ce <= ap_const_logic_1;
    grp_fu_126_p0 <= mat_in_L_q0;
    grp_fu_126_p1 <= mat_in_R_q0;
    grp_fu_126_p2 <= grp_fu_3388_p_dout0;

    grp_fu_227_in_valid_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            grp_fu_227_in_valid <= ap_const_logic_1;
        else 
            grp_fu_227_in_valid <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_3388_p_ce <= ap_const_logic_1;
    grp_fu_3388_p_din0 <= mat_in_L_q0;
    grp_fu_3388_p_din1 <= mat_in_R_q0;
    icmp_ln13_fu_138_p2 <= "1" when (i_reg_78 = ap_const_lv3_6) else "0";
    icmp_ln23_fu_195_p2 <= "1" when (j_reg_103 = ap_const_lv3_6) else "0";
    icmp_ln27_fu_221_p2 <= "1" when (add_ln23_fu_185_p2 = ap_const_lv3_6) else "0";
    mat_in_L_address0 <= zext_ln27_fu_206_p1(6 - 1 downto 0);

    mat_in_L_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_in_L_ce0 <= ap_const_logic_1;
        else 
            mat_in_L_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_in_R_address0 <= zext_ln27_1_fu_216_p1(3 - 1 downto 0);

    mat_in_R_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_in_R_ce0 <= ap_const_logic_1;
        else 
            mat_in_R_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_address0 <= mat_out_addr_reg_251;

    mat_out_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_out_ce0 <= ap_const_logic_1;
        else 
            mat_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_d0 <= add1913_reg_114;

    mat_out_we0_assign_proc : process(ap_CS_fsm_state4, icmp_ln23_fu_195_p2)
    begin
        if (((icmp_ln23_fu_195_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            mat_out_we0 <= ap_const_logic_1;
        else 
            mat_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_shl1_cast_fu_160_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl1_fu_152_p3),6));
    p_shl1_fu_152_p3 <= (i_reg_78 & ap_const_lv1_0);
    p_shl_fu_144_p3 <= (i_reg_78 & ap_const_lv3_0);
    zext_ln17_fu_170_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_reg_90),3));
    zext_ln20_fu_180_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln20_fu_174_p2),64));
    zext_ln23_fu_191_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_103),6));
    zext_ln27_1_fu_216_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_1_fu_211_p2),64));
    zext_ln27_fu_206_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_fu_201_p2),64));
end behav;
