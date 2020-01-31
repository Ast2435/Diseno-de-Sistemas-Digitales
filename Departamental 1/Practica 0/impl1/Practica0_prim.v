// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.0.396.4
// Netlist written on Thu Jan 30 22:34:50 2020
//
// Verilog Description of module Practica0
//

module Practica0 (a, b, ref, sel, display);   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(7[8:17])
    input [2:0]a;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[2:3])
    input [2:0]b;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[4:5])
    input [2:0]ref;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[6:9])
    input sel;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(9[2:5])
    output [6:0]display;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    
    
    wire GND_net, VCC_net, a_c_2, a_c_1, a_c_0, b_c_2, b_c_1, 
        b_c_0, ref_c_2, ref_c_1, ref_c_0, sel_c, n157;
    wire [2:0]aux;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(15[8:11])
    wire [2:0]codigo;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(15[13:19])
    
    wire n156, n4, n4_adj_1, n158;
    
    VHI i2 (.Z(VCC_net));
    OB display_pad_6 (.I(GND_net), .O(display[6]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_5 (.I(codigo[0]), .O(display[5]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_4 (.I(codigo[0]), .O(display[4]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_3 (.I(GND_net), .O(display[3]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_2 (.I(n156), .O(display[2]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_1 (.I(n156), .O(display[1]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    OB display_pad_0 (.I(VCC_net), .O(display[0]));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(10[2:9])
    IB a_pad_2 (.I(a[2]), .O(a_c_2));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[2:3])
    IB a_pad_1 (.I(a[1]), .O(a_c_1));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[2:3])
    IB a_pad_0 (.I(a[0]), .O(a_c_0));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[2:3])
    IB b_pad_2 (.I(b[2]), .O(b_c_2));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[4:5])
    IB b_pad_1 (.I(b[1]), .O(b_c_1));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[4:5])
    IB b_pad_0 (.I(b[0]), .O(b_c_0));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[4:5])
    IB ref_pad_2 (.I(ref[2]), .O(ref_c_2));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[6:9])
    IB ref_pad_1 (.I(ref[1]), .O(ref_c_1));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[6:9])
    IB ref_pad_0 (.I(ref[0]), .O(ref_c_0));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(8[6:9])
    IB sel_pad (.I(sel), .O(sel_c));   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(9[2:5])
    GSR GSR_INST (.GSR(VCC_net));
    LUT4 aux_2__I_0_i4_4_lut_4_lut (.A(n157), .B(ref_c_1), .C(aux[0]), 
         .D(ref_c_0), .Z(n4)) /* synthesis lut_function=(!(A ((C+!(D))+!B)+!A !(B+!(C+!(D))))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(23[7:16])
    defparam aux_2__I_0_i4_4_lut_4_lut.init = 16'h4d44;
    LUT4 ref_2__I_0_i4_4_lut_4_lut (.A(n157), .B(ref_c_1), .C(ref_c_0), 
         .D(aux[0]), .Z(n4_adj_1)) /* synthesis lut_function=(!(A (B (C+!(D)))+!A (B+(C+!(D))))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(23[7:16])
    defparam ref_2__I_0_i4_4_lut_4_lut.init = 16'h2b22;
    LUT4 b_2__I_0_i1_3_lut (.A(a_c_0), .B(b_c_0), .C(sel_c), .Z(aux[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(18[9:32])
    defparam b_2__I_0_i1_3_lut.init = 16'hcaca;
    LUT4 aux_2__I_0_i6_3_lut_rep_2 (.A(n158), .B(ref_c_2), .C(n4), .Z(n156)) /* synthesis lut_function=(!(A (B (C))+!A (B+(C)))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(23[7:16])
    defparam aux_2__I_0_i6_3_lut_rep_2.init = 16'h2b2b;
    LUT4 i114_4_lut_4_lut_4_lut_4_lut (.A(n158), .B(ref_c_2), .C(n4), 
         .D(n4_adj_1), .Z(codigo[0])) /* synthesis lut_function=(A (B (C+!(D)))+!A (B+(C+!(D)))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(23[7:16])
    defparam i114_4_lut_4_lut_4_lut_4_lut.init = 16'hd4dd;
    LUT4 b_2__I_0_i2_3_lut_rep_3 (.A(a_c_1), .B(b_c_1), .C(sel_c), .Z(n157)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(18[9:32])
    defparam b_2__I_0_i2_3_lut_rep_3.init = 16'hcaca;
    LUT4 b_2__I_0_i3_3_lut_rep_4 (.A(a_c_2), .B(b_c_2), .C(sel_c), .Z(n158)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/desktop/diseno de sistemas digitales/departamental 1/practica 0/practica0.vhd(18[9:32])
    defparam b_2__I_0_i3_3_lut_rep_4.init = 16'hcaca;
    VLO i81 (.Z(GND_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    TSALL TSALL_INST (.TSALL(GND_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

