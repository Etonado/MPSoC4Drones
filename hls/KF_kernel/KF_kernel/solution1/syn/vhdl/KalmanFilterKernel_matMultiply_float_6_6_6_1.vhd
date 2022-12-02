-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity KalmanFilterKernel_matMultiply_float_6_6_6_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mat_in_L_address0 : OUT STD_LOGIC_VECTOR (4 downto 0);
    mat_in_L_ce0 : OUT STD_LOGIC;
    mat_in_L_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    mat_out_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    mat_out_ce0 : OUT STD_LOGIC;
    mat_out_we0 : OUT STD_LOGIC;
    mat_out_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_3388_p_ce : OUT STD_LOGIC );
end;


architecture behav of KalmanFilterKernel_matMultiply_float_6_6_6_1 is 
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
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal H_address0 : STD_LOGIC_VECTOR (4 downto 0);
    signal H_ce0 : STD_LOGIC;
    signal H_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln13_fu_139_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln13_reg_299 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal empty_fu_175_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal empty_reg_307 : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln13_fu_149_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal empty_32_fu_189_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal empty_32_reg_312 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln17_fu_195_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln17_reg_317 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal zext_ln17_fu_201_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln17_reg_322 : STD_LOGIC_VECTOR (4 downto 0);
    signal mat_out_addr_reg_330 : STD_LOGIC_VECTOR (5 downto 0);
    signal icmp_ln17_fu_209_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln23_fu_225_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln23_reg_335 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln23_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_fu_287_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln27_reg_353 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_fu_133_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_reg_368 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal grp_fu_293_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal i_reg_88 : STD_LOGIC_VECTOR (2 downto 0);
    signal k_reg_99 : STD_LOGIC_VECTOR (2 downto 0);
    signal j_reg_110 : STD_LOGIC_VECTOR (1 downto 0);
    signal add1913_reg_121 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln20_fu_220_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_fu_246_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln27_7_fu_282_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_fu_133_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_133_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_shl2_fu_163_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_shl1_fu_155_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl2_cast_fu_171_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal p_shl_fu_181_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln13_fu_145_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln17_4_fu_205_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln20_fu_215_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln23_fu_231_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln27_fu_241_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal shl_ln27_2_fu_259_p3 : STD_LOGIC_VECTOR (2 downto 0);
    signal shl_ln_fu_251_p3 : STD_LOGIC_VECTOR (4 downto 0);
    signal zext_ln27_6_fu_267_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal sub_ln27_fu_271_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal add_ln27_6_fu_277_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal grp_fu_133_ce : STD_LOGIC;
    signal grp_fu_293_in_valid : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_293_p0 : STD_LOGIC_VECTOR (31 downto 0);
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


    component KalmanFilterKernel_matMultiply_float_6_6_6_1_H IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (4 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    H_U : component KalmanFilterKernel_matMultiply_float_6_6_6_1_H
    generic map (
        DataWidth => 32,
        AddressRange => 18,
        AddressWidth => 5)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => H_address0,
        ce0 => H_ce0,
        q0 => H_q0);

    facc_32ns_32ns_1ns_32_3_no_dsp_1_U44 : component KalmanFilterKernel_facc_32ns_32ns_1ns_32_3_no_dsp_1
    generic map (
        DWIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        ce => ap_const_logic_1,
        in_data => mul_reg_368,
        in_last => icmp_ln27_reg_353,
        in_valid => grp_fu_293_in_valid,
        out_data => grp_fu_293_p3);





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


    add1913_reg_121_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_209_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                add1913_reg_121 <= ap_const_lv32_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                add1913_reg_121 <= grp_fu_293_p3;
            end if; 
        end if;
    end process;

    i_reg_88_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_88 <= ap_const_lv3_0;
            elsif (((icmp_ln17_fu_209_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                i_reg_88 <= add_ln13_reg_299;
            end if; 
        end if;
    end process;

    j_reg_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_209_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                j_reg_110 <= ap_const_lv2_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
                j_reg_110 <= add_ln23_reg_335;
            end if; 
        end if;
    end process;

    k_reg_99_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_149_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                k_reg_99 <= ap_const_lv3_0;
            elsif (((icmp_ln23_fu_235_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
                k_reg_99 <= add_ln17_reg_317;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln13_reg_299 <= add_ln13_fu_139_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                add_ln17_reg_317 <= add_ln17_fu_195_p2;
                    zext_ln17_reg_322(2 downto 0) <= zext_ln17_fu_201_p1(2 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                add_ln23_reg_335 <= add_ln23_fu_225_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln13_fu_149_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                empty_32_reg_312 <= empty_32_fu_189_p2;
                    empty_reg_307(5 downto 1) <= empty_fu_175_p2(5 downto 1);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln23_fu_235_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                icmp_ln27_reg_353 <= icmp_ln27_fu_287_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln17_fu_209_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                mat_out_addr_reg_330 <= zext_ln20_fu_220_p1(6 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state8)) then
                mul_reg_368 <= grp_fu_3388_p_dout0;
            end if;
        end if;
    end process;
    empty_reg_307(0) <= '0';
    zext_ln17_reg_322(4 downto 3) <= "00";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_149_p2, ap_CS_fsm_state3, icmp_ln17_fu_209_p2, ap_CS_fsm_state4, icmp_ln23_fu_235_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln13_fu_149_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((icmp_ln17_fu_209_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((icmp_ln23_fu_235_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
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
    H_address0 <= zext_ln27_7_fu_282_p1(5 - 1 downto 0);

    H_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            H_ce0 <= ap_const_logic_1;
        else 
            H_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln13_fu_139_p2 <= std_logic_vector(unsigned(i_reg_88) + unsigned(ap_const_lv3_1));
    add_ln17_fu_195_p2 <= std_logic_vector(unsigned(k_reg_99) + unsigned(ap_const_lv3_1));
    add_ln20_fu_215_p2 <= std_logic_vector(unsigned(zext_ln17_4_fu_205_p1) + unsigned(empty_reg_307));
    add_ln23_fu_225_p2 <= std_logic_vector(unsigned(j_reg_110) + unsigned(ap_const_lv2_1));
    add_ln27_6_fu_277_p2 <= std_logic_vector(unsigned(sub_ln27_fu_271_p2) + unsigned(zext_ln17_reg_322));
    add_ln27_fu_241_p2 <= std_logic_vector(unsigned(zext_ln23_fu_231_p1) + unsigned(empty_32_reg_312));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln13_fu_149_p2)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((icmp_ln13_fu_149_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln13_fu_149_p2)
    begin
        if (((icmp_ln13_fu_149_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    empty_32_fu_189_p2 <= std_logic_vector(unsigned(p_shl_fu_181_p3) - unsigned(zext_ln13_fu_145_p1));
    empty_fu_175_p2 <= std_logic_vector(unsigned(p_shl1_fu_155_p3) - unsigned(p_shl2_cast_fu_171_p1));
    grp_fu_133_ce <= ap_const_logic_1;
    grp_fu_133_p0 <= mat_in_L_q0;
    grp_fu_133_p1 <= H_q0;
    grp_fu_133_p2 <= grp_fu_3388_p_dout0;

    grp_fu_293_in_valid_assign_proc : process(ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            grp_fu_293_in_valid <= ap_const_logic_1;
        else 
            grp_fu_293_in_valid <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_3388_p_ce <= ap_const_logic_1;
    grp_fu_3388_p_din0 <= mat_in_L_q0;
    grp_fu_3388_p_din1 <= H_q0;
    icmp_ln13_fu_149_p2 <= "1" when (i_reg_88 = ap_const_lv3_6) else "0";
    icmp_ln17_fu_209_p2 <= "1" when (k_reg_99 = ap_const_lv3_6) else "0";
    icmp_ln23_fu_235_p2 <= "1" when (j_reg_110 = ap_const_lv2_3) else "0";
    icmp_ln27_fu_287_p2 <= "1" when (add_ln23_fu_225_p2 = ap_const_lv2_3) else "0";
    mat_in_L_address0 <= zext_ln27_fu_246_p1(5 - 1 downto 0);

    mat_in_L_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_in_L_ce0 <= ap_const_logic_1;
        else 
            mat_in_L_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_address0 <= mat_out_addr_reg_330;

    mat_out_ce0_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            mat_out_ce0 <= ap_const_logic_1;
        else 
            mat_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    mat_out_d0 <= add1913_reg_121;

    mat_out_we0_assign_proc : process(ap_CS_fsm_state4, icmp_ln23_fu_235_p2)
    begin
        if (((icmp_ln23_fu_235_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            mat_out_we0 <= ap_const_logic_1;
        else 
            mat_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_shl1_fu_155_p3 <= (i_reg_88 & ap_const_lv3_0);
    p_shl2_cast_fu_171_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl2_fu_163_p3),6));
    p_shl2_fu_163_p3 <= (i_reg_88 & ap_const_lv1_0);
    p_shl_fu_181_p3 <= (i_reg_88 & ap_const_lv2_0);
    shl_ln27_2_fu_259_p3 <= (j_reg_110 & ap_const_lv1_0);
    shl_ln_fu_251_p3 <= (j_reg_110 & ap_const_lv3_0);
    sub_ln27_fu_271_p2 <= std_logic_vector(unsigned(shl_ln_fu_251_p3) - unsigned(zext_ln27_6_fu_267_p1));
    zext_ln13_fu_145_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_88),5));
    zext_ln17_4_fu_205_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_reg_99),6));
    zext_ln17_fu_201_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(k_reg_99),5));
    zext_ln20_fu_220_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln20_fu_215_p2),64));
    zext_ln23_fu_231_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_110),5));
    zext_ln27_6_fu_267_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln27_2_fu_259_p3),5));
    zext_ln27_7_fu_282_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_6_fu_277_p2),64));
    zext_ln27_fu_246_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln27_fu_241_p2),64));
end behav;
