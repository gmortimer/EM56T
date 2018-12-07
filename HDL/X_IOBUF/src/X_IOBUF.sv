// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Relevant Technologies Ltd.
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//    
// THIS SOFTWARE IS PROVIDED BY RELEVANT TECHNOLOGIES "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL RELEVANT TECHNOLOGIES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, INTELLECTUAL PROPERTY
// RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module X_IOBUF (

  GPIO_I,
  GPIO_T,
  GPIO_O,

  GPIO_P00,
  GPIO_P01,
  GPIO_P02,
  GPIO_P03,
  GPIO_P04,
  GPIO_P05,
  GPIO_P06,
  GPIO_P07,
  GPIO_P08,
  GPIO_P09,
  GPIO_P10,
  GPIO_P11,
  GPIO_P12,
  GPIO_P13,
  GPIO_P14,
  GPIO_P15,
  GPIO_P16,
  GPIO_P17,
  GPIO_P18,
  GPIO_P19,
  GPIO_P20,
  GPIO_P21,
  GPIO_P22,
  GPIO_P23,
  GPIO_P24,
  GPIO_P25,
  GPIO_P26,
  GPIO_P27,
  GPIO_P28,
  GPIO_P29,
  GPIO_P30,
  GPIO_P31,
  GPIO_P32,
  GPIO_P33,
  GPIO_P34,
  GPIO_P35,
  GPIO_P36,
  GPIO_P37,
  GPIO_P38,
  GPIO_P39,
  GPIO_P40,
  GPIO_P41,
  GPIO_P42,
  GPIO_P43,
  GPIO_P44,
  GPIO_P45,
  GPIO_P46,
  GPIO_P47,
  GPIO_P48,
  GPIO_P49,
  GPIO_P50,
  GPIO_P51,
  GPIO_P52,
  GPIO_P53,
  GPIO_P54,
  GPIO_P55,
  GPIO_P56,
  GPIO_P57,
  GPIO_P58,
  GPIO_P59,
  GPIO_P60,
  GPIO_P61,
  GPIO_P62,
  GPIO_P63
  );

  localparam MAX_GPIO_WIDTH      = 64;
  localparam DEFAULT_OPTS        = 8;  
  
  parameter byte GPIO_WIDTH      = 64;
  parameter byte N_PORTS         = 1;

  parameter [2:0] CFG_00      = 3'b001;
  parameter [2:0] CFG_01      = 3'b001;
  parameter [2:0] CFG_02      = 3'b001;
  parameter [2:0] CFG_03      = 3'b001;
  parameter [2:0] CFG_04      = 3'b001;
  parameter [2:0] CFG_05      = 3'b001;
  parameter [2:0] CFG_06      = 3'b001;
  parameter [2:0] CFG_07      = 3'b001;
  parameter [2:0] CFG_08      = 3'b001;
  parameter [2:0] CFG_09      = 3'b001;
  parameter [2:0] CFG_10      = 3'b001;
  parameter [2:0] CFG_11      = 3'b001;
  parameter [2:0] CFG_12      = 3'b001;
  parameter [2:0] CFG_13      = 3'b001;
  parameter [2:0] CFG_14      = 3'b001;
  parameter [2:0] CFG_15      = 3'b001;
  parameter [2:0] CFG_16      = 3'b001;
  parameter [2:0] CFG_17      = 3'b001;
  parameter [2:0] CFG_18      = 3'b001;
  parameter [2:0] CFG_19      = 3'b001;
  parameter [2:0] CFG_20      = 3'b001;
  parameter [2:0] CFG_21      = 3'b001;
  parameter [2:0] CFG_22      = 3'b001;
  parameter [2:0] CFG_23      = 3'b001;
  parameter [2:0] CFG_24      = 3'b001;
  parameter [2:0] CFG_25      = 3'b001;
  parameter [2:0] CFG_26      = 3'b001;
  parameter [2:0] CFG_27      = 3'b001;
  parameter [2:0] CFG_28      = 3'b001;
  parameter [2:0] CFG_29      = 3'b001;
  parameter [2:0] CFG_30      = 3'b001;
  parameter [2:0] CFG_31      = 3'b001;
  parameter [2:0] CFG_32      = 3'b001;
  parameter [2:0] CFG_33      = 3'b001;
  parameter [2:0] CFG_34      = 3'b001;
  parameter [2:0] CFG_35      = 3'b001;
  parameter [2:0] CFG_36      = 3'b001;
  parameter [2:0] CFG_37      = 3'b001;
  parameter [2:0] CFG_38      = 3'b001;
  parameter [2:0] CFG_39      = 3'b001;
  parameter [2:0] CFG_40      = 3'b001;
  parameter [2:0] CFG_41      = 3'b001;
  parameter [2:0] CFG_42      = 3'b001;
  parameter [2:0] CFG_43      = 3'b001;
  parameter [2:0] CFG_44      = 3'b001;
  parameter [2:0] CFG_45      = 3'b001;
  parameter [2:0] CFG_46      = 3'b001;
  parameter [2:0] CFG_47      = 3'b001;
  parameter [2:0] CFG_48      = 3'b001;
  parameter [2:0] CFG_49      = 3'b001;
  parameter [2:0] CFG_50      = 3'b001;
  parameter [2:0] CFG_51      = 3'b001;
  parameter [2:0] CFG_52      = 3'b001;
  parameter [2:0] CFG_53      = 3'b001;
  parameter [2:0] CFG_54      = 3'b001;
  parameter [2:0] CFG_55      = 3'b001;
  parameter [2:0] CFG_56      = 3'b001;
  parameter [2:0] CFG_57      = 3'b001;
  parameter [2:0] CFG_58      = 3'b001;
  parameter [2:0] CFG_59      = 3'b001;
  parameter [2:0] CFG_60      = 3'b001;
  parameter [2:0] CFG_61      = 3'b001;
  parameter [2:0] CFG_62      = 3'b001;
  parameter [2:0] CFG_63      = 3'b001;

  parameter byte IN00_LEFT       = 0;
  parameter byte IN01_LEFT       = 0;
  parameter byte IN02_LEFT       = 0;
  parameter byte IN03_LEFT       = 0;
  parameter byte IN04_LEFT       = 0;
  parameter byte IN05_LEFT       = 0;
  parameter byte IN06_LEFT       = 0;
  parameter byte IN07_LEFT       = 0;
  parameter byte IN08_LEFT       = 0;
  parameter byte IN09_LEFT       = 0;
  parameter byte IN10_LEFT       = 0;
  parameter byte IN11_LEFT       = 0;
  parameter byte IN12_LEFT       = 0;
  parameter byte IN13_LEFT       = 0;
  parameter byte IN14_LEFT       = 0;
  parameter byte IN15_LEFT       = 0;
  parameter byte IN16_LEFT       = 0;
  parameter byte IN17_LEFT       = 0;
  parameter byte IN18_LEFT       = 0;
  parameter byte IN19_LEFT       = 0;
  parameter byte IN20_LEFT       = 0;
  parameter byte IN21_LEFT       = 0;
  parameter byte IN22_LEFT       = 0;
  parameter byte IN23_LEFT       = 0;
  parameter byte IN24_LEFT       = 0;
  parameter byte IN25_LEFT       = 0;
  parameter byte IN26_LEFT       = 0;
  parameter byte IN27_LEFT       = 0;
  parameter byte IN28_LEFT       = 0;
  parameter byte IN29_LEFT       = 0;
  parameter byte IN30_LEFT       = 0;
  parameter byte IN31_LEFT       = 0;
  parameter byte IN32_LEFT       = 0;
  parameter byte IN33_LEFT       = 0;
  parameter byte IN34_LEFT       = 0;
  parameter byte IN35_LEFT       = 0;
  parameter byte IN36_LEFT       = 0;
  parameter byte IN37_LEFT       = 0;
  parameter byte IN38_LEFT       = 0;
  parameter byte IN39_LEFT       = 0;
  parameter byte IN40_LEFT       = 0;
  parameter byte IN41_LEFT       = 0;
  parameter byte IN42_LEFT       = 0;
  parameter byte IN43_LEFT       = 0;
  parameter byte IN44_LEFT       = 0;
  parameter byte IN45_LEFT       = 0;
  parameter byte IN46_LEFT       = 0;
  parameter byte IN47_LEFT       = 0;
  parameter byte IN48_LEFT       = 0;
  parameter byte IN49_LEFT       = 0;
  parameter byte IN50_LEFT       = 0;
  parameter byte IN51_LEFT       = 0;
  parameter byte IN52_LEFT       = 0;
  parameter byte IN53_LEFT       = 0;
  parameter byte IN54_LEFT       = 0;
  parameter byte IN55_LEFT       = 0;
  parameter byte IN56_LEFT       = 0;
  parameter byte IN57_LEFT       = 0;
  parameter byte IN58_LEFT       = 0;
  parameter byte IN59_LEFT       = 0;
  parameter byte IN60_LEFT       = 0;
  parameter byte IN61_LEFT       = 0;
  parameter byte IN62_LEFT       = 0;
  parameter byte IN63_LEFT       = 0;

  parameter byte IN00_RIGHT      = 0; 
  parameter byte IN01_RIGHT      = 0; 
  parameter byte IN02_RIGHT      = 0; 
  parameter byte IN03_RIGHT      = 0; 
  parameter byte IN04_RIGHT      = 0; 
  parameter byte IN05_RIGHT      = 0; 
  parameter byte IN06_RIGHT      = 0; 
  parameter byte IN07_RIGHT      = 0; 
  parameter byte IN08_RIGHT      = 0; 
  parameter byte IN09_RIGHT      = 0; 
  parameter byte IN10_RIGHT      = 0; 
  parameter byte IN11_RIGHT      = 0; 
  parameter byte IN12_RIGHT      = 0; 
  parameter byte IN13_RIGHT      = 0; 
  parameter byte IN14_RIGHT      = 0; 
  parameter byte IN15_RIGHT      = 0; 
  parameter byte IN16_RIGHT      = 0; 
  parameter byte IN17_RIGHT      = 0; 
  parameter byte IN18_RIGHT      = 0; 
  parameter byte IN19_RIGHT      = 0; 
  parameter byte IN20_RIGHT      = 0; 
  parameter byte IN21_RIGHT      = 0; 
  parameter byte IN22_RIGHT      = 0; 
  parameter byte IN23_RIGHT      = 0; 
  parameter byte IN24_RIGHT      = 0; 
  parameter byte IN25_RIGHT      = 0; 
  parameter byte IN26_RIGHT      = 0; 
  parameter byte IN27_RIGHT      = 0; 
  parameter byte IN28_RIGHT      = 0; 
  parameter byte IN29_RIGHT      = 0; 
  parameter byte IN30_RIGHT      = 0; 
  parameter byte IN31_RIGHT      = 0; 
  parameter byte IN32_RIGHT      = 0; 
  parameter byte IN33_RIGHT      = 0; 
  parameter byte IN34_RIGHT      = 0; 
  parameter byte IN35_RIGHT      = 0; 
  parameter byte IN36_RIGHT      = 0; 
  parameter byte IN37_RIGHT      = 0; 
  parameter byte IN38_RIGHT      = 0; 
  parameter byte IN39_RIGHT      = 0; 
  parameter byte IN40_RIGHT      = 0; 
  parameter byte IN41_RIGHT      = 0; 
  parameter byte IN42_RIGHT      = 0; 
  parameter byte IN43_RIGHT      = 0; 
  parameter byte IN44_RIGHT      = 0; 
  parameter byte IN45_RIGHT      = 0; 
  parameter byte IN46_RIGHT      = 0; 
  parameter byte IN47_RIGHT      = 0; 
  parameter byte IN48_RIGHT      = 0; 
  parameter byte IN49_RIGHT      = 0; 
  parameter byte IN50_RIGHT      = 0; 
  parameter byte IN51_RIGHT      = 0; 
  parameter byte IN52_RIGHT      = 0; 
  parameter byte IN53_RIGHT      = 0; 
  parameter byte IN54_RIGHT      = 0; 
  parameter byte IN55_RIGHT      = 0; 
  parameter byte IN56_RIGHT      = 0; 
  parameter byte IN57_RIGHT      = 0; 
  parameter byte IN58_RIGHT      = 0; 
  parameter byte IN59_RIGHT      = 0; 
  parameter byte IN60_RIGHT      = 0; 
  parameter byte IN61_RIGHT      = 0; 
  parameter byte IN62_RIGHT      = 0; 
  parameter byte IN63_RIGHT      = 0; 
  
  
  localparam true  = 1;
  localparam false = 0;
  
  localparam [(MAX_GPIO_WIDTH-1):0][2:0] CFG = '{
    CFG_00,  
    CFG_01,  
    CFG_02,  
    CFG_03,  
    CFG_04,  
    CFG_05,  
    CFG_06,  
    CFG_07, 
    CFG_08,  
    CFG_09,  
    CFG_10,  
    CFG_11,  
    CFG_12,  
    CFG_13,  
    CFG_14,  
    CFG_15, 
    CFG_16,  
    CFG_17,  
    CFG_18,  
    CFG_19,  
    CFG_20,  
    CFG_21,  
    CFG_22,  
    CFG_23, 
    CFG_24,  
    CFG_25,  
    CFG_26,  
    CFG_27,  
    CFG_28,  
    CFG_29,  
    CFG_30,  
    CFG_31, 
    CFG_32,  
    CFG_33,  
    CFG_34,  
    CFG_35,  
    CFG_36,  
    CFG_37,  
    CFG_38,  
    CFG_39, 
    CFG_40,  
    CFG_41,  
    CFG_42,  
    CFG_43,  
    CFG_44,  
    CFG_45,  
    CFG_46,  
    CFG_47, 
    CFG_48,  
    CFG_49,  
    CFG_50,  
    CFG_51,  
    CFG_52,  
    CFG_53,  
    CFG_54,  
    CFG_55, 
    CFG_56,  
    CFG_57,  
    CFG_58,  
    CFG_59,  
    CFG_60,  
    CFG_61,  
    CFG_62,  
    CFG_63 
    };

  
  localparam byte IN_LEFT [0:(MAX_GPIO_WIDTH-1)] = '{
    IN00_LEFT,  
    IN01_LEFT,  
    IN02_LEFT,  
    IN03_LEFT,  
    IN04_LEFT,  
    IN05_LEFT,  
    IN06_LEFT,  
    IN07_LEFT, 
    IN08_LEFT,  
    IN09_LEFT,  
    IN10_LEFT,  
    IN11_LEFT,  
    IN12_LEFT,  
    IN13_LEFT,  
    IN14_LEFT,  
    IN15_LEFT, 
    IN16_LEFT,  
    IN17_LEFT,  
    IN18_LEFT,  
    IN19_LEFT,  
    IN20_LEFT,  
    IN21_LEFT,  
    IN22_LEFT,  
    IN23_LEFT, 
    IN24_LEFT,  
    IN25_LEFT,  
    IN26_LEFT,  
    IN27_LEFT,  
    IN28_LEFT,  
    IN29_LEFT,  
    IN30_LEFT,  
    IN31_LEFT, 
    IN32_LEFT,  
    IN33_LEFT,  
    IN34_LEFT,  
    IN35_LEFT,  
    IN36_LEFT,  
    IN37_LEFT,  
    IN38_LEFT,  
    IN39_LEFT, 
    IN40_LEFT,  
    IN41_LEFT,  
    IN42_LEFT,  
    IN43_LEFT,  
    IN44_LEFT,  
    IN45_LEFT,  
    IN46_LEFT,  
    IN47_LEFT, 
    IN48_LEFT,  
    IN49_LEFT,  
    IN50_LEFT,  
    IN51_LEFT,  
    IN52_LEFT,  
    IN53_LEFT,  
    IN54_LEFT,  
    IN55_LEFT, 
    IN56_LEFT,  
    IN57_LEFT,  
    IN58_LEFT,  
    IN59_LEFT,  
    IN60_LEFT,  
    IN61_LEFT,  
    IN62_LEFT,  
    IN63_LEFT 
    };

  localparam byte IN_RIGHT [0:(MAX_GPIO_WIDTH-1)] = '{
    IN00_RIGHT,  
    IN01_RIGHT,  
    IN02_RIGHT,  
    IN03_RIGHT,  
    IN04_RIGHT,  
    IN05_RIGHT,  
    IN06_RIGHT,  
    IN07_RIGHT, 
    IN08_RIGHT,  
    IN09_RIGHT,  
    IN10_RIGHT,  
    IN11_RIGHT,  
    IN12_RIGHT,  
    IN13_RIGHT,  
    IN14_RIGHT,  
    IN15_RIGHT, 
    IN16_RIGHT,  
    IN17_RIGHT,  
    IN18_RIGHT,  
    IN19_RIGHT,  
    IN20_RIGHT,  
    IN21_RIGHT,  
    IN22_RIGHT,  
    IN23_RIGHT, 
    IN24_RIGHT,  
    IN25_RIGHT,  
    IN26_RIGHT,  
    IN27_RIGHT,  
    IN28_RIGHT,  
    IN29_RIGHT,  
    IN30_RIGHT,  
    IN31_RIGHT, 
    IN32_RIGHT,  
    IN33_RIGHT,  
    IN34_RIGHT,  
    IN35_RIGHT,  
    IN36_RIGHT,  
    IN37_RIGHT,  
    IN38_RIGHT,  
    IN39_RIGHT, 
    IN40_RIGHT,  
    IN41_RIGHT,  
    IN42_RIGHT,  
    IN43_RIGHT,  
    IN44_RIGHT,  
    IN45_RIGHT,  
    IN46_RIGHT,  
    IN47_RIGHT, 
    IN48_RIGHT,  
    IN49_RIGHT,  
    IN50_RIGHT,  
    IN51_RIGHT,  
    IN52_RIGHT,  
    IN53_RIGHT,  
    IN54_RIGHT,  
    IN55_RIGHT, 
    IN56_RIGHT,  
    IN57_RIGHT,  
    IN58_RIGHT,  
    IN59_RIGHT,  
    IN60_RIGHT,  
    IN61_RIGHT,  
    IN62_RIGHT,  
    IN63_RIGHT 
    };

  output  [(GPIO_WIDTH-1):0]       GPIO_I;
  input   [(GPIO_WIDTH-1):0]       GPIO_O;
  input   [(GPIO_WIDTH-1):0]       GPIO_T;
  
  inout   [IN00_LEFT:IN00_RIGHT]   GPIO_P00;
  inout   [IN01_LEFT:IN01_RIGHT]   GPIO_P01;
  inout   [IN02_LEFT:IN02_RIGHT]   GPIO_P02;
  inout   [IN03_LEFT:IN03_RIGHT]   GPIO_P03;
  inout   [IN04_LEFT:IN04_RIGHT]   GPIO_P04;
  inout   [IN05_LEFT:IN05_RIGHT]   GPIO_P05;
  inout   [IN06_LEFT:IN06_RIGHT]   GPIO_P06;
  inout   [IN07_LEFT:IN07_RIGHT]   GPIO_P07;
  inout   [IN08_LEFT:IN08_RIGHT]   GPIO_P08;
  inout   [IN09_LEFT:IN09_RIGHT]   GPIO_P09;
  inout   [IN10_LEFT:IN10_RIGHT]   GPIO_P10;
  inout   [IN11_LEFT:IN11_RIGHT]   GPIO_P11;
  inout   [IN12_LEFT:IN12_RIGHT]   GPIO_P12;
  inout   [IN13_LEFT:IN13_RIGHT]   GPIO_P13;
  inout   [IN14_LEFT:IN14_RIGHT]   GPIO_P14;
  inout   [IN15_LEFT:IN15_RIGHT]   GPIO_P15;
  inout   [IN16_LEFT:IN16_RIGHT]   GPIO_P16;
  inout   [IN17_LEFT:IN17_RIGHT]   GPIO_P17;
  inout   [IN18_LEFT:IN18_RIGHT]   GPIO_P18;
  inout   [IN19_LEFT:IN19_RIGHT]   GPIO_P19;
  inout   [IN20_LEFT:IN20_RIGHT]   GPIO_P20;
  inout   [IN21_LEFT:IN21_RIGHT]   GPIO_P21;
  inout   [IN22_LEFT:IN22_RIGHT]   GPIO_P22;
  inout   [IN23_LEFT:IN23_RIGHT]   GPIO_P23;
  inout   [IN24_LEFT:IN24_RIGHT]   GPIO_P24;
  inout   [IN25_LEFT:IN25_RIGHT]   GPIO_P25;
  inout   [IN26_LEFT:IN26_RIGHT]   GPIO_P26;
  inout   [IN27_LEFT:IN27_RIGHT]   GPIO_P27;
  inout   [IN28_LEFT:IN28_RIGHT]   GPIO_P28;
  inout   [IN29_LEFT:IN29_RIGHT]   GPIO_P29;
  inout   [IN30_LEFT:IN30_RIGHT]   GPIO_P30;
  inout   [IN31_LEFT:IN31_RIGHT]   GPIO_P31;
  inout   [IN32_LEFT:IN32_RIGHT]   GPIO_P32;
  inout   [IN33_LEFT:IN33_RIGHT]   GPIO_P33;
  inout   [IN34_LEFT:IN34_RIGHT]   GPIO_P34;
  inout   [IN35_LEFT:IN35_RIGHT]   GPIO_P35;
  inout   [IN36_LEFT:IN36_RIGHT]   GPIO_P36;
  inout   [IN37_LEFT:IN37_RIGHT]   GPIO_P37;
  inout   [IN38_LEFT:IN38_RIGHT]   GPIO_P38;
  inout   [IN39_LEFT:IN39_RIGHT]   GPIO_P39;
  inout   [IN40_LEFT:IN40_RIGHT]   GPIO_P40;
  inout   [IN41_LEFT:IN41_RIGHT]   GPIO_P41;
  inout   [IN42_LEFT:IN42_RIGHT]   GPIO_P42;
  inout   [IN43_LEFT:IN43_RIGHT]   GPIO_P43;
  inout   [IN44_LEFT:IN44_RIGHT]   GPIO_P44;
  inout   [IN45_LEFT:IN45_RIGHT]   GPIO_P45;
  inout   [IN46_LEFT:IN46_RIGHT]   GPIO_P46;
  inout   [IN47_LEFT:IN47_RIGHT]   GPIO_P47;
  inout   [IN48_LEFT:IN48_RIGHT]   GPIO_P48;
  inout   [IN49_LEFT:IN49_RIGHT]   GPIO_P49;
  inout   [IN50_LEFT:IN50_RIGHT]   GPIO_P50;
  inout   [IN51_LEFT:IN51_RIGHT]   GPIO_P51;
  inout   [IN52_LEFT:IN52_RIGHT]   GPIO_P52;
  inout   [IN53_LEFT:IN53_RIGHT]   GPIO_P53;
  inout   [IN54_LEFT:IN54_RIGHT]   GPIO_P54;
  inout   [IN55_LEFT:IN55_RIGHT]   GPIO_P55;
  inout   [IN56_LEFT:IN56_RIGHT]   GPIO_P56;
  inout   [IN57_LEFT:IN57_RIGHT]   GPIO_P57;
  inout   [IN58_LEFT:IN58_RIGHT]   GPIO_P58;
  inout   [IN59_LEFT:IN59_RIGHT]   GPIO_P59;
  inout   [IN60_LEFT:IN60_RIGHT]   GPIO_P60;
  inout   [IN61_LEFT:IN61_RIGHT]   GPIO_P61;
  inout   [IN62_LEFT:IN62_RIGHT]   GPIO_P62;
  inout   [IN63_LEFT:IN63_RIGHT]   GPIO_P63;
  
  wire    [(GPIO_WIDTH-1):0][(GPIO_WIDTH-1):0]  gpio_p_int;
  
  assign GPIO_P00 = gpio_p_int[00][IN_LEFT[00]:IN_RIGHT[00]];
  assign GPIO_P01 = gpio_p_int[01][IN_LEFT[01]:IN_RIGHT[01]];
  assign GPIO_P02 = gpio_p_int[02][IN_LEFT[02]:IN_RIGHT[02]];
  assign GPIO_P03 = gpio_p_int[03][IN_LEFT[03]:IN_RIGHT[03]];
  assign GPIO_P04 = gpio_p_int[04][IN_LEFT[04]:IN_RIGHT[04]];
  assign GPIO_P05 = gpio_p_int[05][IN_LEFT[05]:IN_RIGHT[05]];
  assign GPIO_P06 = gpio_p_int[06][IN_LEFT[06]:IN_RIGHT[06]];
  assign GPIO_P07 = gpio_p_int[07][IN_LEFT[07]:IN_RIGHT[07]];
  assign GPIO_P08 = gpio_p_int[08][IN_LEFT[08]:IN_RIGHT[08]];
  assign GPIO_P09 = gpio_p_int[09][IN_LEFT[09]:IN_RIGHT[09]];
  assign GPIO_P10 = gpio_p_int[10][IN_LEFT[10]:IN_RIGHT[10]];
  assign GPIO_P11 = gpio_p_int[11][IN_LEFT[11]:IN_RIGHT[11]];
  assign GPIO_P12 = gpio_p_int[12][IN_LEFT[12]:IN_RIGHT[12]];
  assign GPIO_P13 = gpio_p_int[13][IN_LEFT[13]:IN_RIGHT[13]];
  assign GPIO_P14 = gpio_p_int[14][IN_LEFT[14]:IN_RIGHT[14]];
  assign GPIO_P15 = gpio_p_int[15][IN_LEFT[15]:IN_RIGHT[15]];
  assign GPIO_P16 = gpio_p_int[16][IN_LEFT[16]:IN_RIGHT[16]];
  assign GPIO_P17 = gpio_p_int[17][IN_LEFT[17]:IN_RIGHT[17]];
  assign GPIO_P18 = gpio_p_int[18][IN_LEFT[18]:IN_RIGHT[18]];
  assign GPIO_P19 = gpio_p_int[19][IN_LEFT[19]:IN_RIGHT[19]];
  assign GPIO_P20 = gpio_p_int[20][IN_LEFT[20]:IN_RIGHT[20]];
  assign GPIO_P21 = gpio_p_int[21][IN_LEFT[21]:IN_RIGHT[21]];
  assign GPIO_P22 = gpio_p_int[22][IN_LEFT[22]:IN_RIGHT[22]];
  assign GPIO_P23 = gpio_p_int[23][IN_LEFT[23]:IN_RIGHT[23]];
  assign GPIO_P24 = gpio_p_int[24][IN_LEFT[24]:IN_RIGHT[24]];
  assign GPIO_P25 = gpio_p_int[25][IN_LEFT[25]:IN_RIGHT[25]];
  assign GPIO_P26 = gpio_p_int[26][IN_LEFT[26]:IN_RIGHT[26]];
  assign GPIO_P27 = gpio_p_int[27][IN_LEFT[27]:IN_RIGHT[27]];
  assign GPIO_P28 = gpio_p_int[28][IN_LEFT[28]:IN_RIGHT[28]];
  assign GPIO_P29 = gpio_p_int[29][IN_LEFT[29]:IN_RIGHT[29]];
  assign GPIO_P30 = gpio_p_int[30][IN_LEFT[30]:IN_RIGHT[30]];
  assign GPIO_P31 = gpio_p_int[31][IN_LEFT[31]:IN_RIGHT[31]];
  assign GPIO_P32 = gpio_p_int[32][IN_LEFT[32]:IN_RIGHT[32]];
  assign GPIO_P33 = gpio_p_int[33][IN_LEFT[33]:IN_RIGHT[33]];
  assign GPIO_P34 = gpio_p_int[34][IN_LEFT[34]:IN_RIGHT[34]];
  assign GPIO_P35 = gpio_p_int[35][IN_LEFT[35]:IN_RIGHT[35]];
  assign GPIO_P36 = gpio_p_int[36][IN_LEFT[36]:IN_RIGHT[36]];
  assign GPIO_P37 = gpio_p_int[37][IN_LEFT[37]:IN_RIGHT[37]];
  assign GPIO_P38 = gpio_p_int[38][IN_LEFT[38]:IN_RIGHT[38]];
  assign GPIO_P39 = gpio_p_int[39][IN_LEFT[39]:IN_RIGHT[39]];
  assign GPIO_P40 = gpio_p_int[40][IN_LEFT[40]:IN_RIGHT[40]];
  assign GPIO_P41 = gpio_p_int[41][IN_LEFT[41]:IN_RIGHT[41]];
  assign GPIO_P42 = gpio_p_int[42][IN_LEFT[42]:IN_RIGHT[42]];
  assign GPIO_P43 = gpio_p_int[43][IN_LEFT[43]:IN_RIGHT[43]];
  assign GPIO_P44 = gpio_p_int[44][IN_LEFT[44]:IN_RIGHT[44]];
  assign GPIO_P45 = gpio_p_int[45][IN_LEFT[45]:IN_RIGHT[45]];
  assign GPIO_P46 = gpio_p_int[46][IN_LEFT[46]:IN_RIGHT[46]];
  assign GPIO_P47 = gpio_p_int[47][IN_LEFT[47]:IN_RIGHT[47]];
  assign GPIO_P48 = gpio_p_int[48][IN_LEFT[48]:IN_RIGHT[48]];
  assign GPIO_P49 = gpio_p_int[49][IN_LEFT[49]:IN_RIGHT[49]];
  assign GPIO_P50 = gpio_p_int[50][IN_LEFT[50]:IN_RIGHT[50]];
  assign GPIO_P51 = gpio_p_int[51][IN_LEFT[51]:IN_RIGHT[51]];
  assign GPIO_P52 = gpio_p_int[52][IN_LEFT[52]:IN_RIGHT[52]];
  assign GPIO_P53 = gpio_p_int[53][IN_LEFT[53]:IN_RIGHT[53]];
  assign GPIO_P54 = gpio_p_int[54][IN_LEFT[54]:IN_RIGHT[54]];
  assign GPIO_P55 = gpio_p_int[55][IN_LEFT[55]:IN_RIGHT[55]];
  assign GPIO_P56 = gpio_p_int[56][IN_LEFT[56]:IN_RIGHT[56]];
  assign GPIO_P57 = gpio_p_int[57][IN_LEFT[57]:IN_RIGHT[57]];
  assign GPIO_P58 = gpio_p_int[58][IN_LEFT[58]:IN_RIGHT[58]];
  assign GPIO_P59 = gpio_p_int[59][IN_LEFT[59]:IN_RIGHT[59]];
  assign GPIO_P60 = gpio_p_int[60][IN_LEFT[60]:IN_RIGHT[60]];
  assign GPIO_P61 = gpio_p_int[61][IN_LEFT[61]:IN_RIGHT[61]];
  assign GPIO_P62 = gpio_p_int[62][IN_LEFT[62]:IN_RIGHT[62]];
  assign GPIO_P63 = gpio_p_int[63][IN_LEFT[63]:IN_RIGHT[63]];
  
  generate
  assign GPIO_I = 'z;
  for (genvar m = 0; m < N_PORTS; m++) begin
    for (genvar n = IN_LEFT[m]; n >= IN_RIGHT[m]; n--) begin 
    IOBUF #(
       .DRIVE(12), // Specify the output drive strength
       .IBUF_LOW_PWR("TRUE"),  // Low Power - "TRUE", High Performance = "FALSE" 
       .IOSTANDARD("DEFAULT"), // Specify the I/O standard
       .SLEW("SLOW") // Specify the output slew rate
    ) IOBUF_inst (
       .O(GPIO_I[n]),     // Buffer output
       .IO(gpio_p_int[m][n]),   // Buffer inout port (connect directly to top-level port)
       .I(GPIO_O[n]),     // Buffer input
       .T(GPIO_T[n])      // 3-state enable input, high=input, low=output
    );
    end
  end
  endgenerate

endmodule

// ***************************************************************************
// ***************************************************************************
