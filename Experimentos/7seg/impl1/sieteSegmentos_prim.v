// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.0.396.4
// Netlist written on Thu Jan 30 21:58:24 2020
//
// Verilog Description of module sieteSegmentos
//

module sieteSegmentos (I0, I1, I2, I3, a, b, c, d, e, f, 
            g);   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(6[8:22])
    input I0;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(8[2:4])
    input I1;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(9[2:4])
    input I2;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(10[2:4])
    input I3;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(11[2:4])
    output a;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(12[2:3])
    output b;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(13[2:3])
    output c;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(14[2:3])
    output d;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(15[2:3])
    output e;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(16[2:3])
    output f;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(17[2:3])
    output g;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(18[2:3])
    
    
    wire I0_c, I1_c, I2_c, I3_c, a_c, b_c, c_c, d_c, e_c, 
        f_c, g_c, GND_net, VCC_net;
    
    LUT4 I3_c_bdd_4_lut_129 (.A(I3_c), .B(I0_c), .C(I1_c), .D(I2_c), 
         .Z(f_c)) /* synthesis lut_function=(A (B (C)+!B !((D)+!C))+!A (B (C+!(D))+!B !((D)+!C))) */ ;
    defparam I3_c_bdd_4_lut_129.init = 16'hc0f4;
    LUT4 c_I_0_2_lut_3_lut (.A(I2_c), .B(I1_c), .C(I0_c), .Z(c_c)) /* synthesis lut_function=(!(A+((C)+!B))) */ ;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(25[9:23])
    defparam c_I_0_2_lut_3_lut.init = 16'h0404;
    OB f_pad (.I(f_c), .O(f));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(17[2:3])
    OB e_pad (.I(e_c), .O(e));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(16[2:3])
    OB d_pad (.I(d_c), .O(d));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(15[2:3])
    OB c_pad (.I(c_c), .O(c));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(14[2:3])
    OB b_pad (.I(b_c), .O(b));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(13[2:3])
    OB a_pad (.I(a_c), .O(a));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(12[2:3])
    VLO i130 (.Z(GND_net));
    GSR GSR_INST (.GSR(VCC_net));
    OB g_pad (.I(g_c), .O(g));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(18[2:3])
    IB I0_pad (.I(I0), .O(I0_c));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(8[2:4])
    IB I1_pad (.I(I1), .O(I1_c));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(9[2:4])
    IB I2_pad (.I(I2), .O(I2_c));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(10[2:4])
    IB I3_pad (.I(I3), .O(I3_c));   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(11[2:4])
    LUT4 I3_c_bdd_4_lut (.A(I3_c), .B(I1_c), .C(I2_c), .D(I0_c), .Z(d_c)) /* synthesis lut_function=(A (B (C (D))+!B !((D)+!C))+!A (B (C (D))+!B !(C (D)+!C !(D)))) */ ;
    defparam I3_c_bdd_4_lut.init = 16'hc130;
    LUT4 i77_4_lut_4_lut (.A(I3_c), .B(I2_c), .C(I0_c), .D(I1_c), .Z(a_c)) /* synthesis lut_function=(!(A ((C+(D))+!B)+!A (B (C+(D))+!B ((D)+!C)))) */ ;
    defparam i77_4_lut_4_lut.init = 16'h001c;
    LUT4 i78_3_lut (.A(I2_c), .B(I1_c), .C(I0_c), .Z(b_c)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(24[8:58])
    defparam i78_3_lut.init = 16'h2828;
    LUT4 a_N_2_I_0_3_lut_4_lut_4_lut (.A(I0_c), .B(I1_c), .C(I2_c), .D(I3_c), 
         .Z(g_c)) /* synthesis lut_function=(A (B (C)+!B !(C+(D)))+!A !(B+(C+(D)))) */ ;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(26[85:101])
    defparam a_N_2_I_0_3_lut_4_lut_4_lut.init = 16'h8083;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    TSALL TSALL_INST (.TSALL(GND_net));
    LUT4 a_N_11_I_0_3_lut (.A(I2_c), .B(I0_c), .C(I1_c), .Z(e_c)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;   // d:/desktop/diseno de sistemas digitales/experimentos/7seg/sietesegm.vhd(27[8:30])
    defparam a_N_11_I_0_3_lut.init = 16'hcece;
    VHI i131 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

