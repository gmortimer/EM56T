library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity NULL_SYMBOL_DETECTOR_v1_0 is
	generic ( 
    	C_DEVICE_ID                 : std_logic_vector( 23 downto 0 ) := x"05D05D";  

		C_AXIS_DATA_TDATA_WIDTH	    : integer	:= 24;
		
		C_NSD_ABS_TDATA_WIDTH       : integer   := 16;
        
		C_S00_AXI_DATA_WIDTH	    : integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	    : integer	:= 9

	 );
	port ( 
        aclk            : in  std_logic;
        aresetn         : in  std_logic;
        
--        fft_config      : out std_logic;
        fft_resetn      : out std_logic; 
        sys_resetn      : out std_logic;
        fifo_resetn     : out std_logic;
        fft_cfg_rqst    : out std_logic;
        fft_cfg_done    : in  std_logic;
                
		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_awaddr	: in  std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
		s00_axi_awprot	: in  std_logic_vector( 2 downto 0 );
		s00_axi_awvalid	: in  std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in  std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
		s00_axi_wstrb	: in  std_logic_vector( ( C_S00_AXI_DATA_WIDTH/8 ) - 1 downto 0 );
		s00_axi_wvalid	: in  std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector( 1 downto 0 );
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in  std_logic;
		s00_axi_araddr	: in  std_logic_vector( C_S00_AXI_ADDR_WIDTH - 1 downto 0 );
		s00_axi_arprot	: in  std_logic_vector( 2 downto 0 );
		s00_axi_arvalid	: in  std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
		s00_axi_rresp	: out std_logic_vector( 1 downto 0 );
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in  std_logic;

		-- Ports of Axi Slave Bus Interface S_AXIS_DATA
		s_axis_rxd_tready	       : out std_logic;
		s_axis_rxd_tdata	       : in std_logic_vector( C_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
		s_axis_rxd_tvalid	       : in std_logic;
		
        -- AXI4-Stream slave port for FFT 00
        s00_axis_abs_tready     : out std_logic;
        s00_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s00_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 01
        s01_axis_abs_tready     : out std_logic;
        s01_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s01_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 02
        s02_axis_abs_tready     : out std_logic;
        s02_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s02_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 03
        s03_axis_abs_tready     : out std_logic;
        s03_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s03_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 04
        s04_axis_abs_tready     : out std_logic;
        s04_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s04_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 05
        s05_axis_abs_tready     : out std_logic;
        s05_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s05_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 06
        s06_axis_abs_tready     : out std_logic;
        s06_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s06_axis_abs_tvalid     : in  std_logic;
        
        -- AXI4-Stream slave port for FFT 07
        s07_axis_abs_tready     : out std_logic;
        s07_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s07_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 08
        s08_axis_abs_tready     : out std_logic;
        s08_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s08_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 09
        s09_axis_abs_tready     : out std_logic;
        s09_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s09_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 10
        s10_axis_abs_tready     : out std_logic;
        s10_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s10_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 11
        s11_axis_abs_tready     : out std_logic;
        s11_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s11_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 12
        s12_axis_abs_tready     : out std_logic;
        s12_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s12_axis_abs_tvalid     : in  std_logic;
        
        -- AXI4-Stream slave port for FFT 13
        s13_axis_abs_tready     : out std_logic;
        s13_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s13_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 14
        s14_axis_abs_tready     : out std_logic;
        s14_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s14_axis_abs_tvalid     : in  std_logic;
       
        -- AXI4-Stream slave port for FFT 15
        s15_axis_abs_tready     : out std_logic;
        s15_axis_abs_tdata      : in  std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );
        s15_axis_abs_tvalid     : in  std_logic;
       
		-- Ports of Axi Master Bus Interface M_AXIS_FFT
        m_axis_fft_tvalid          : out std_logic;
        m_axis_fft_tdata           : out std_logic_vector( C_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
        m_axis_fft_tready          : in std_logic;

		-- Ports of Axi Master Bus Interface M_AXIS_PRS
        m_axis_prs_tvalid          : out std_logic;
        m_axis_prs_tdata           : out std_logic_vector( C_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
        m_axis_prs_tready          : in std_logic;

		-- Ports of Axi Master Bus Interface M_AXIS_DTA
		m_axis_dta_tvalid	       : out std_logic;
		m_axis_dta_tdata	       : out std_logic_vector( C_AXIS_DATA_TDATA_WIDTH - 1 downto 0 );
		m_axis_dta_tready	       : in std_logic
	 );
end NULL_SYMBOL_DETECTOR_v1_0;

architecture rtl of NULL_SYMBOL_DETECTOR_v1_0 is

type T_NSD_ABS_TDATA          is array ( C_NSD_N_CHAN - 1 downto 0 ) of std_logic_vector( C_NSD_ABS_TDATA_WIDTH - 1 downto 0 );



constant C_N_SLV_REG            : integer := 2 **( C_S00_AXI_ADDR_WIDTH - 2 );
constant C_NCYC_WAIT_FFT_CFG    : integer := 32;
constant C_NCYC_WAIT_FFT_RST    : integer := 32;
constant C_PSL                  : integer := C_S00_AXI_DATA_WIDTH;   
   
	-- component declaration
component NULL_SYMBOL_DETECTOR_v1_0_S00_AXI is
  generic ( 
	C_S_AXI_DATA_WIDTH	: integer	:= 32;
	C_S_AXI_ADDR_WIDTH	: integer	:= 7
  );
  port ( 
    SLV_REG_WRITE_F : out std_logic_vector( 128 - 1 downto 0 );
    SLV_REG_READ_F  : out std_logic_vector( 128 - 1 downto 0 );
  
    SLV_REG_0       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_1       : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_2       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_3       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_4       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_5       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_6       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_7       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_8       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_9       : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_10      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_11      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_12      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_13      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_14      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_15      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_16      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_17      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_18      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_19      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_20      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_21      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_22      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_23      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_24      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_25      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_26      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_27      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_28      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_29      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_30      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_31      : out std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_32      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_33      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_34      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_35      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_36      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_37      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_38      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_39      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_40      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_41      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_42      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_43      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_44      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_45      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_46      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_47      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_48      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_49      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_50      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_51      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_52      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_53      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_54      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_55      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_56      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_57      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_58      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_59      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_60      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_61      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_62      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_63      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_64      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_65      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_66      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_67      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_68      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_69      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_70      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_71      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_72      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_73      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_74      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_75      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_76      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_77      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_78      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_79      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_80      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_81      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_82      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_83      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_84      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_85      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_86      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_87      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_88      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_89      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_90      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_91      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_92      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_93      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_94      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_95      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_96      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_97      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_98      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_99      : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_100     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_101     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_102     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_103     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_104     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_105     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_106     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_107     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_108     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_109     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_110     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_111     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_112     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_113     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_114     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_115     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_116     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_117     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_118     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_119     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_120     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_121     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_122     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_123     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_124     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_125     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_126     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
    SLV_REG_127     : in  std_logic_vector( C_S_AXI_DATA_WIDTH - 1 downto 0 );
  
    S_AXI_ACLK      : in std_logic;
    S_AXI_ARESETN   : in std_logic;
    S_AXI_AWADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT    : in std_logic_vector(2 downto 0);
    S_AXI_AWVALID   : in std_logic;
    S_AXI_AWREADY   : out std_logic;
    S_AXI_WDATA     : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB     : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID    : in std_logic;
    S_AXI_WREADY    : out std_logic;
    S_AXI_BRESP     : out std_logic_vector(1 downto 0);
    S_AXI_BVALID    : out std_logic;
    S_AXI_BREADY    : in std_logic;
    S_AXI_ARADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT    : in std_logic_vector(2 downto 0);
    S_AXI_ARVALID   : in std_logic;
    S_AXI_ARREADY   : out std_logic;
    S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP     : out std_logic_vector(1 downto 0);
    S_AXI_RVALID    : out std_logic;
    S_AXI_RREADY    : in std_logic
  );
end component NULL_SYMBOL_DETECTOR_v1_0_S00_AXI;

--=============================================================
-- System Level Components 
--=============================================================
component Control_Register is
  generic ( 
    DATA_WIDTH      : integer := 32
  );
   
  port ( 
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    CTRL_REG_IN     : in  std_logic_vector( DATA_WIDTH - 1 downto 0 );
    CTRL_REG_OUT    : out std_logic_vector( DATA_WIDTH - 1 downto 0 );
    RESETP_OUT      : out std_logic;
    RESETN_OUT      : out std_logic
  );
end component Control_Register;

component Interrupt_Controller is    
  port ( 
    ACLK            : in  std_logic;
    ARESETN         : in  std_logic;
    SOFT_RESET      : in  std_logic;
    INTERNAL_IRQ_F  : in  std_logic; --flag 
    EXTERNAL_IRQ    : out std_logic;
    INT_ACK_F       : in  std_logic --flag
  );
end component Interrupt_Controller;

component AXI4_Stream_RegSlice is
   generic ( 
     C_AXIS_TDATA_WIDTH   :  integer := 32;
     C_AXIS_TUSER_WIDTH   :  integer := 0;
     C_BYPASS             :  boolean := false   
   );
   port ( 
     S_AXIS_TVALID        : in  std_logic;
     S_AXIS_TDATA         : in  std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
     S_AXIS_TUSER         : in  std_logic_vector( C_AXIS_TUSER_WIDTH - 1 downto 0 ) := ( others => '0' );
     S_AXIS_TLAST         : in  std_logic := '0';
     S_AXIS_TREADY        : out std_logic;

     M_AXIS_TVALID        : out std_logic;
     M_AXIS_TDATA         : out std_logic_vector( C_AXIS_TDATA_WIDTH - 1 downto 0 );
     M_AXIS_TUSER         : out std_logic_vector( C_AXIS_TUSER_WIDTH - 1 downto 0 );
     M_AXIS_TLAST         : out std_logic;
     M_AXIS_TREADY        : in  std_logic := '1';

     ACLK                 : in  std_logic;
     RESETN               : in  std_logic;
     RESETP               : in  std_logic := '0'
   );
end component AXI4_Stream_RegSlice;

component SymbolToneDetector is
  port (
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector( C_NSD_ABS_WIDTH - 1 downto 0 );
    S_AXIS_TREADY        : out std_logic;
    FRQ_IDX_REF          : in  std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
    FRQ_IDX_OUT          : out std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
    PEAK_SAMPLE_MAP      : in  std_logic_vector( C_NSD_N_FRQ * C_NSD_N_TONE - 1 downto 0 );
    SUM_NOISE_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    SUM_PEAKS_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    SYMB_DETECT_F        : out std_logic;
    BLOCK_READY_F        : out std_logic;
    R_NOISE              : in  unsigned( C_NSD_SCALE_BITS - 1 downto 0 );
    SD_STATE_OUT         : out T_SM_STATE; 
    TD_STATE_OUT         : out T_SM_STATE;
    DB_0                 : out std_logic_vector( 31 downto 0 );
    DB_1                 : out std_logic_vector( 31 downto 0 );
    DB_2                 : out std_logic_vector( 31 downto 0 );
    DB_3                 : out std_logic_vector( 31 downto 0 );
    DB_4                 : out std_logic_vector( 31 downto 0 );
    DB_5                 : out std_logic_vector( 31 downto 0 );
    DB_6                 : out std_logic_vector( 31 downto 0 );
    DB_7                 : out std_logic_vector( 31 downto 0 );
    DB_8                 : out std_logic_vector( 31 downto 0 );
    DB_9                 : out std_logic_vector( 31 downto 0 );
    DB_10                : out std_logic_vector( 31 downto 0 );
    DB_11                : out std_logic_vector( 31 downto 0 );
    ACLK                 : in  std_logic;
    RESETN               : in  std_logic;
    RESETP               : in  std_logic   
  );
end component SymbolToneDetector;


--============================
-- Processing System Interface
--============================
-- input registers from AXI lite port
signal slv_reg_00      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_02      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_03      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_04      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_05      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_06      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_07      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_08      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_09      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_10      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_11      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_12      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_13      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_14      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_15      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_16      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_17      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_18      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_19      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_20      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_21      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_22      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_23      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_24      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_25      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_26      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_27      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_28      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_29      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_30      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_31      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

-- output registers to AXI lite port
signal slv_reg_01      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_32      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_33      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_34      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_35      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_36      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_37      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_38      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_39      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_40      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_41      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_42      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_43      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_44      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_45      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_46      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_47      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_48      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_49      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_50      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_51      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_52      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_53      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_54      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_55      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_56      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_57      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_58      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_59      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_60      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_61      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_62      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_63      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_64      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_65      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_66      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_67      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_68      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_69      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_70      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_71      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_72      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_73      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_74      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_75      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_76      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_77      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_78      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_79      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_80      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_81      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_82      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_83      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_84      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_85      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_86      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_87      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_88      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_89      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_90      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_91      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_92      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_93      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_94      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_95      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_96      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_97      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_98      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_99      : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_100     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_101     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_102     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_103     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_104     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_105     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_106     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_107     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_108     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_109     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_110     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_111     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_112     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_113     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_114     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_115     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_116     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_117     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_118     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_119     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_120     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_121     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_122     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_123     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_124     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_125     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_126     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );
signal slv_reg_127     : std_logic_vector( C_S00_AXI_DATA_WIDTH - 1 downto 0 );

signal irq_i                     : std_logic;
signal int_rqst_f                : std_logic;


signal ps_gpo_reg                  : std_logic_vector( slv_reg_00'range );
signal ps_n_fft_reg                : std_logic_vector( slv_reg_00'range );
signal ps_n_symb_agc_reg           : std_logic_vector( slv_reg_00'range ); 
signal ps_n_symb_nsd_reg           : std_logic_vector( slv_reg_00'range ); 
signal ps_n_symb_prs_reg           : std_logic_vector( slv_reg_00'range ); 
signal ps_n_symb_dta_reg           : std_logic_vector( slv_reg_00'range ); 
signal ps_n_frame_block_reg        : std_logic_vector( slv_reg_00'range );
signal ps_n_cpre_reg               : std_logic_vector( slv_reg_00'range );
signal ps_r_noise_reg              : std_logic_vector( slv_reg_00'range );
signal ps_frq_idx_ref_reg          : std_logic_vector( slv_reg_00'range );     
signal ps_nsd_det_thr_reg          : std_logic_vector( slv_reg_00'range );
signal ps_chan_data_sel_reg        : std_logic_vector( slv_reg_00'range );
signal ps_nsd_tst_mode_reg         : std_logic_vector( slv_reg_00'range );
signal ps_sample_map_0_reg         : std_logic_vector( slv_reg_00'range );
signal ps_sample_map_1_reg         : std_logic_vector( slv_reg_00'range );
signal ps_sample_map_2_reg         : std_logic_vector( slv_reg_00'range );
signal ps_sample_map_3_reg         : std_logic_vector( slv_reg_00'range );


signal ctrl_reg                  : std_logic_vector( slv_reg_00'range );      
signal ctrl_reg_in               : std_logic_vector( slv_reg_00'range );
signal info_reg                  : std_logic_vector( slv_reg_00'range );
signal status_reg                : std_logic_vector( slv_reg_00'range );

signal resetn                    : std_logic;
signal resetp                    : std_logic;

signal ps_int_ack_f              : std_logic;
signal ps_start_f                : std_logic;
signal ps_stop_f                 : std_logic;
signal ps_sync_f                 : std_logic;

signal PSCDS                     : integer range 0 to C_NSD_N_CHAN - 1;

signal sys_resetn_b              : std_logic;
signal fifo_resetn_b             : std_logic;
signal fft_resetn_b              : std_logic;
signal fft_config_b              : std_logic;


signal ps_gpo                    : std_logic_vector( slv_reg_00'range );
signal ps_n_fft                  : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal ps_n_cpre                 : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal ps_n_symb_agc             : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );
signal ps_n_symb_nsd             : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );
signal ps_n_symb_prs             : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );
signal ps_n_symb_dta             : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );
signal ps_n_frame_block          : unsigned( clogb2( C_N_FRAMES_BLOCK_MAX ) - 1 downto 0 );
signal ps_r_noise                : unsigned( C_NSD_SCALE_BITS - 1 downto 0 );
signal ps_frq_idx_ref            : std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
signal ps_nsd_det_thr            : unsigned( clogb2( C_NSD_N_CHAN ) - 1 downto 0 );
signal ps_chan_data_sel          : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 downto 0 );
signal ps_nsd_tst_mode           : unsigned( C_NSD_TST_MODE_WIDTH - 1 downto 0 );

signal ps_sample_map_0           : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal ps_sample_map_1           : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal ps_sample_map_2           : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal ps_sample_map_3           : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal ps_sample_map             : std_logic_vector( C_NSD_N_FRQ * C_NSD_N_TONE - 1 downto 0 );

signal n_wd_symb_rxd             : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal n_wd_symb_fft             : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal n_wd_symb_prs             : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal n_wd_symb_dta             : unsigned( clogb2( C_N_FFT_MAX ) - 1 + 1 downto 0 );
signal n_symb_frame_rxd          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );
signal n_symb_frame_dta          : unsigned( clogb2( C_N_SYMBS_FRAME_MAX ) - 1 downto 0 );

type T_SLV_REG_ARRAY             is array ( integer range <> ) of std_logic_vector( slv_reg_00'range );
signal ps_in_db_0                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_1                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_2                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_3                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_4                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_5                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_6                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_7                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_8                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_9                : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_10               : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  
signal ps_in_db_11               : T_SLV_REG_ARRAY( C_NSD_N_CHAN - 1 downto 0 );  

--=======================================
-- Internally read AXI4 Handshake signals
--=======================================
signal s_axis_rxd_tready_i  : std_logic; 
signal m_axis_fft_tvalid_i  : std_logic; 
signal m_axis_prs_tvalid_i  : std_logic; 
signal m_axis_dta_tvalid_i  : std_logic; 

signal rx_data_valid         : std_logic; 
signal tx_data_valid         : std_logic; 

--============================
-- PRS and Data Output Section
--============================

signal data_rx_count         : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );

signal   txd_done_f          : std_logic;

constant TX_IDLE             : T_SM_STATE := C_SM_STATE_IDLE; 
constant TX_FFT              : T_SM_STATE := b"1010";
constant TX_WAIT_PRS         : T_SM_STATE := b"1100";
constant TX_PRS              : T_SM_STATE := b"1101";
constant TX_WAIT_DTA         : T_SM_STATE := b"1110";
constant TX_DTA              : T_SM_STATE := b"1111";
signal   tx_state            : T_SM_STATE;

signal   tx_fft_ctr          : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );
signal   tx_prs_ctr          : unsigned( 15 downto 0 );
signal   tx_dta_ctr          : unsigned( 23 downto 0 );
signal   tx_sym_ctr          : unsigned( 23 downto 0 );
signal   tx_frm_ctr          : unsigned( 23 downto 0 );
signal   rx_fft_ctr          : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );
signal   rx_rxd_ctr          : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );
signal   tx_prs_start        : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );
signal   tx_dta_start        : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );
signal   tx_dta_done_f       : std_logic;

signal   tx_restart_f        : std_logic;      
signal   ex_restart_f        : std_logic;      

signal   rx_rxd_valid        : std_logic;
signal   rx_fft_valid        : std_logic;
signal   tx_fft_valid        : std_logic;
signal   tx_prs_valid        : std_logic;
signal   tx_dta_valid        : std_logic;

--============================
-- Null symbol detection
--============================
constant NSD_IDLE            : T_SM_STATE := C_SM_STATE_IDLE;
constant NSD_WAIT_PASS_2     : T_SM_STATE := b"1011";
constant NSD_COMP_DATA       : T_SM_STATE := b"1111";
constant NSD_CALC_FRAME_IDX  : T_SM_STATE := b"1101";
signal nsd_state             : T_SM_STATE;

signal nsd_chan_sum_noise    : T_NSD_SUM_ARRAY  ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_sum_peaks    : T_NSD_SUM_ARRAY  ( C_NSD_N_CHAN - 1 downto 0 );

signal nsd_chan_symb_det_f   : std_logic_vector ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_blk_rdy_f    : std_logic_vector ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_det_b        : std_logic_vector( C_NSD_N_CHAN - 1 downto 0 );

signal nsd_chan_blk_idx      : T_NSD_DTA_CTR_ARRAY( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_blk_idx           : unsigned( C_NSD_DTA_CTR_WIDTH - 1 downto 0 );

signal nsd_chan_idx          : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 downto 0 );
signal nsd_sum_noise_idx     : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 downto 0 );
signal nsd_sum_peaks_idx     : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 downto 0 );
signal nsd_det_ctr           : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 + 1 downto 0 );

signal nsd_sum_noise_min     : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal nsd_sum_peaks_max     : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );

signal nsd_chan_det_idx      : unsigned( C_NSD_CHAN_IDX_WIDTH - 1 downto 0 );
signal nsd_symb_dta_idx      : unsigned( C_NSD_DTA_CTR_WIDTH  - 1 downto 0 );
signal nsd_symb_det_f        : std_logic;
signal nsd_symb_det_count    : unsigned( 23 downto 0 );

signal nsd_blk_rx_count      : unsigned( 23 downto 0 );


--=======================
-- Logging data for debug
--=======================
signal nsd_chan_det_hist_p   : T_NSD_SUM_ARRAY( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_frq_idx_p    : T_NSD_FRQ_IDX_ARRAY( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_sum_noise_p  : T_NSD_SUM_ARRAY  ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_sum_peaks_p  : T_NSD_SUM_ARRAY  ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_chan_det_p        : std_logic_vector ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_sd_state          : T_SM_STATE_ARRAY ( C_NSD_N_CHAN - 1 downto 0 );
signal nsd_td_state          : T_SM_STATE_ARRAY ( C_NSD_N_CHAN - 1 downto 0 );
  
--========================
-- Executive state machine
--========================
constant EX_IDLE             : T_SM_STATE := b"1001";
constant EX_WAIT_NSD         : T_SM_STATE := b"1011";
constant EX_WAIT_FFT_RST     : T_SM_STATE := b"1110";
constant EX_WAIT_FFT_CFG     : T_SM_STATE := b"1111";
constant EX_WAIT_FFT_CFG_ACK : T_SM_STATE := b"1101";
constant EX_TX_PRS           : T_SM_STATE := b"1100";
constant EX_TX_DATA          : T_SM_STATE := b"1000";
signal ex_state              : T_SM_STATE;
signal nsd_det_done          : std_logic;
signal txd_tx_done           : std_logic;
signal ex_timer              : unsigned( clogb2( max( C_NCYC_WAIT_FFT_CFG, C_NCYC_WAIT_FFT_RST )) - 1 downto 0 );
signal ex_start_f            : std_logic;

signal nsd_sys_resetp        : std_logic;
signal nsd_sys_resetn        : std_logic;
signal nsd_fft_resetn        : std_logic;
signal nsd_fifo_resetn       : std_logic;
signal ex_fft_cfg_rqst_f     : std_logic;

signal sys_resetn_i          : std_logic;
signal fft_resetn_i          : std_logic;
signal fft_cfg_rqst_i        : std_logic;
signal fifo_resetn_i         : std_logic;


--====================================
-- Abs squared input protocol havdling
--====================================
signal s_axis_abs_tdata       : T_NSD_ABS_TDATA;     

signal s_axis_abs_tvalid      : std_logic_vector( C_NSD_N_CHAN - 1 downto 0 );     
signal s_axis_abs_tready      : std_logic_vector( C_NSD_N_CHAN - 1 downto 0 );     

signal buf_abs_tvalid         : std_logic_vector( s_axis_abs_tvalid'range );
signal buf_abs_tdata          : T_NSD_ABS_TDATA;
signal buf_abs_tready         : std_logic_vector( s_axis_abs_tready'range );
signal buf_abs_tvalid_f       : std_logic;

signal nsd_axis_data_tready    : std_logic;

--========================
-- Stats gathering signals
--======================== 
signal rx_data_ctr             : unsigned( n_wd_symb_rxd'range    );   
signal rx_symbol_ctr           : unsigned( n_symb_frame_rxd'range );   
signal rx_frame_ctr            : unsigned( ps_n_frame_block'range );   
signal rx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX ) - 1 downto 0 );   

signal rx_data_ctr_p           : unsigned( 31 downto 0 ); 
signal rx_symbol_ctr_p         : unsigned( 31 downto 0 ); 
signal rx_frame_ctr_p          : unsigned( 31 downto 0 ); 
signal rx_block_ctr_p          : unsigned( 31 downto 0 );

signal tx_data_ctr             : unsigned( n_wd_symb_dta'range    );   
signal tx_symbol_ctr           : unsigned( n_symb_frame_dta'range );   
signal tx_frame_ctr            : unsigned( ps_n_frame_block'range );   
signal tx_block_ctr            : unsigned( clogb2( C_N_BLOCKS_MAX ) - 1 downto 0 );   

signal tx_data_ctr_p           : unsigned( 31 downto 0 ); 
signal tx_symbol_ctr_p         : unsigned( 31 downto 0 ); 
signal tx_frame_ctr_p          : unsigned( 31 downto 0 ); 
signal tx_block_ctr_p          : unsigned( 31 downto 0 );

signal rx_valid                : std_logic;
signal tx_valid                : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
NULL_SYMBOL_DETECTOR_v1_0_S00_AXI_inst : NULL_SYMBOL_DETECTOR_v1_0_S00_AXI
  generic map ( 
  	C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
  	C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
  )
  port map ( 
    SLV_REG_WRITE_F => open,
    SLV_REG_READ_F  => open,

    SLV_REG_0       => slv_reg_00,
    SLV_REG_1       => slv_reg_01,
    SLV_REG_2       => slv_reg_02,
    SLV_REG_3       => slv_reg_03,
    SLV_REG_4       => slv_reg_04,
    SLV_REG_5       => slv_reg_05,
    SLV_REG_6       => slv_reg_06,
    SLV_REG_7       => slv_reg_07,
    SLV_REG_8       => slv_reg_08,
    SLV_REG_9       => slv_reg_09,
    SLV_REG_10      => slv_reg_10,
    SLV_REG_11      => slv_reg_11,
    SLV_REG_12      => slv_reg_12,
    SLV_REG_13      => slv_reg_13,
    SLV_REG_14      => slv_reg_14,
    SLV_REG_15      => slv_reg_15,
    SLV_REG_16      => slv_reg_16,
    SLV_REG_17      => slv_reg_17,
    SLV_REG_18      => slv_reg_18,
    SLV_REG_19      => slv_reg_19,
    SLV_REG_20      => slv_reg_20,
    SLV_REG_21      => slv_reg_21,
    SLV_REG_22      => slv_reg_22,
    SLV_REG_23      => slv_reg_23,
    SLV_REG_24      => slv_reg_24,
    SLV_REG_25      => slv_reg_25,
    SLV_REG_26      => slv_reg_26,
    SLV_REG_27      => slv_reg_27,
    SLV_REG_28      => slv_reg_28,
    SLV_REG_29      => slv_reg_29,
    SLV_REG_30      => slv_reg_30,
    SLV_REG_31      => slv_reg_31,
    
    SLV_REG_32      => slv_reg_32,
    SLV_REG_33      => slv_reg_33,
    SLV_REG_34      => slv_reg_34,
    SLV_REG_35      => slv_reg_35,
    SLV_REG_36      => slv_reg_36,
    SLV_REG_37      => slv_reg_37,
    SLV_REG_38      => slv_reg_38,
    SLV_REG_39      => slv_reg_39,
    SLV_REG_40      => slv_reg_40,
    SLV_REG_41      => slv_reg_41,
    SLV_REG_42      => slv_reg_42,
    SLV_REG_43      => slv_reg_43,
    SLV_REG_44      => slv_reg_44,
    SLV_REG_45      => slv_reg_45,
    SLV_REG_46      => slv_reg_46,
    SLV_REG_47      => slv_reg_47,
    SLV_REG_48      => slv_reg_48,
    SLV_REG_49      => slv_reg_49,
    SLV_REG_50      => slv_reg_50,
    SLV_REG_51      => slv_reg_51,
    SLV_REG_52      => slv_reg_52,
    SLV_REG_53      => slv_reg_53,
    SLV_REG_54      => slv_reg_54,
    SLV_REG_55      => slv_reg_55,
    SLV_REG_56      => slv_reg_56,
    SLV_REG_57      => slv_reg_57,
    SLV_REG_58      => slv_reg_58,
    SLV_REG_59      => slv_reg_59,
    SLV_REG_60      => slv_reg_60,
    SLV_REG_61      => slv_reg_61,
    SLV_REG_62      => slv_reg_62,
    SLV_REG_63      => slv_reg_63,
    SLV_REG_64      => slv_reg_64,
    SLV_REG_65      => slv_reg_65,
    SLV_REG_66      => slv_reg_66,
    SLV_REG_67      => slv_reg_67,
    SLV_REG_68      => slv_reg_68,
    SLV_REG_69      => slv_reg_69,
    SLV_REG_70      => slv_reg_70,
    SLV_REG_71      => slv_reg_71,
    SLV_REG_72      => slv_reg_72,
    SLV_REG_73      => slv_reg_73,
    SLV_REG_74      => slv_reg_74,
    SLV_REG_75      => slv_reg_75,
    SLV_REG_76      => slv_reg_76,
    SLV_REG_77      => slv_reg_77,
    SLV_REG_78      => slv_reg_78,
    SLV_REG_79      => slv_reg_79,
    SLV_REG_80      => slv_reg_80,
    SLV_REG_81      => slv_reg_81,
    SLV_REG_82      => slv_reg_82,
    SLV_REG_83      => slv_reg_83,
    SLV_REG_84      => slv_reg_84,
    SLV_REG_85      => slv_reg_85,
    SLV_REG_86      => slv_reg_86,
    SLV_REG_87      => slv_reg_87,
    SLV_REG_88      => slv_reg_88,
    SLV_REG_89      => slv_reg_89,
    SLV_REG_90      => slv_reg_90,
    SLV_REG_91      => slv_reg_91,
    SLV_REG_92      => slv_reg_92,
    SLV_REG_93      => slv_reg_93,
    SLV_REG_94      => slv_reg_94,
    SLV_REG_95      => slv_reg_95,
    SLV_REG_96      => slv_reg_96,
    SLV_REG_97      => slv_reg_97,
    SLV_REG_98      => slv_reg_98,
    SLV_REG_99      => slv_reg_99,
    SLV_REG_100     => slv_reg_100,
    SLV_REG_101     => slv_reg_101,
    SLV_REG_102     => slv_reg_102,
    SLV_REG_103     => slv_reg_103,
    SLV_REG_104     => slv_reg_104,
    SLV_REG_105     => slv_reg_105,
    SLV_REG_106     => slv_reg_106,
    SLV_REG_107     => slv_reg_107,
    SLV_REG_108     => slv_reg_108,
    SLV_REG_109     => slv_reg_109,
    SLV_REG_110     => slv_reg_110,
    SLV_REG_111     => slv_reg_111,
    SLV_REG_112     => slv_reg_112,
    SLV_REG_113     => slv_reg_113,
    SLV_REG_114     => slv_reg_114,
    SLV_REG_115     => slv_reg_115,
    SLV_REG_116     => slv_reg_116,
    SLV_REG_117     => slv_reg_117,
    SLV_REG_118     => slv_reg_118,
    SLV_REG_119     => slv_reg_119,
    SLV_REG_120     => slv_reg_120,
    SLV_REG_121     => slv_reg_121,
    SLV_REG_122     => slv_reg_122,
    SLV_REG_123     => slv_reg_123,
    SLV_REG_124     => slv_reg_124,
    SLV_REG_125     => slv_reg_125,
    SLV_REG_126     => slv_reg_126,
    SLV_REG_127     => slv_reg_127,

  	S_AXI_ACLK	    => aclk,
  	S_AXI_ARESETN	=> aresetn,
  	S_AXI_AWADDR	=> s00_axi_awaddr,
  	S_AXI_AWPROT	=> s00_axi_awprot,
  	S_AXI_AWVALID	=> s00_axi_awvalid,
  	S_AXI_AWREADY	=> s00_axi_awready,
  	S_AXI_WDATA	    => s00_axi_wdata,
  	S_AXI_WSTRB	    => s00_axi_wstrb,
  	S_AXI_WVALID	=> s00_axi_wvalid,
  	S_AXI_WREADY	=> s00_axi_wready,
  	S_AXI_BRESP	    => s00_axi_bresp,
  	S_AXI_BVALID	=> s00_axi_bvalid,
  	S_AXI_BREADY	=> s00_axi_bready,
  	S_AXI_ARADDR	=> s00_axi_araddr,
  	S_AXI_ARPROT	=> s00_axi_arprot,
  	S_AXI_ARVALID	=> s00_axi_arvalid,
  	S_AXI_ARREADY	=> s00_axi_arready,
  	S_AXI_RDATA	    => s00_axi_rdata,
  	S_AXI_RRESP	    => s00_axi_rresp,
  	S_AXI_RVALID	=> s00_axi_rvalid,
  	S_AXI_RREADY	=> s00_axi_rready
  );

Control_Register_inst : Control_Register
  generic map ( 
    DATA_WIDTH => C_S00_AXI_DATA_WIDTH
   )
  port map ( 
    ACLK            => aclk,
    ARESETN         => aresetn,
    CTRL_REG_IN     => ctrl_reg,
    CTRL_REG_OUT    => ctrl_reg_in,
    RESETP_OUT      => resetp,
    RESETN_OUT      => resetn
    );
  
Interrupt_Controller_inst : Interrupt_Controller    
  port map ( 
    ACLK            => aclk,
    ARESETN         => resetn,
    SOFT_RESET      => nsd_sys_resetp,
    INTERNAL_IRQ_F  => int_rqst_f,
    EXTERNAL_IRQ    => irq_i,
    INT_ACK_F       => ps_int_ack_f
    );


--==============================================================
-- FFT array input data. This is in bit-reversed address format.
--==============================================================
s_axis_abs_tdata( 00 )   <= s00_axis_abs_tdata;
s_axis_abs_tdata( 01 )   <= s01_axis_abs_tdata;
s_axis_abs_tdata( 02 )   <= s02_axis_abs_tdata;
s_axis_abs_tdata( 03 )   <= s03_axis_abs_tdata;
s_axis_abs_tdata( 04 )   <= s04_axis_abs_tdata;
s_axis_abs_tdata( 05 )   <= s05_axis_abs_tdata;
s_axis_abs_tdata( 06 )   <= s06_axis_abs_tdata;
s_axis_abs_tdata( 07 )   <= s07_axis_abs_tdata;
s_axis_abs_tdata( 08 )   <= s08_axis_abs_tdata;
s_axis_abs_tdata( 09 )   <= s09_axis_abs_tdata;
s_axis_abs_tdata( 10 )   <= s10_axis_abs_tdata;
s_axis_abs_tdata( 11 )   <= s11_axis_abs_tdata;
s_axis_abs_tdata( 12 )   <= s12_axis_abs_tdata;
s_axis_abs_tdata( 13 )   <= s13_axis_abs_tdata;
s_axis_abs_tdata( 14 )   <= s14_axis_abs_tdata;
s_axis_abs_tdata( 15 )   <= s15_axis_abs_tdata;

--====================================================
-- FFT array handshake signals : tvalid
--====================================================
s_axis_abs_tvalid( 00 )  <= s00_axis_abs_tvalid;
s_axis_abs_tvalid( 01 )  <= s01_axis_abs_tvalid;
s_axis_abs_tvalid( 02 )  <= s02_axis_abs_tvalid;
s_axis_abs_tvalid( 03 )  <= s03_axis_abs_tvalid;
s_axis_abs_tvalid( 04 )  <= s04_axis_abs_tvalid;
s_axis_abs_tvalid( 05 )  <= s05_axis_abs_tvalid;
s_axis_abs_tvalid( 06 )  <= s06_axis_abs_tvalid;
s_axis_abs_tvalid( 07 )  <= s07_axis_abs_tvalid;
s_axis_abs_tvalid( 08 )  <= s08_axis_abs_tvalid;
s_axis_abs_tvalid( 09 )  <= s09_axis_abs_tvalid;
s_axis_abs_tvalid( 10 )  <= s10_axis_abs_tvalid;
s_axis_abs_tvalid( 11 )  <= s11_axis_abs_tvalid;
s_axis_abs_tvalid( 12 )  <= s12_axis_abs_tvalid;
s_axis_abs_tvalid( 13 )  <= s13_axis_abs_tvalid;
s_axis_abs_tvalid( 14 )  <= s14_axis_abs_tvalid;
s_axis_abs_tvalid( 15 )  <= s15_axis_abs_tvalid;

--====================================================
-- FFT array handshake signals : tready
--====================================================
s00_axis_abs_tready  <= s_axis_abs_tready( 00 );
s01_axis_abs_tready  <= s_axis_abs_tready( 01 );
s02_axis_abs_tready  <= s_axis_abs_tready( 02 );
s03_axis_abs_tready  <= s_axis_abs_tready( 03 );
s04_axis_abs_tready  <= s_axis_abs_tready( 04 );
s05_axis_abs_tready  <= s_axis_abs_tready( 05 );
s06_axis_abs_tready  <= s_axis_abs_tready( 06 );
s07_axis_abs_tready  <= s_axis_abs_tready( 07 );
s08_axis_abs_tready  <= s_axis_abs_tready( 08 );
s09_axis_abs_tready  <= s_axis_abs_tready( 09 );
s10_axis_abs_tready  <= s_axis_abs_tready( 10 );
s11_axis_abs_tready  <= s_axis_abs_tready( 11 );
s12_axis_abs_tready  <= s_axis_abs_tready( 12 );
s13_axis_abs_tready  <= s_axis_abs_tready( 13 );
s14_axis_abs_tready  <= s_axis_abs_tready( 14 );
s15_axis_abs_tready  <= s_axis_abs_tready( 15 );

--=======================================================
-- PS Interface - Slave registers and control/status bits
--=======================================================
ctrl_reg                    <= slv_reg_00;
ps_gpo_reg                  <= slv_reg_02;
ps_n_fft_reg                <= slv_reg_03;
ps_n_cpre_reg               <= slv_reg_04;
ps_n_symb_agc_reg           <= slv_reg_05;
ps_n_symb_nsd_reg           <= slv_reg_06;
ps_n_symb_prs_reg           <= slv_reg_07;
ps_n_symb_dta_reg           <= slv_reg_08;
ps_n_frame_block_reg        <= slv_reg_09;
ps_r_noise_reg              <= slv_reg_10;
ps_frq_idx_ref_reg          <= slv_reg_11;
ps_nsd_det_thr_reg          <= slv_reg_12;
ps_chan_data_sel_reg        <= slv_reg_13;
ps_nsd_tst_mode_reg         <= slv_reg_14;
ps_sample_map_0_reg         <= slv_reg_15;
ps_sample_map_1_reg         <= slv_reg_16;
ps_sample_map_2_reg         <= slv_reg_17;
ps_sample_map_3_reg         <= slv_reg_18;


ps_n_fft                    <= unsigned( ps_n_fft_reg( ps_n_fft'range ));
ps_n_cpre                   <= unsigned( ps_n_cpre_reg( ps_n_cpre'range ));
ps_n_symb_agc               <= unsigned( ps_n_symb_agc_reg( ps_n_symb_agc'range ));
ps_n_symb_nsd               <= unsigned( ps_n_symb_nsd_reg( ps_n_symb_nsd'range ));
ps_n_symb_prs               <= unsigned( ps_n_symb_prs_reg( ps_n_symb_prs'range ));
ps_n_symb_dta               <= unsigned( ps_n_symb_dta_reg( ps_n_symb_dta'range ));
ps_n_frame_block            <= unsigned( ps_n_frame_block_reg( ps_n_frame_block'range ));
ps_r_noise                  <= unsigned( ps_r_noise_reg( ps_r_noise'range ));
ps_frq_idx_ref              <= ps_frq_idx_ref_reg( ps_frq_idx_ref'range );     
ps_nsd_det_thr              <= unsigned( ps_nsd_det_thr_reg( ps_nsd_det_thr'range )); 
ps_chan_data_sel            <= unsigned( ps_chan_data_sel_reg( ps_chan_data_sel'range ));
ps_nsd_tst_mode             <= unsigned( ps_nsd_tst_mode_reg( ps_nsd_tst_mode'range ));
n_wd_symb_rxd               <= ps_n_fft + ps_n_cpre;
n_wd_symb_fft               <= ps_n_fft + ps_n_cpre;
n_wd_symb_prs               <= ps_n_fft;
n_wd_symb_dta               <= ps_n_fft;
n_symb_frame_rxd            <= ps_n_symb_agc + ps_n_symb_nsd + ps_n_symb_prs + ps_n_symb_dta;
n_symb_frame_dta            <= ps_n_symb_dta;

--============================================================
-- Sample maps for peaks should be the peak frequencies
-- msb of map is first sample, lsb last.
-- Here we reorder sample maps for bit-reversed FFT addressing
--============================================================
--ps_sample_map_0            <= bit_rev_idx_slv( ps_sample_map_0_reg( ps_sample_map_0'range ), ps_sample_map_0'length );
--ps_sample_map_1            <= bit_rev_idx_slv( ps_sample_map_1_reg( ps_sample_map_0'range ), ps_sample_map_0'length );
--ps_sample_map_2            <= bit_rev_idx_slv( ps_sample_map_2_reg( ps_sample_map_0'range ), ps_sample_map_0'length );
--ps_sample_map_3            <= bit_rev_idx_slv( ps_sample_map_3_reg( ps_sample_map_0'range ), ps_sample_map_0'length );
ps_sample_map_0            <= ps_sample_map_0_reg( ps_sample_map_0'range );
ps_sample_map_1            <= ps_sample_map_1_reg( ps_sample_map_0'range );
ps_sample_map_2            <= ps_sample_map_2_reg( ps_sample_map_0'range );
ps_sample_map_3            <= ps_sample_map_3_reg( ps_sample_map_0'range );
ps_sample_map              <= ps_sample_map_3 & ps_sample_map_2 & ps_sample_map_1 & ps_sample_map_0;

ps_int_ack_f               <= ctrl_reg_in( 1 );
ps_start_f                 <= ctrl_reg_in( 2 );
ps_stop_f                  <= ctrl_reg_in( 3 );
ps_sync_f                  <= ctrl_reg_in( 4 );


sys_resetn_b               <= ps_gpo_reg( 0 );
fifo_resetn_b              <= ps_gpo_reg( 1 );
fft_resetn_b               <= ps_gpo_reg( 2 );
fft_config_b               <= ps_gpo_reg( 3 );

info_reg                   <= C_DEVICE_ID & std_logic_vector( to_unsigned( C_N_SLV_REG, slv_reg_00'length - C_DEVICE_ID'length ) ); 
slv_reg_01                 <= info_reg;

status_reg( 0 )            <= resetp;
status_reg( 1 )            <= irq_i;
status_reg( 2 )            <= fft_cfg_done;
status_reg( 3 )            <= '0';

status_reg( 4 )            <= nsd_det_done; 
status_reg( 5 )            <= txd_tx_done;  
status_reg( 6 )            <= '0';
status_reg( 7 )            <= buf_abs_tvalid_f;

status_reg( 8 )            <= s_axis_rxd_tvalid;
status_reg( 9 )            <= s_axis_rxd_tready_i;
status_reg( 10 )           <= m_axis_fft_tvalid_i;
status_reg( 11 )           <= m_axis_fft_tready;
status_reg( 12 )           <= m_axis_prs_tvalid_i; 
status_reg( 13 )           <= m_axis_prs_tready;   
status_reg( 14 )           <= m_axis_dta_tvalid_i;   
status_reg( 15 )           <= m_axis_dta_tready;    

status_reg( 19 downto 16 ) <= ex_state;   
status_reg( 23 downto 20 ) <= nsd_state;   
status_reg( 27 downto 24 ) <= tx_state;   
status_reg( 28 )           <= sys_resetn_i;
status_reg( 29 )           <= fifo_resetn_i; 
status_reg( 30 )           <= fft_resetn_i;
status_reg( 31 )           <= fft_cfg_rqst_i;

PSCDS       <= to_integer( ps_chan_data_sel );


slv_reg_32  <= status_reg;
slv_reg_33  <= ( others => '0' ); 
slv_reg_34  <= ( others => '0' ); 
slv_reg_35  <= ( others => '0' ); 
slv_reg_36  <= ( others => '0' ); 
slv_reg_37  <= ( others => '0' );  
slv_reg_38  <= ( others => '0' );
slv_reg_39  <= to_slv_ul( nsd_blk_idx         , C_PSL );
slv_reg_40  <= to_slv_uh( nsd_blk_idx         , C_PSL );  


process( aclk )
begin    
  if rising_edge( aclk ) then
    if ps_sync_f = '1' then
      slv_reg_41  <= to_slv_vl( nsd_chan_frq_idx_p  ( PSCDS ), C_PSL );                                                               
      slv_reg_42  <= ( others=> '0' );   
      slv_reg_43  <= to_slv_u( nsd_chan_sum_noise_p ( PSCDS ), C_PSL );                                                              
      slv_reg_44  <= to_slv_u( nsd_chan_sum_peaks_p ( PSCDS ), C_PSL );                                                              
      slv_reg_45  <= to_slv_u( nsd_chan_det_hist_p  ( PSCDS ), C_PSL );                                            
      slv_reg_46  <= to_slv_v( ps_in_db_0           ( PSCDS ), C_PSL );                                                           
      slv_reg_47  <= to_slv_v( ps_in_db_1           ( PSCDS ), C_PSL );                                                           
      slv_reg_48  <= to_slv_v( ps_in_db_2           ( PSCDS ), C_PSL );                                                           
      slv_reg_49  <= to_slv_v( ps_in_db_3           ( PSCDS ), C_PSL );                                                           
      slv_reg_75  <= to_slv_v( ps_in_db_4           ( PSCDS ), C_PSL );                                                           
      slv_reg_76  <= to_slv_v( ps_in_db_5           ( PSCDS ), C_PSL );                                                           
      slv_reg_77  <= to_slv_v( ps_in_db_6           ( PSCDS ), C_PSL );                                                           
      slv_reg_78  <= to_slv_v( ps_in_db_7           ( PSCDS ), C_PSL );                                                           
      slv_reg_79  <= to_slv_v( ps_in_db_8           ( PSCDS ), C_PSL );                                                           
      slv_reg_80  <= to_slv_v( ps_in_db_9           ( PSCDS ), C_PSL );                                                           
      slv_reg_81  <= to_slv_v( ps_in_db_10          ( PSCDS ), C_PSL );                                                           
      slv_reg_82  <= to_slv_v( ps_in_db_11          ( PSCDS ), C_PSL );                                                           
      slv_reg_73  <= to_slv_v( nsd_sd_state         ( PSCDS ), C_PSL );
      slv_reg_74  <= to_slv_v( nsd_td_state         ( PSCDS ), C_PSL );
    end if;
  end if;
end process;

slv_reg_50  <= to_slv_u( nsd_blk_rx_count     , C_PSL );
slv_reg_51  <= to_slv_u( nsd_sum_peaks_max    , C_PSL );                                               
slv_reg_52  <= to_slv_u( nsd_sum_noise_min    , C_PSL );                                               
slv_reg_53  <= to_slv_u( nsd_det_ctr          , C_PSL );                                                                                   
slv_reg_54  <= to_slv_u( nsd_symb_det_count   , C_PSL );                                                                                
slv_reg_55  <= to_slv_v( nsd_chan_det_p       , C_PSL );                                                        
slv_reg_56  <= to_slv_u( rx_data_ctr_p        , C_PSL );        
slv_reg_57  <= to_slv_u( rx_symbol_ctr_p      , C_PSL );  
slv_reg_58  <= to_slv_u( rx_frame_ctr_p       , C_PSL );                                                               
slv_reg_59  <= to_slv_u( rx_block_ctr_p       , C_PSL );     
slv_reg_60  <= to_slv_u( tx_data_ctr_p        , C_PSL );        
slv_reg_61  <= to_slv_u( tx_symbol_ctr_p      , C_PSL );          
slv_reg_62  <= to_slv_u( tx_frame_ctr_p       , C_PSL );          
slv_reg_63  <= to_slv_u( tx_block_ctr_p       , C_PSL );                                                           

slv_reg_64  <= to_slv_v( s_axis_abs_tvalid    , C_PSL );
slv_reg_65  <= to_slv_v( s_axis_abs_tready    , C_PSL );
slv_reg_66  <= to_slv_v( buf_abs_tvalid       , C_PSL );
slv_reg_67  <= to_slv_v( buf_abs_tready       , C_PSL );
slv_reg_68  <= to_slv_v( ps_sample_map_0      , C_PSL );
slv_reg_69  <= to_slv_v( ps_sample_map_1      , C_PSL );
slv_reg_70  <= to_slv_v( ps_sample_map_2      , C_PSL );
slv_reg_71  <= to_slv_v( ps_sample_map_3      , C_PSL );
slv_reg_72  <= to_slv_u( ex_timer             , C_PSL );

slv_reg_83  <= ( others => '0' );
slv_reg_84  <= ( others => '0' );
slv_reg_85  <= to_slv_ul( nsd_symb_dta_idx    , C_PSL );
slv_reg_86  <= to_slv_uh( nsd_symb_dta_idx    , C_PSL );
slv_reg_87  <= to_slv_u( nsd_chan_det_idx     , C_PSL ); 
slv_reg_88  <= to_slv_u( nsd_sum_noise_idx    , C_PSL );
slv_reg_89  <= to_slv_u( nsd_sum_peaks_idx    , C_PSL );
slv_reg_90  <= to_slv_ul( rx_rxd_ctr          , C_PSL );
slv_reg_91  <= to_slv_uh( rx_rxd_ctr          , C_PSL );
slv_reg_92  <= to_slv_ul( rx_fft_ctr          , C_PSL );
slv_reg_93  <= to_slv_uh( rx_fft_ctr          , C_PSL );
slv_reg_94  <= to_slv_ul( tx_fft_ctr          , C_PSL );
slv_reg_95  <= to_slv_uh( tx_fft_ctr          , C_PSL );
slv_reg_96  <= to_slv_u( tx_prs_ctr           , C_PSL );
slv_reg_97  <= to_slv_u( tx_dta_ctr           , C_PSL );
slv_reg_98  <= to_slv_u( tx_sym_ctr           , C_PSL );
slv_reg_99  <= to_slv_ul( tx_prs_start        , C_PSL );
slv_reg_100 <= to_slv_uh( tx_prs_start        , C_PSL );
slv_reg_101 <= to_slv_ul( tx_dta_start        , C_PSL );
slv_reg_102 <= to_slv_uh( tx_dta_start        , C_PSL );
slv_reg_103 <= ( others => '0' );
slv_reg_104 <= ( others => '0' );
slv_reg_105 <= ( others => '0' );
slv_reg_106 <= ( others => '0' );
slv_reg_107 <= ( others => '0' );
slv_reg_108 <= ( others => '0' );
slv_reg_109 <= ( others => '0' );
slv_reg_110 <= ( others => '0' );
slv_reg_111 <= ( others => '0' );
slv_reg_112 <= ( others => '0' );
slv_reg_113 <= ( others => '0' );
slv_reg_114 <= ( others => '0' );
slv_reg_115 <= ( others => '0' );
slv_reg_116 <= ( others => '0' );
slv_reg_117 <= ( others => '0' );
slv_reg_118 <= ( others => '0' );
slv_reg_119 <= ( others => '0' );
slv_reg_120 <= ( others => '0' );
slv_reg_121 <= ( others => '0' );
slv_reg_122 <= ( others => '0' );
slv_reg_123 <= ( others => '0' );
slv_reg_124 <= ( others => '0' );
slv_reg_125 <= ( others => '0' );
slv_reg_126 <= ( others => '0' );
slv_reg_127 <= ( others => '0' );






--======================
-- GPO synchronisation
--======================
sys_resetn   <= sys_resetn_i;
fft_resetn   <= fft_resetn_i;
fft_cfg_rqst <= fft_cfg_rqst_i;
fifo_resetn  <= fifo_resetn_i;

gpo: process( aclk )
begin
  if rising_edge( aclk ) then
    if resetn = '0' then
      sys_resetn_i   <= '0';
      fifo_resetn_i  <= '0';
      fft_resetn_i   <= '0';
      fft_cfg_rqst_i <= '0';
    else
      sys_resetn_i   <= ( not sys_resetn_b  ) and nsd_sys_resetn;
      fifo_resetn_i  <= ( not fifo_resetn_b ) and nsd_fifo_resetn;
      fft_resetn_i   <= ( not fft_resetn_b  ) and nsd_fft_resetn;
      fft_cfg_rqst_i <= fft_config_b or ex_fft_cfg_rqst_f;
    end if;
  end if;
end process;



--==============  
-- Executive FSM
--==============
exec_fsm: process ( aclk )
begin
  if rising_edge( aclk )then
    if ( resetn = '0' ) then
      nsd_det_done       <= '0';
      txd_tx_done        <= '0';
      nsd_sys_resetp     <= '1';
      nsd_sys_resetn     <= '0';
      nsd_fft_resetn     <= '0';
      nsd_fifo_resetn    <= '0';
      ex_fft_cfg_rqst_f  <= '0';
      ex_start_f         <= '0';
      ex_restart_f       <= '0';
      ex_timer           <= ( others => '0' );
      ex_state           <= EX_IDLE;
    else 
      ex_start_f            <= '0';
      ex_restart_f          <= '0';
      ex_fft_cfg_rqst_f     <= '0';
      if ps_stop_f = '1' then
        nsd_det_done    <= '0';
        txd_tx_done     <= '0';
        ex_state        <= EX_IDLE;
      else
        case ex_state is
          when EX_IDLE =>
            nsd_sys_resetp      <= '0';
            nsd_sys_resetn      <= '1';
            nsd_fft_resetn      <= '1';
            nsd_fifo_resetn     <= '1';
            if ( ps_start_f or ex_restart_f ) = '1' then
              nsd_sys_resetp    <= '1';
              nsd_sys_resetn    <= '0';
              nsd_fft_resetn    <= '0';
              nsd_fifo_resetn   <= '0';
              nsd_det_done      <= '0';
              txd_tx_done       <= '0';
              ex_timer          <= ( others => '0' );
              ex_state          <= EX_WAIT_FFT_RST;
            end if;  
          
          when EX_WAIT_FFT_RST =>
            if ex_timer < C_NCYC_WAIT_FFT_RST - 1 then
              ex_timer          <= ex_timer + 1;
            else
              nsd_sys_resetp    <= '0';
              nsd_sys_resetn    <= '1';
              nsd_fft_resetn    <= '1';
              nsd_fifo_resetn   <= '1';
              ex_timer          <= ( others => '0' );
              ex_state          <= EX_WAIT_FFT_CFG;
            end if;
          
          when EX_WAIT_FFT_CFG =>
            if ex_timer < C_NCYC_WAIT_FFT_CFG - 1 then
              ex_timer          <= ex_timer + 1;
            else
              ex_fft_cfg_rqst_f <= '1';
              ex_state          <= EX_WAIT_FFT_CFG_ACK;
            end if;
            
          when EX_WAIT_FFT_CFG_ACK =>
            if fft_cfg_done = '1' then
              ex_start_f        <= '1';
              ex_state          <= EX_WAIT_NSD;
            end if;
              
          when EX_WAIT_NSD =>
            if nsd_symb_det_f  = '1' then 
              nsd_det_done      <= '1'; 
              ex_state          <= EX_TX_DATA;
            end if;
        
          when EX_TX_DATA =>  
            if tx_dta_done_f = '1' then 
              if tx_restart_f = '1' then
                ex_restart_f    <= '1';
              else 
                txd_tx_done     <= '1'; 
              end if;
            end if; 
            ex_state        <= EX_IDLE;
                       
          when others =>
            null;
        end case;
      end if;
      
    end if;
  end if;
end process;

--=======================================
-- Data Output Section
--=======================================

rx_rxd_valid           <= s_axis_rxd_tready_i and s_axis_rxd_tvalid;
rx_fft_valid           <= buf_abs_tvalid_f;                      
tx_fft_valid           <= m_axis_fft_tvalid_i and m_axis_fft_tready;
tx_prs_valid           <= m_axis_prs_tvalid_i and m_axis_prs_tready;
tx_dta_valid           <= m_axis_dta_tvalid_i and m_axis_dta_tready;

m_axis_fft_tdata       <= s_axis_rxd_tdata;
m_axis_prs_tdata       <= s_axis_rxd_tdata;
m_axis_dta_tdata       <= s_axis_rxd_tdata;
m_axis_fft_tvalid      <= m_axis_fft_tvalid_i; 
m_axis_prs_tvalid      <= m_axis_prs_tvalid_i; 
m_axis_dta_tvalid      <= m_axis_dta_tvalid_i; 
s_axis_rxd_tready      <= s_axis_rxd_tready_i; 

txrx_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      tx_fft_ctr    <= ( others => '0' );
      tx_prs_ctr    <= ( others => '0' );
      tx_dta_ctr    <= ( others => '0' );
      tx_sym_ctr    <= ( others => '0' );
      tx_frm_ctr    <= ( others => '0' );
      rx_fft_ctr    <= ( others => '0' );
      rx_rxd_ctr    <= ( others => '0' );
      tx_prs_start  <= ( others => '0' );
      tx_dta_start  <= ( others => '0' );
      tx_dta_done_f <= '0';
      tx_restart_f  <= '0';  
      tx_state      <= TX_IDLE;
    else
      tx_dta_done_f <= '0';
      tx_restart_f  <= '0';  
    
      if rx_rxd_valid = '1' then
        rx_rxd_ctr  <= rx_rxd_ctr + 1;
      end if;
      
      case tx_state is
        when TX_IDLE =>
          tx_fft_ctr    <= ( others => '0' );
          tx_prs_ctr    <= ( others => '0' );
          tx_dta_ctr    <= ( others => '0' );
          tx_sym_ctr    <= ( others => '0' );
          tx_frm_ctr    <= ( others => '0' );
          rx_fft_ctr    <= ( others => '0' );
          rx_rxd_ctr    <= ( others => '0' );
          tx_prs_start  <= ( others => '0' );
          tx_dta_start  <= ( others => '0' );

          if ( ex_start_f or tx_restart_f )= '1' then
            tx_state <= TX_FFT;
          end if;      
        
        when TX_FFT  =>
          if tx_fft_valid = '1' then
             tx_fft_ctr <= tx_fft_ctr + 1;
          end if;
          if rx_fft_valid = '1' then
            rx_fft_ctr <= rx_fft_ctr + 1;
          end if;
          
          if nsd_symb_det_f = '1' then
            tx_prs_start <= ps_n_fft + shift_right( ps_n_cpre, 1 ) + nsd_symb_dta_idx - nsd_chan_det_idx - C_NSD_N_TONE * C_NSD_N_CHAN;
            tx_state     <= TX_WAIT_PRS;
          end if;
                         
        when TX_WAIT_PRS =>
          if rx_rxd_ctr = tx_prs_start - 1 then
            tx_prs_ctr     <= ( others => '0' );
            tx_state       <= TX_PRS;
          end if;          

        when TX_PRS =>
          if tx_prs_valid = '1' then
            tx_prs_ctr <= tx_prs_ctr + 1;
            if tx_prs_ctr = n_wd_symb_prs - 1 then
              tx_sym_ctr   <= ( others => '0' );
              tx_dta_start <= tx_prs_start + n_wd_symb_rxd;
              tx_state     <= TX_WAIT_DTA;
            end if;
          end if;    
          
        when TX_WAIT_DTA =>
          if rx_rxd_valid = '1' then
            if rx_rxd_ctr = tx_dta_start - 1 then
              tx_dta_start <= tx_dta_start + n_wd_symb_rxd;
              tx_dta_ctr   <= ( others =>'0' );
              tx_state     <= TX_DTA;
            end if;
          end if;

        when TX_DTA =>
          if tx_dta_valid = '1' then
            tx_dta_ctr          <= tx_dta_ctr + 1;
            if tx_dta_ctr = n_wd_symb_dta - 1 then
              tx_sym_ctr        <= tx_sym_ctr + 1;
              tx_dta_ctr        <= ( others => '0' );
              if tx_sym_ctr = n_symb_frame_dta - 1 then
                tx_frm_ctr <= tx_frm_ctr + 1;
                if tx_frame_ctr = ps_n_frame_block - 1 then
                  tx_restart_f  <= '1';
                end if;
                tx_dta_done_f   <= '1';
                tx_state        <= TX_IDLE;
              else
                tx_state        <= TX_WAIT_DTA;
              end if;
            end if;
          end if;
          
        when others  =>
          null;
                    
      end case;
    end if;
  end if;
end process;

process( s_axis_rxd_tvalid, m_axis_fft_tready, m_axis_prs_tready, m_axis_dta_tready, tx_state )
begin
  case tx_state is
    when TX_IDLE =>
      m_axis_fft_tvalid_i    <= '0';
      m_axis_prs_tvalid_i    <= '0';
      m_axis_dta_tvalid_i    <= '0';
      s_axis_rxd_tready_i    <= '0';
    when TX_FFT =>
      m_axis_fft_tvalid_i    <= s_axis_rxd_tvalid;
      m_axis_prs_tvalid_i    <= '0';
      m_axis_dta_tvalid_i    <= '0';
      s_axis_rxd_tready_i    <= m_axis_fft_tready;
    when TX_PRS =>
      m_axis_prs_tvalid_i    <= s_axis_rxd_tvalid;
      m_axis_fft_tvalid_i    <= '0';
      m_axis_dta_tvalid_i    <= '0';
      s_axis_rxd_tready_i    <= m_axis_prs_tready;
    when TX_DTA =>
      m_axis_dta_tvalid_i    <= s_axis_rxd_tvalid;
      m_axis_fft_tvalid_i    <= '0';
      m_axis_prs_tvalid_i    <= '0';
      s_axis_rxd_tready_i    <= m_axis_dta_tready;
    when others =>
      m_axis_fft_tvalid_i    <= '0';
      m_axis_prs_tvalid_i    <= '0';
      m_axis_dta_tvalid_i    <= '0';
      s_axis_rxd_tready_i    <= '1';
  end case;
end process;

--===================================================
-- Manage receive data counter - this is 48 bits long
-- and will overflow about one month after a reset
--===================================================
data_rx: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      data_rx_count <= ( others => '0' );

    else
      if rx_data_valid = '1' then
        data_rx_count <= data_rx_count + 1;
      end if;

    end if;
  end if;
end process;


nsd_blk_rx_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      nsd_blk_rx_count <= ( others => '0' );

    else
      if nsd_chan_blk_rdy_f = ones( nsd_chan_blk_rdy_f'length ) then
        nsd_blk_rx_count <= nsd_blk_rx_count + 1;
      end if;

    end if;
  end if;
end process;






--==========================================================
-- NULL SYMBOL DETECTION
-- Null symbol is multiple tones
-- Null detection is largely handled by the comparator block
--==========================================================
--===================================================
-- Abs-squared Data Input
-- Synchronises FFT input frames
-- Also sets tready to allow 
-- rxd FIFO data to be discarded during
-- null symbol detection
--===================================================

buf_abs_tvalid_f <= '1' when buf_abs_tvalid = ( buf_abs_tvalid'range => '1' ) else '0';

--=======================================
-- C_NSD_NTONE Channels of tone detection
--=======================================
gen_tone_det:
for i in 0 to C_NSD_N_CHAN - 1 generate 

slice_i: AXI4_Stream_RegSlice
  generic map (
    C_AXIS_TDATA_WIDTH => C_NSD_ABS_WIDTH,
    C_AXIS_TUSER_WIDTH => 0,
    C_BYPASS           => false
  )
  port map (
    S_AXIS_TVALID      => s_axis_abs_tvalid( i ),
    S_AXIS_TDATA       => s_axis_abs_tdata( i ),
    S_AXIS_TREADY      => s_axis_abs_tready( i ),
        
    M_AXIS_TVALID      => buf_abs_tvalid( i ),
    M_AXIS_TDATA       => buf_abs_tdata( i ),
    M_AXIS_TREADY      => buf_abs_tready( i ),

    ACLK               => aclk,
    RESETN             => resetn,
    RESETP             => nsd_sys_resetp
);

tone_det_i: SymbolToneDetector
  port map (
    S_AXIS_TVALID               => buf_abs_tvalid_f,
    S_AXIS_TDATA                => buf_abs_tdata( i ),
    S_AXIS_TREADY               => buf_abs_tready( i ),
    FRQ_IDX_REF                 => ps_frq_idx_ref,
    FRQ_IDX_OUT                 => nsd_chan_frq_idx_p( i ),
    PEAK_SAMPLE_MAP             => ps_sample_map,
    SUM_NOISE_OUT               => nsd_chan_sum_noise( i ),
    SUM_PEAKS_OUT               => nsd_chan_sum_peaks( i ),
    SYMB_DETECT_F               => nsd_chan_symb_det_f( i ),
    BLOCK_READY_F               => nsd_chan_blk_rdy_f( i ),
    R_NOISE                     => ps_r_noise,
    SD_STATE_OUT                => nsd_sd_state( i ),
    TD_STATE_OUT                => nsd_td_state( i ),
    DB_0                        => ps_in_db_0( i ),
    DB_1                        => ps_in_db_1( i ),
    DB_2                        => ps_in_db_2( i ),
    DB_3                        => ps_in_db_3( i ),
    DB_4                        => ps_in_db_4( i ),
    DB_5                        => ps_in_db_5( i ),
    DB_6                        => ps_in_db_6( i ),
    DB_7                        => ps_in_db_7( i ),
    DB_8                        => ps_in_db_8( i ),
    DB_9                        => ps_in_db_9( i ),
    DB_10                       => ps_in_db_10( i ),
    DB_11                       => ps_in_db_11( i ),
    ACLK                        => aclk,
    RESETN                      => resetn,
    RESETP                      => nsd_sys_resetp
  );
end generate;

--=========================================================
-- This process ensures data from two successive blocks are
-- compared, detection can cross block 
-- boundaries
--=========================================================
--=======================================================
-- Process to acquire detection data and calulate metrics
--=======================================================

nsd_blk_idx_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      nsd_blk_idx         <= ( others => '0' );
    else
      if nsd_chan_blk_rdy_f = ones( nsd_chan_blk_rdy_f'length ) then
        nsd_blk_idx       <= rx_fft_ctr - 1;
      end if;
    end if;
  end if;
end process;

symb_detect_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      nsd_det_ctr          <= ( others => '0' );
      nsd_chan_det_idx     <= ( others => '0' );
      nsd_chan_blk_idx     <= ( others=> ( others => '0' ));
      nsd_symb_det_f       <= '0';
      nsd_symb_det_count   <= ( others => '0' );
      nsd_symb_dta_idx     <= ( others => '0' );
      nsd_sum_noise_min    <= ( others => '1' );
      nsd_sum_noise_idx    <= ( others => '0' );
      nsd_sum_peaks_max    <= ( others => '0' );
      nsd_sum_peaks_idx    <= ( others => '0' );

      nsd_chan_det_p       <= ( others => '0' );
      nsd_chan_det_idx     <= ( others => '0' );
      nsd_chan_det_hist_p  <= ( others => ( others => '0' ));
      nsd_chan_sum_noise_p <= ( others => ( others => '0' ));
      nsd_chan_sum_peaks_p <= ( others => ( others => '0' ));
      nsd_state            <= NSD_IDLE;

    else
      nsd_symb_det_f       <= '0';
      if tx_state = TX_FFT then
        case nsd_state is
          when NSD_IDLE =>
            if nsd_chan_blk_rdy_f = ones( nsd_chan_blk_rdy_f'length ) then
              if nsd_chan_symb_det_f /= zeros( nsd_chan_symb_det_f'length ) then 
                nsd_chan_det_b            <= nsd_chan_symb_det_f;
                for i in C_NSD_N_CHAN - 1 downto 0 loop
                  if nsd_chan_symb_det_f( i ) = '1' then
                    nsd_chan_blk_idx( i ) <= nsd_blk_idx;
                  end if;
                end loop;              
                nsd_state                 <= NSD_WAIT_PASS_2;
              end if;
            end if;
           
          when NSD_WAIT_PASS_2 =>
            if nsd_chan_blk_rdy_f = ones( nsd_chan_blk_rdy_f'length ) then
              nsd_chan_det_b       <= nsd_chan_det_b or nsd_chan_symb_det_f;
              for i in C_NSD_N_CHAN - 1 downto 0 loop
                if nsd_chan_symb_det_f( i ) = '1' then
                  nsd_chan_blk_idx( i )  <= nsd_blk_idx;
                end if;
              end loop;              
              nsd_chan_idx         <= ( others => '0' );
              nsd_sum_noise_min    <= ( others => '1' );
              nsd_sum_noise_idx    <= ( others => '0' );
              nsd_sum_peaks_max    <= ( others => '0' );
              nsd_sum_peaks_idx    <= ( others => '0' );
              nsd_det_ctr          <= ( others => '0' );
              nsd_state            <= NSD_COMP_DATA;
            end if;
           
          when NSD_COMP_DATA =>
            if nsd_chan_det_b( to_integer( nsd_chan_idx )) = '1' then
              nsd_chan_det_hist_p( to_integer( nsd_chan_idx ))   <= nsd_chan_det_hist_p( to_integer( nsd_chan_idx )) + 1;
              if nsd_chan_sum_noise( to_integer( nsd_chan_idx )) <= nsd_sum_noise_min then
                nsd_sum_noise_min  <= nsd_chan_sum_noise( to_integer( nsd_chan_idx ));
                nsd_sum_noise_idx  <= nsd_chan_idx;
              end if;
              if nsd_chan_sum_peaks( to_integer( nsd_chan_idx )) >= nsd_sum_peaks_max then
                nsd_sum_peaks_max  <= nsd_chan_sum_peaks( to_integer( nsd_chan_idx ) );
                nsd_sum_peaks_idx  <= nsd_chan_idx;
              end if;
              nsd_det_ctr          <= nsd_det_ctr + 1;
            end if;
            if nsd_chan_idx < C_NSD_N_CHAN - 1 then
              nsd_chan_idx         <= nsd_chan_idx + 1;
            else
              nsd_state            <= NSD_CALC_FRAME_IDX;
            end if;   
  
          when NSD_CALC_FRAME_IDX =>
            nsd_chan_det_p         <= nsd_chan_det_b;
            if nsd_det_ctr > ps_nsd_det_thr then
              if nsd_sum_noise_idx < nsd_sum_peaks_idx then
                nsd_chan_det_idx   <= nsd_sum_noise_idx;
                nsd_symb_dta_idx   <= nsd_chan_blk_idx( to_integer( nsd_sum_noise_idx ));
              else
                nsd_chan_det_idx   <= nsd_sum_peaks_idx;
                nsd_symb_dta_idx   <= nsd_chan_blk_idx( to_integer( nsd_sum_peaks_idx ));
              end if;
              nsd_chan_sum_noise_p <= nsd_chan_sum_noise;
              nsd_chan_sum_peaks_p <= nsd_chan_sum_peaks;
              nsd_symb_det_f       <= '1';
              nsd_symb_det_count   <= nsd_symb_det_count + 1;
            end if;
            nsd_state              <= NSD_IDLE;
             
          when others =>
           null;
        end case;
      end if;
    end if;
  end if;
end process;  

--=====================
-- Statistics Gathering
--=====================
-- how these counters work, even at 100 MHz, defeats me. 
-- But they are debug only.

rx_valid <= '1' when (s_axis_rxd_tvalid   = '1' and s_axis_rxd_tready_i = '1') else '0';
tx_valid <= '1' when (m_axis_dta_tvalid_i = '1' and m_axis_dta_tready   = '1') else '0';

stats_p: process( aclk )
begin
  if rising_edge( aclk ) then
    if ( resetn and nsd_sys_resetn ) = '0' then
      int_rqst_f      <= '0';

      rx_data_ctr     <= ( others=> '0' );
      rx_symbol_ctr   <= ( others=> '0' );
      rx_frame_ctr    <= ( others=> '0' );
      rx_block_ctr    <= ( others=> '0' );    
                          
      rx_data_ctr_p   <= ( others=> '0' );
      rx_symbol_ctr_p <= ( others=> '0' );
      rx_frame_ctr_p  <= ( others=> '0' );
      rx_block_ctr_p  <= ( others=> '0' );    

      tx_data_ctr     <= ( others=> '0' );
      tx_symbol_ctr   <= ( others=> '0' );
      tx_frame_ctr    <= ( others=> '0' );
      tx_block_ctr    <= ( others=> '0' );    
                   
      tx_data_ctr_p   <= ( others=> '0' );
      tx_symbol_ctr_p <= ( others=> '0' );
      tx_frame_ctr_p  <= ( others=> '0' );
      tx_block_ctr_p  <= ( others=> '0' );    
    
    else 
      int_rqst_f <= '0';

      if rx_valid = '1' then
        rx_data_ctr_p        <= rx_data_ctr_p + 1;
        if rx_data_ctr < n_wd_symb_rxd - 1 then  
          rx_data_ctr        <= rx_data_ctr + 1;
        else
          rx_data_ctr        <= ( others=> '0' );
          rx_symbol_ctr_p    <= rx_symbol_ctr_p + 1;
        end if;
        
        if rx_data_ctr = n_wd_symb_rxd - 1 then
          if rx_symbol_ctr < n_symb_frame_rxd - 1 then 
            rx_symbol_ctr    <= rx_symbol_ctr + 1;
          else
            rx_symbol_ctr    <= ( others=> '0' );
            rx_frame_ctr_p   <= rx_frame_ctr_p + 1;
          end if;
        end if;
         
        if rx_symbol_ctr = n_symb_frame_rxd - 1 and rx_data_ctr = n_wd_symb_rxd - 1 then
          if rx_frame_ctr < ps_n_frame_block - 1 then
            rx_frame_ctr   <= rx_frame_ctr + 1;
          else
            rx_frame_ctr   <= ( others=> '0' );
            rx_block_ctr_p <= rx_block_ctr_p + 1;
            rx_block_ctr   <= rx_block_ctr + 1;
          end if;
        end if;
      end if; -- rx_valid = '1'

      if tx_valid = '1' then
        tx_data_ctr_p      <= tx_data_ctr_p + 1;
        if tx_data_ctr < n_wd_symb_dta - 1 then  
          tx_data_ctr      <= tx_data_ctr + 1;
        else
          tx_data_ctr      <= ( others=> '0' );
          tx_symbol_ctr_p  <= tx_symbol_ctr_p + 1;
        end if;
        
        if tx_data_ctr = n_wd_symb_dta - 1 then
          if tx_symbol_ctr < n_symb_frame_dta - 1 then 
            tx_symbol_ctr  <= tx_symbol_ctr + 1;
          else
            tx_symbol_ctr  <= ( others=> '0' );
            tx_frame_ctr_p <= tx_frame_ctr_p + 1;
          end if;
        end if;
         
        if tx_symbol_ctr = n_symb_frame_dta - 1 and tx_data_ctr = n_wd_symb_dta - 1 then
          if tx_frame_ctr < ps_n_frame_block - 1 then
            tx_frame_ctr   <= tx_frame_ctr + 1;
          else
            tx_frame_ctr   <= ( others=> '0' );
            tx_block_ctr_p <= tx_block_ctr_p + 1;
            tx_block_ctr   <= tx_block_ctr + 1;
          end if;
        end if;
      end if; -- tx_valid = '1'
      
    end if;
  end if;
  
end process;



end rtl;


--============================================================
--============================================================
-- Component Definition Section
--============================================================
--============================================================



--============================================================
-- Symbol Tone Detector - Detects a sequence of tone blocks
--============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity SymbolToneDetector is
  port (
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector( C_NSD_ABS_WIDTH - 1 downto 0 );
    S_AXIS_TREADY        : out std_logic; 
    FRQ_IDX_REF          : in  std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
    FRQ_IDX_OUT          : out std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
    PEAK_SAMPLE_MAP      : in  std_logic_vector( C_NSD_N_FRQ * C_NSD_N_TONE - 1 downto 0 );
    SUM_NOISE_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    SUM_PEAKS_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    SYMB_DETECT_F        : out std_logic;
    BLOCK_READY_F        : out std_logic;
    R_NOISE              : in  unsigned( C_NSD_SCALE_BITS - 1 downto 0 );
    SD_STATE_OUT         : out T_SM_STATE;
    TD_STATE_OUT         : out T_SM_STATE;
    DB_0                 : out std_logic_vector( 31 downto 0 );
    DB_1                 : out std_logic_vector( 31 downto 0 );
    DB_2                 : out std_logic_vector( 31 downto 0 );
    DB_3                 : out std_logic_vector( 31 downto 0 );
    DB_4                 : out std_logic_vector( 31 downto 0 );
    DB_5                 : out std_logic_vector( 31 downto 0 );
    DB_6                 : out std_logic_vector( 31 downto 0 );
    DB_7                 : out std_logic_vector( 31 downto 0 );
    DB_8                 : out std_logic_vector( 31 downto 0 );
    DB_9                 : out std_logic_vector( 31 downto 0 );
    DB_10                : out std_logic_vector( 31 downto 0 );
    DB_11                : out std_logic_vector( 31 downto 0 );
    ACLK                 : in  std_logic;
    RESETN               : in  std_logic;
    RESETP               : in  std_logic   
  );
end SymbolToneDetector;

architecture rtl of SymbolToneDetector is

component BlockToneDetector is
  port (
    S_AXIS_TVALID        : in  std_logic;
    S_AXIS_TDATA         : in  std_logic_vector( C_NSD_ABS_WIDTH - 1 downto 0 );
    S_AXIS_TREADY        : out std_logic;
    PEAK_SAMPLE_MAP_IN   : in  std_logic_vector( C_NSD_N_FRQ * C_NSD_N_TONE - 1 downto 0 );
    SUM_NOISE_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    SUM_PEAKS_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
    FRQ_IDX_OUT          : out unsigned( C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
    TONE_DETECT_F        : out std_logic;
    BLOCK_READY_F        : out std_logic;
    R_NOISE              : in  unsigned( C_NSD_SCALE_BITS - 1 downto 0 );
    TD_STATE_OUT         : out T_SM_STATE;
    DB_0                 : out std_logic_vector( 31 downto 0 );
    DB_1                 : out std_logic_vector( 31 downto 0 );
    DB_2                 : out std_logic_vector( 31 downto 0 );
    DB_3                 : out std_logic_vector( 31 downto 0 );
    DB_4                 : out std_logic_vector( 31 downto 0 );
    DB_5                 : out std_logic_vector( 31 downto 0 );
    DB_6                 : out std_logic_vector( 31 downto 0 );
    DB_7                 : out std_logic_vector( 31 downto 0 );
    ACLK                 : in  std_logic;
    RESETN               : in  std_logic;
    RESETP               : in  std_logic
  );
end component BlockToneDetector;


--=========================================================================
-- Eack block tone detector saves the indices of the 4 last detected blocks
-- The PS must organise the detection template accordingly
--=========================================================================
signal det_sum_noise      : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal det_sum_peaks      : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal det_frq_idx        : unsigned( C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
signal det_tone_det_f     : std_logic;
signal det_blk_rdy_f      : std_logic;


signal symb_frq_idx_reg   : std_logic_vector( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
signal symb_sum_noise_reg : T_NSD_SUM_ARRAY(  C_NSD_N_BLK - 1 downto 0 );
signal symb_sum_peaks_reg : T_NSD_SUM_ARRAY(  C_NSD_N_BLK - 1 downto 0 );
signal symb_sum_noise     : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal symb_sum_peaks     : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );

constant SD_IDLE          : T_SM_STATE := C_SM_STATE_IDLE;
constant SD_BLOCK_END     : T_SM_STATE := b"1011";
signal   sd_state         : T_SM_STATE;

signal symb_blk_ctr       : unsigned( 15 downto 0 );

begin

tone_detect: BlockToneDetector
port map (
  S_AXIS_TVALID        => S_AXIS_TVALID,
  S_AXIS_TDATA         => S_AXIS_TDATA,
  S_AXIS_TREADY        => S_AXIS_TREADY,
  PEAK_SAMPLE_MAP_IN   => PEAK_SAMPLE_MAP,
  SUM_NOISE_OUT        => det_sum_noise,
  SUM_PEAKS_OUT        => det_sum_peaks,
  FRQ_IDX_OUT          => det_frq_idx,
  TONE_DETECT_F        => det_tone_det_f,
  BLOCK_READY_F        => det_blk_rdy_f,
  R_NOISE              => R_NOISE,
  TD_STATE_OUT         => TD_STATE_OUT,
  DB_0                 => DB_0,
  DB_1                 => DB_1,
  DB_2                 => DB_2,
  DB_3                 => DB_3,
  DB_4                 => DB_4,
  DB_5                 => DB_5,
  DB_6                 => DB_6,
  DB_7                 => DB_7,
  ACLK                 => ACLK,
  RESETP               => RESETP,
  RESETN               => RESETN
  );

SD_STATE_OUT <= sd_state;


symb_det: process( ACLK )
begin
  if rising_edge( ACLK ) then
    if RESETP = '1' or RESETN = '0' then
      BLOCK_READY_F       <= '0';
      SYMB_DETECT_F       <= '0';
      sd_state            <= SD_IDLE;
      symb_blk_ctr        <= ( others => '0' );
      DB_8                <= ( others => '0' );
      DB_9                <= ( others => '0' );
      DB_10               <= ( others => '0' );
      DB_11               <= ( others => '0' );
    else
      BLOCK_READY_F       <= '0';
      SYMB_DETECT_F       <= '0';
      case sd_state is
        when SD_IDLE =>  
          if det_blk_rdy_f = '1' then
            if det_tone_det_f = '0' then
              symb_frq_idx_reg   <= ( others => '0' );
              symb_sum_noise_reg <= ( others => ( others => '0' ));
              symb_sum_peaks_reg <= ( others => ( others => '0' ));
              symb_sum_noise     <= ( others => '0' );
              symb_sum_peaks     <= ( others => '0' );
              symb_blk_ctr       <= ( others => '0' );
            else
              symb_frq_idx_reg   <= std_logic_vector( det_frq_idx )  & symb_frq_idx_reg ( C_NSD_N_BLK * C_NSD_FRQ_IDX_WIDTH - 1 downto C_NSD_FRQ_IDX_WIDTH );
              symb_sum_noise_reg <= det_sum_noise & symb_sum_noise_reg ( C_NSD_N_BLK - 1 downto 1 );
              symb_sum_peaks_reg <= det_sum_peaks & symb_sum_peaks_reg ( C_NSD_N_BLK - 1 downto 1 );
              symb_sum_noise     <= symb_sum_noise + det_sum_noise - symb_sum_noise_reg( 0 );
              symb_sum_peaks     <= symb_sum_peaks + det_sum_peaks - symb_sum_peaks_reg( 0 );
              symb_blk_ctr       <= symb_blk_ctr + 1;
            end if;
            sd_state <= SD_BLOCK_END;
          end if;  
          
        when SD_BLOCK_END =>
          BLOCK_READY_F   <= '1';
          FRQ_IDX_OUT     <= symb_frq_idx_reg;
          if symb_frq_idx_reg = FRQ_IDX_REF then
            SYMB_DETECT_F <= '1';
            SUM_NOISE_OUT <= symb_sum_noise;
            SUM_PEAKS_OUT <= symb_sum_peaks;
            DB_11         <= to_slv_u( symb_blk_ctr, DB_10'length );
            symb_blk_ctr  <= ( others => '0' );
          end if;
          sd_state        <= SD_IDLE;
          DB_9            <= to_slv_u( symb_sum_peaks,   DB_9'length );
          DB_8            <= to_slv_u( symb_sum_noise,   DB_8'length );
        when others =>
          null;
      end case;      
    end if;
  end if;
end process;


end rtl;

  

--============================================================
-- Block Tone Detector - Detects a tone block of N_TONE length
--============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.emm_telsys.all;

entity BlockToneDetector is
port (
  S_AXIS_TVALID        : in  std_logic;
  S_AXIS_TDATA         : in  std_logic_vector( C_NSD_ABS_WIDTH - 1 downto 0 );
  S_AXIS_TREADY        : out std_logic;
  PEAK_SAMPLE_MAP_IN   : in  std_logic_vector( C_NSD_N_FRQ * C_NSD_N_TONE - 1 downto 0 );
  SUM_NOISE_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
  SUM_PEAKS_OUT        : out unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
  FRQ_IDX_OUT          : out unsigned( C_NSD_FRQ_IDX_WIDTH - 1 downto 0 );
  TONE_DETECT_F        : out std_logic;
  BLOCK_READY_F        : out std_logic;
  R_NOISE              : in  unsigned( C_NSD_SCALE_BITS - 1 downto 0 );
  TD_STATE_OUT         : out T_SM_STATE;
  DB_0                 : out std_logic_vector( 31 downto 0 );
  DB_1                 : out std_logic_vector( 31 downto 0 );
  DB_2                 : out std_logic_vector( 31 downto 0 );
  DB_3                 : out std_logic_vector( 31 downto 0 );
  DB_4                 : out std_logic_vector( 31 downto 0 );
  DB_5                 : out std_logic_vector( 31 downto 0 );
  DB_6                 : out std_logic_vector( 31 downto 0 );
  DB_7                 : out std_logic_vector( 31 downto 0 );
  ACLK                 : in  std_logic;
  RESETN               : in  std_logic;
  RESETP               : in  std_logic
  );
end BlockToneDetector;

architecture rtl of BlockToneDetector is


signal peak_sample_map_0    : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal peak_sample_map_1    : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal peak_sample_map_2    : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );
signal peak_sample_map_3    : std_logic_vector( C_NSD_N_TONE - 1 downto 0 );

signal block_data_ctr       : unsigned( rangeLeft( C_NSD_N_TONE ) downto 0 );
signal block_rdy_f          : std_logic;
signal sum_peaks            : T_NSD_SUM_ARRAY( C_NSD_N_FRQ - 1 downto 0 );
signal sum_block            : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal sum_peaks_s          : T_NSD_SUM_ARRAY( C_NSD_N_FRQ - 1 downto 0 );
signal sum_block_s          : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );

signal frq_idx              : integer range 0 to 3;
signal frq_idx_out_i        : unsigned( FRQ_IDX_OUT'range );  
signal sum_noise_out_i      : unsigned( SUM_NOISE_OUT'range );
signal sum_peaks_out_i      : unsigned( SUM_PEAKS_OUT'range );



constant TD_IDLE            : T_SM_STATE := C_SM_STATE_IDLE;
constant TD_CALC_SCALED_MAX : T_SM_STATE := b"1011";
constant TD_OUTPUT          : T_SM_STATE := b"1111";
signal td_state             : T_SM_STATE;

signal sum_block_r_noise    : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal sum_block_shr        : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
signal r_noise_mul          : unsigned( C_NSD_SCALE_BITS - 1 downto 0 );

signal td_shft_ctr          : unsigned( clogb2( C_NSD_SCALE_BITS - 1 ) - 1 downto 0 );

begin

TD_STATE_OUT         <= td_state;

S_AXIS_TREADY        <= S_AXIS_TVALID;
--====================================================
-- Get block data. First word of block is always noise
-- Block then contains peaks and noise, specified by 
--  bitmaps received from next level
--====================================================
get_block: process( ACLK )
--variable sum_peaks : T_NSD_SUM_ARRAY( C_NSD_N_FRQ - 1 downto 0 );
--variable sum_block : unsigned( C_NSD_SUM_WIDTH - 1 downto 0 );
begin
  if rising_edge( ACLK ) then
    if RESETP = '1' or RESETN = '0' then
      block_data_ctr <= ( others => '0' ); 
      block_rdy_f    <= '0'; 
     else
      block_rdy_f    <= '0';
      if S_AXIS_TVALID = '1' then
        block_data_ctr <= block_data_ctr + 1;
        if block_data_ctr = 0 then
          peak_sample_map_0 <= PEAK_SAMPLE_MAP_IN( 1 * C_NSD_N_TONE - 2 downto 0 * C_NSD_N_TONE ) & '0';
          peak_sample_map_1 <= PEAK_SAMPLE_MAP_IN( 2 * C_NSD_N_TONE - 2 downto 1 * C_NSD_N_TONE ) & '0';
          peak_sample_map_2 <= PEAK_SAMPLE_MAP_IN( 3 * C_NSD_N_TONE - 2 downto 2 * C_NSD_N_TONE ) & '0';
          peak_sample_map_3 <= PEAK_SAMPLE_MAP_IN( 4 * C_NSD_N_TONE - 2 downto 3 * C_NSD_N_TONE ) & '0';
          sum_block          <= ( others => '0' ); -- discard DC term;
--          sum_block      <= resize( unsigned( S_AXIS_TDATA ), sum_block'length );
          sum_peaks( 0 ) <= ( others => '0' );          
          sum_peaks( 1 ) <= ( others => '0' );          
          sum_peaks( 2 ) <= ( others => '0' );          
          sum_peaks( 3 ) <= ( others => '0' );          
          sum_block_s    <= sum_block;
          sum_peaks_s    <= sum_peaks;
          block_rdy_f    <= '1';
        else 
          sum_block           <= sum_block + resize( unsigned( S_AXIS_TDATA ), sum_block'length );
          peak_sample_map_0   <= peak_sample_map_0( peak_sample_map_0'left - 1 downto 0 ) & '0';
          peak_sample_map_1   <= peak_sample_map_1( peak_sample_map_1'left - 1 downto 0 ) & '0';
          peak_sample_map_2   <= peak_sample_map_2( peak_sample_map_2'left - 1 downto 0 ) & '0';
          peak_sample_map_3   <= peak_sample_map_3( peak_sample_map_3'left - 1 downto 0 ) & '0';
          if peak_sample_map_0( peak_sample_map_0'left ) = '1' then sum_peaks( 0 ) <= sum_peaks( 0 ) + resize( unsigned( S_AXIS_TDATA ), sum_peaks( 0 )'length ); end if; 
          if peak_sample_map_1( peak_sample_map_1'left ) = '1' then sum_peaks( 1 ) <= sum_peaks( 1 ) + resize( unsigned( S_AXIS_TDATA ), sum_peaks( 1 )'length ); end if; 
          if peak_sample_map_2( peak_sample_map_2'left ) = '1' then sum_peaks( 2 ) <= sum_peaks( 2 ) + resize( unsigned( S_AXIS_TDATA ), sum_peaks( 2 )'length ); end if; 
          if peak_sample_map_3( peak_sample_map_3'left ) = '1' then sum_peaks( 3 ) <= sum_peaks( 3 ) + resize( unsigned( S_AXIS_TDATA ), sum_peaks( 3 )'length ); end if; 
        end if;
        --sum_block_reg        <= sum_block;
        
--        for i in C_NSD_N_FRQ - 1 downto 0 loop
--          if block_data_ctr = 0 then
--            peak_sample_map( i ) <= PEAK_SAMPLE_MAP_IN( ( i + 1 ) * C_NSD_N_TONE - 1 - 1 downto i * C_NSD_N_TONE ) & '0';
--            sum_peaks( i ) := ( others => '0' );
--          else
--            sum_peaks( i ) := sum_peaks_reg( i );
--            if peak_sample_map( i )( peak_sample_map( i )'left ) = '1' then
--              sum_peaks( i ) := sum_peaks( i ) + resize( unsigned( S_AXIS_TDATA ), sum_peaks( i )'length );
--            end if;
--            peak_sample_map( i ) <= peak_sample_map( i )( peak_sample_map( i )'left - 1  downto 0 ) & '0';
--          end if;
--        end loop;
--        sum_peaks_reg <= sum_peaks; 

--        if block_data_ctr < C_NSD_N_TONE - 1 then 
--          block_data_ctr     <= block_data_ctr + 1;
--        else
--          sum_peaks_s        <= sum_peaks;
--          sum_block_s        <= sum_block;
--          block_data_ctr     <= ( others => '0' );
--          block_rdy_f        <= '1';  
--        end if;
        
      end if;
    end if;
  end if;
end process;

FRQ_IDX_OUT   <= frq_idx_out_i;  
SUM_NOISE_OUT <= sum_noise_out_i;
SUM_PEAKS_OUT <= sum_peaks_out_i;

frq_idx   <= 0 when ( sum_peaks_s( 0 ) >= sum_peaks_s( 1 ) ) 
                and ( sum_peaks_s( 0 ) >= sum_peaks_s( 2 ) )
                and ( sum_peaks_s( 0 ) >= sum_peaks_s( 3 ) ) else  
             1 when ( sum_peaks_s( 1 ) >= sum_peaks_s( 0 ) ) 
                and ( sum_peaks_s( 1 ) >= sum_peaks_s( 2 ) )
                and ( sum_peaks_s( 1 ) >= sum_peaks_s( 3 ) ) else
             2 when ( sum_peaks_s( 2 ) >= sum_peaks_s( 0 ) ) 
                and ( sum_peaks_s( 2 ) >= sum_peaks_s( 1 ) )
                and ( sum_peaks_s( 2 ) >= sum_peaks_s( 3 ) ) else 
             3; 

tone_detect: process( aclk )
begin
  if rising_edge( ACLK ) then
    if RESETP = '1' or RESETN = '0' then
      frq_idx_out_i   <= ( others => '0' );
      sum_noise_out_i <= ( others => '0' );
      sum_peaks_out_i <= ( others => '0' );
      TONE_DETECT_F   <= '0';
      BLOCK_READY_F   <= '0';
      DB_0            <= ( others => '0' );
      DB_1            <= ( others => '0' );
      DB_2            <= ( others => '0' );
      DB_3            <= ( others => '0' );
      DB_4            <= ( others => '0' );
      DB_5            <= ( others => '0' );
      DB_6            <= ( others => '0' );
      DB_7            <= ( others => '0' );
      td_state        <= TD_IDLE;
    else
      BLOCK_READY_F <= '0';
      TONE_DETECT_F <= '0';
      
      case td_state is
      
        when TD_IDLE =>
          if block_rdy_f = '1' then
            sum_block_r_noise  <= ( others => '0' );
            sum_block_shr      <= sum_block_s;
            r_noise_mul        <= R_NOISE;
            td_shft_ctr        <= ( others => '0' );
            TD_STATE           <= TD_CALC_SCALED_MAX;
          end if;
          
        when TD_CALC_SCALED_MAX =>
          sum_block_shr  <= shift_right( sum_block_shr, 1 );
          r_noise_mul    <= shift_left( r_noise_mul, 1 );
          
          if r_noise_mul( r_noise_mul'left ) = '1' then
            sum_block_r_noise <= sum_block_r_noise + sum_block_shr;
          end if;
          
          if td_shft_ctr < C_NSD_SCALE_BITS - 1 then
            td_shft_ctr  <= td_shft_ctr + 1;
          else
            td_state     <= TD_OUTPUT;
          end if;
     
        when TD_OUTPUT =>
          frq_idx_out_i    <= to_unsigned( frq_idx, frq_idx_out_i'length );
          sum_noise_out_i  <= sum_block_s - sum_peaks_s( frq_idx );
          sum_peaks_out_i  <= sum_peaks_s( frq_idx );
          DB_0             <= to_slv_u( sum_block_s, DB_0'length );
          DB_1             <= to_slv_u( sum_block_r_noise, DB_1'length );
          DB_2             <= to_slv_u( sum_peaks_s( 0 ), DB_1'length );
          DB_3             <= to_slv_u( sum_peaks_s( 1 ), DB_1'length );
          DB_4             <= to_slv_u( sum_peaks_s( 2 ), DB_1'length );
          DB_5             <= to_slv_u( sum_peaks_s( 3 ), DB_1'length );
          DB_6             <= to_slv_i( frq_idx, DB_1'length ); 
          if sum_peaks_s( frq_idx ) > sum_block_r_noise then
            TONE_DETECT_F  <= '1';
          end if;
          BLOCK_READY_F    <= '1';
          td_state         <= TD_IDLE;
          
--          for i in C_NSD_N_FRQ - 1 downto 0 loop
--            if sum_peaks_s( i ) > sum_block_r_noise then
--              frq_idx_out_i    <= to_unsigned( i, FRQ_IDX_OUT'length );
--              sum_noise_out_i  <= sum_block_s - sum_peaks_s( i );
--              sum_peaks_out_i  <= sum_peaks_s( i );
--              TONE_DETECT_F    <= '1';
--              DB_1             <= to_slv_u( sum_peaks_s( i ), DB_1'length );
--              exit;
--            else
--              frq_idx_out_i    <= ( others => '0' );
--              sum_noise_out_i  <= ( others => '0' );     
--              sum_peaks_out_i  <= ( others => '0' );                   
--              DB_1             <= to_slv_u( sum_peaks_s( 0 ), DB_1'length );
--            end if;
--          end loop;

                 
        when others =>
          null;
      end case;          
    end if;
  end if;
end process;


end rtl;
  